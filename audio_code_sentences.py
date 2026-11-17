
import json
import re
from pathlib import Path

import numpy as np
import soundfile as sf
import torch

from parler_tts import ParlerTTSForConditionalGeneration
from transformers import AutoTokenizer


# --------------------------------------------------
# CONFIGURATION
# --------------------------------------------------

MODEL_ID = "ai4bharat/indic-parler-tts"

JSON_PATH = Path("swar_practice_sentences.json")

OUTPUT_DIR = Path("assets/sounds/sentences")

# Keep the same voice for all generated sentences.
VOICE_DESCRIPTION = (
    "Aryan's voice speaks Sanskrit clearly and naturally, "
    "at a moderate and steady pace. The recording is very clear, "
    "with a close microphone and almost no background noise."
)

# Use float16 on your NVIDIA GPU to reduce VRAM usage.
DEVICE = "cuda" if torch.cuda.is_available() else "cpu"
DTYPE = torch.float16 if DEVICE == "cuda" else torch.float32


# --------------------------------------------------
# LOAD DATASET
# --------------------------------------------------

if not JSON_PATH.exists():
    raise FileNotFoundError(
        f"Could not find {JSON_PATH.resolve()}"
    )

with open(JSON_PATH, "r", encoding="utf-8") as file:
    dataset = json.load(file)

# --------------------------------------------------
# LOAD MODEL
# --------------------------------------------------

print(f"Loading model on {DEVICE}...")

model = ParlerTTSForConditionalGeneration.from_pretrained(
    MODEL_ID,
    torch_dtype=DTYPE,
).to(DEVICE)

model.eval()

tokenizer = AutoTokenizer.from_pretrained(MODEL_ID)

description_tokenizer = AutoTokenizer.from_pretrained(
    model.config.text_encoder._name_or_path
)

# Tokenize voice description once.
description_inputs = description_tokenizer(
    VOICE_DESCRIPTION,
    return_tensors="pt"
).to(DEVICE)

# --------------------------------------------------
# AUDIO GENERATION
# --------------------------------------------------

def clean_filename(text):
    """Make a safe filename."""
    return re.sub(r"[^a-zA-Z0-9_-]", "_", text)


def generate_audio(sanskrit_text, output_path):

    prompt_inputs = tokenizer(
        sanskrit_text,
        return_tensors="pt"
    ).to(DEVICE)

    with torch.inference_mode():
        generated_audio = model.generate(
            input_ids=description_inputs.input_ids,
            attention_mask=description_inputs.attention_mask,
            prompt_input_ids=prompt_inputs.input_ids,
            prompt_attention_mask=prompt_inputs.attention_mask,
        )

    # Convert to float32 before saving.
    audio = generated_audio.detach().cpu().numpy().squeeze()
    audio = np.asarray(audio, dtype=np.float32)

    # Save as mono, 16-bit PCM WAV.
    sf.write(
        str(output_path),
        audio,
        model.config.sampling_rate,
        subtype="PCM_16"
    )


# --------------------------------------------------
# GENERATE ALL SENTENCES
# --------------------------------------------------

total = 0
skipped = 0
failed = 0

for category_data in dataset["sentences"]:

    category = category_data["category"]

    category_folder = OUTPUT_DIR / clean_filename(category)
    category_folder.mkdir(parents=True, exist_ok=True)

    print(f"\nCategory: {category}")

    for sentence in category_data["sentences"]:

        sentence_id = sentence["id"]
        sanskrit_text = sentence["sanskrit"]

        output_path = category_folder / f"{sentence_id}.wav"

        # Skip already generated audio.
        if output_path.exists():
            print(f"SKIPPED: {sentence_id}")
            skipped += 1
            continue

        try:
            print(f"Generating: {sentence_id}")
            print(f"Text: {sanskrit_text}")

            generate_audio(sanskrit_text, output_path)

            print(f"SAVED: {output_path}")
            total += 1

        except Exception as error:
            print(f"FAILED: {sentence_id} - {error}")
            failed += 1

        if DEVICE == "cuda":
            torch.cuda.empty_cache()


# --------------------------------------------------
# SUMMARY
# --------------------------------------------------

print("\n========== GENERATION COMPLETE ==========")
print(f"Generated: {total}")
print(f"Skipped:   {skipped}")
print(f"Failed:    {failed}")
print(f"Output:    {OUTPUT_DIR.resolve()}")
