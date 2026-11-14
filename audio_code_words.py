
import json
import re
import torch
import soundfile as sf
from pathlib import Path
from transformers import AutoTokenizer
from parler_tts import ParlerTTSForConditionalGeneration

# --------------------------------------------------
# CONFIGURATION
# --------------------------------------------------

MODEL_ID = "ai4bharat/indic-parler-tts"

JSON_FILE = Path("swar_practice_words.json")
OUTPUT_DIR = Path("assets/sounds/words")

VOICE_DESCRIPTION = (
    "A clear, natural Sanskrit pronunciation by a single adult speaker. "
    "The speaker has a steady, neutral voice, speaks slowly and clearly, "
    "with accurate Sanskrit articulation and consistent volume. "
    "The recording is high quality, close and clear, "
    "with no background music or background noise."
)

SKIP_EXISTING = True

# --------------------------------------------------
# DEVICE
# --------------------------------------------------

device = "cuda:0" if torch.cuda.is_available() else "cpu"

print("Using device:", device)

dtype = torch.float16 if torch.cuda.is_available() else torch.float32

if torch.cuda.is_available():
    print("GPU:", torch.cuda.get_device_name(0))

# --------------------------------------------------
# LOAD MODEL
# --------------------------------------------------

print("\nLoading Indic Parler-TTS model...")

model = ParlerTTSForConditionalGeneration.from_pretrained(
    MODEL_ID,
    torch_dtype=dtype
).to(device)

# Tokenizer for Sanskrit text
tokenizer = AutoTokenizer.from_pretrained(MODEL_ID)

# Separate tokenizer for voice description
description_tokenizer = AutoTokenizer.from_pretrained(
    model.config.text_encoder._name_or_path
)

model.eval()

sample_rate = model.config.sampling_rate

print("Model loaded successfully!")
print("Sample rate:", sample_rate)

# --------------------------------------------------
# HELPER: SAFE FILE NAME
# --------------------------------------------------

def safe_filename(text):
    text = text.lower().strip()
    text = re.sub(r"[^a-zA-Z0-9_-]+", "_", text)
    return text.strip("_") or "word"


# --------------------------------------------------
# PREPARE VOICE DESCRIPTION TOKENS
# --------------------------------------------------

description_inputs = description_tokenizer(
    VOICE_DESCRIPTION,
    return_tensors="pt"
).to(device)

# --------------------------------------------------
# GENERATE ONE WORD
# --------------------------------------------------

def generate_audio(sanskrit_word, output_path):

    if SKIP_EXISTING and output_path.exists():
        print("Already exists:", output_path.name)
        return "skipped"

    prompt_inputs = tokenizer(
        sanskrit_word,
        return_tensors="pt"
    ).to(device)

    with torch.inference_mode():

        generation = model.generate(
            input_ids=description_inputs.input_ids,
            attention_mask=description_inputs.attention_mask,

            prompt_input_ids=prompt_inputs.input_ids,
            prompt_attention_mask=prompt_inputs.attention_mask
        )

    # Convert generated audio to float32 for WAV saving
    audio = (
        generation
        .detach()
        .cpu()
        .float()
        .numpy()
        .squeeze()
    )

    output_path.parent.mkdir(
        parents=True,
        exist_ok=True
    )

    sf.write(
        str(output_path),
        audio,
        sample_rate,
        subtype="PCM_16"
    )

    print("Generated:", output_path.name)

    return "generated"


# --------------------------------------------------
# LOAD WORD DATA
# --------------------------------------------------

if not JSON_FILE.exists():
    raise FileNotFoundError(
        f"JSON file not found: {JSON_FILE.resolve()}"
    )

with open(JSON_FILE, "r", encoding="utf-8") as file:
    data = json.load(file)

sections = {
    "swar": data.get("swar", []),
    "vyanjan": data.get("vyanjan", [])
}

total_words = sum(
    len(letter.get("words", []))
    for letters in sections.values()
    for letter in letters
)

print("\nTotal words to process:", total_words)

# --------------------------------------------------
# PROCESS ALL WORDS
# --------------------------------------------------

generated_count = 0
skipped_count = 0
failed_count = 0

for section_name, letters in sections.items():

    print(f"\n========== {section_name.upper()} ==========")

    for letter_index, letter_data in enumerate(letters, start=1):

        letter = letter_data["letter"]

        letter_name = safe_filename(
            letter_data.get("transliteration", letter)
        )

        words = letter_data.get("words", [])

        for word_index, word_data in enumerate(words, start=1):

            sanskrit_word = word_data["sanskrit"]

            word_name = safe_filename(
                word_data.get(
                    "transliteration",
                    f"word_{word_index}"
                )
            )

            # Unique filename using letter and word indices
            filename = (
                f"{letter_index:02d}_"
                f"{letter_name}_"
                f"{word_index:02d}_"
                f"{word_name}.wav"
            )

            output_path = (
                OUTPUT_DIR
                / section_name
                / filename
            )

            print(
                f"\n{section_name} | "
                f"{letter} | {sanskrit_word}"
            )

            try:

                result = generate_audio(
                    sanskrit_word,
                    output_path
                )

                if result == "generated":
                    generated_count += 1

                elif result == "skipped":
                    skipped_count += 1

            except Exception as error:

                failed_count += 1

                print(
                    f"FAILED: {sanskrit_word} | {error}"
                )

            finally:
                if torch.cuda.is_available():
                    torch.cuda.empty_cache()

# --------------------------------------------------
# FINAL SUMMARY
# --------------------------------------------------

print("\n================================")
print("AUDIO GENERATION COMPLETED")
print("================================")

print("Total words:", total_words)
print("Newly generated:", generated_count)
print("Already existing:", skipped_count)
print("Failed:", failed_count)

print("\nOutput folder:")
print(OUTPUT_DIR.resolve())

print("\nSwar folder:")
print((OUTPUT_DIR / "swar").resolve())

print("\nVyanjan folder:")
print((OUTPUT_DIR / "vyanjan").resolve())
