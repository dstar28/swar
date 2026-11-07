import 'dart:convert';

// Practice Words content supplied in swar_practice_words.json.
// Kept as a local Dart constant so this screen does not require an asset
// declaration or any backend/API integration.
const String _practiceWordsJson = r'''{
  "title": "Swar Sanskrit Practice Words",
  "version": "1.0",
  "notes": [
    "Each letter is mapped to practice words with transliteration and English meaning.",
    "ॠ, ऌ, ॡ and some consonants have very few common initial-word examples; rare/advanced entries are marked.",
    "अं and अः are included as app practice units, though anusvāra and visarga are not vowels in the strict phonetic classification."
  ],
  "swar": [
    {
      "letter": "अ",
      "transliteration": "a",
      "words": [
        {
          "sanskrit": "अग्निः",
          "transliteration": "agniḥ",
          "meaning": "fire"
        },
        {
          "sanskrit": "अश्वः",
          "transliteration": "aśvaḥ",
          "meaning": "horse"
        },
        {
          "sanskrit": "अमरः",
          "transliteration": "amaraḥ",
          "meaning": "immortal"
        }
      ]
    },
    {
      "letter": "आ",
      "transliteration": "ā",
      "words": [
        {
          "sanskrit": "आकाशः",
          "transliteration": "ākāśaḥ",
          "meaning": "sky"
        },
        {
          "sanskrit": "आचार्यः",
          "transliteration": "ācāryaḥ",
          "meaning": "teacher"
        },
        {
          "sanskrit": "आनन्दः",
          "transliteration": "ānandaḥ",
          "meaning": "joy"
        }
      ]
    },
    {
      "letter": "इ",
      "transliteration": "i",
      "words": [
        {
          "sanskrit": "इन्दुः",
          "transliteration": "induḥ",
          "meaning": "moon"
        },
        {
          "sanskrit": "इच्छा",
          "transliteration": "icchā",
          "meaning": "wish"
        },
        {
          "sanskrit": "इति",
          "transliteration": "iti",
          "meaning": "thus"
        }
      ]
    },
    {
      "letter": "ई",
      "transliteration": "ī",
      "words": [
        {
          "sanskrit": "ईश्वरः",
          "transliteration": "īśvaraḥ",
          "meaning": "Lord"
        },
        {
          "sanskrit": "ईक्षा",
          "transliteration": "īkṣā",
          "meaning": "seeing"
        },
        {
          "sanskrit": "ईशः",
          "transliteration": "īśaḥ",
          "meaning": "ruler"
        }
      ]
    },
    {
      "letter": "उ",
      "transliteration": "u",
      "words": [
        {
          "sanskrit": "उदकम्",
          "transliteration": "udakam",
          "meaning": "water"
        },
        {
          "sanskrit": "उद्यानम्",
          "transliteration": "udyānam",
          "meaning": "garden"
        },
        {
          "sanskrit": "उष्ट्रः",
          "transliteration": "uṣṭraḥ",
          "meaning": "camel"
        }
      ]
    },
    {
      "letter": "ऊ",
      "transliteration": "ū",
      "words": [
        {
          "sanskrit": "ऊर्णा",
          "transliteration": "ūrṇā",
          "meaning": "wool"
        },
        {
          "sanskrit": "ऊष्मा",
          "transliteration": "ūṣmā",
          "meaning": "heat"
        },
        {
          "sanskrit": "ऊरुः",
          "transliteration": "ūruḥ",
          "meaning": "thigh"
        }
      ]
    },
    {
      "letter": "ऋ",
      "transliteration": "ṛ",
      "words": [
        {
          "sanskrit": "ऋषिः",
          "transliteration": "ṛṣiḥ",
          "meaning": "sage"
        },
        {
          "sanskrit": "ऋतुः",
          "transliteration": "ṛtuḥ",
          "meaning": "season"
        },
        {
          "sanskrit": "ऋणम्",
          "transliteration": "ṛṇam",
          "meaning": "debt"
        }
      ]
    },
    {
      "letter": "ॠ",
      "transliteration": "ṝ",
      "words": [
        {
          "sanskrit": "ॠकारः",
          "transliteration": "ṝkāraḥ",
          "meaning": "name of the sound ॠ"
        },
        {
          "sanskrit": "ऋ–ॠ भेदः",
          "transliteration": "ṛ–ṝ bhedaḥ",
          "meaning": "contrast ऋ and ॠ"
        }
      ],
      "level": "rare_or_advanced"
    },
    {
      "letter": "ऌ",
      "transliteration": "ḷ",
      "words": [
        {
          "sanskrit": "ऌकारः",
          "transliteration": "ḷkāraḥ",
          "meaning": "name of the sound ऌ"
        },
        {
          "sanskrit": "कॢप्तम्",
          "transliteration": "kḷptam",
          "meaning": "prepared; rare form"
        }
      ],
      "level": "rare_or_advanced"
    },
    {
      "letter": "ॡ",
      "transliteration": "ḹ",
      "words": [
        {
          "sanskrit": "ॡकारः",
          "transliteration": "ḹkāraḥ",
          "meaning": "name of the sound ॡ"
        },
        {
          "sanskrit": "ऌ–ॡ भेदः",
          "transliteration": "ḷ–ḹ bhedaḥ",
          "meaning": "contrast ऌ and ॡ"
        }
      ],
      "level": "rare_or_advanced"
    },
    {
      "letter": "ए",
      "transliteration": "e",
      "words": [
        {
          "sanskrit": "एकः",
          "transliteration": "ekaḥ",
          "meaning": "one"
        },
        {
          "sanskrit": "एव",
          "transliteration": "eva",
          "meaning": "indeed"
        },
        {
          "sanskrit": "एतत्",
          "transliteration": "etat",
          "meaning": "this"
        }
      ]
    },
    {
      "letter": "ऐ",
      "transliteration": "ai",
      "words": [
        {
          "sanskrit": "ऐश्वर्यम्",
          "transliteration": "aiśvaryam",
          "meaning": "prosperity"
        },
        {
          "sanskrit": "ऐक्यम्",
          "transliteration": "aikyam",
          "meaning": "unity"
        },
        {
          "sanskrit": "ऐरावतः",
          "transliteration": "airāvataḥ",
          "meaning": "Airāvata"
        }
      ]
    },
    {
      "letter": "ओ",
      "transliteration": "o",
      "words": [
        {
          "sanskrit": "ओजः",
          "transliteration": "ojaḥ",
          "meaning": "strength"
        },
        {
          "sanskrit": "ओषधिः",
          "transliteration": "oṣadhiḥ",
          "meaning": "herb"
        },
        {
          "sanskrit": "ओदनः",
          "transliteration": "odanaḥ",
          "meaning": "cooked rice"
        }
      ]
    },
    {
      "letter": "औ",
      "transliteration": "au",
      "words": [
        {
          "sanskrit": "औषधम्",
          "transliteration": "auṣadham",
          "meaning": "medicine"
        },
        {
          "sanskrit": "औचित्यम्",
          "transliteration": "aucityam",
          "meaning": "appropriateness"
        },
        {
          "sanskrit": "औदार्यम्",
          "transliteration": "audāryam",
          "meaning": "generosity"
        }
      ]
    },
    {
      "letter": "अं",
      "transliteration": "aṃ",
      "words": [
        {
          "sanskrit": "अंशः",
          "transliteration": "aṃśaḥ",
          "meaning": "part"
        },
        {
          "sanskrit": "अंकुरः",
          "transliteration": "aṅkuraḥ",
          "meaning": "sprout"
        },
        {
          "sanskrit": "अंगम्",
          "transliteration": "aṅgam",
          "meaning": "limb"
        }
      ]
    },
    {
      "letter": "अः",
      "transliteration": "aḥ",
      "words": [
        {
          "sanskrit": "अतः",
          "transliteration": "ataḥ",
          "meaning": "therefore"
        },
        {
          "sanskrit": "प्रातः",
          "transliteration": "prātaḥ",
          "meaning": "in the morning"
        },
        {
          "sanskrit": "फलतः",
          "transliteration": "phalataḥ",
          "meaning": "as a result"
        }
      ]
    }
  ],
  "vyanjan": [
    {
      "letter": "क",
      "transliteration": "ka",
      "words": [
        {
          "sanskrit": "कमलम्",
          "transliteration": "kamalam",
          "meaning": "lotus"
        },
        {
          "sanskrit": "कपिः",
          "transliteration": "kapiḥ",
          "meaning": "monkey"
        },
        {
          "sanskrit": "कथा",
          "transliteration": "kathā",
          "meaning": "story"
        }
      ],
      "group": "velar"
    },
    {
      "letter": "ख",
      "transliteration": "kha",
      "words": [
        {
          "sanskrit": "खगः",
          "transliteration": "khagaḥ",
          "meaning": "bird"
        },
        {
          "sanskrit": "खड्गः",
          "transliteration": "khaḍgaḥ",
          "meaning": "sword"
        },
        {
          "sanskrit": "खनति",
          "transliteration": "khanati",
          "meaning": "digs"
        }
      ],
      "group": "velar"
    },
    {
      "letter": "ग",
      "transliteration": "ga",
      "words": [
        {
          "sanskrit": "गजः",
          "transliteration": "gajaḥ",
          "meaning": "elephant"
        },
        {
          "sanskrit": "गुरुः",
          "transliteration": "guruḥ",
          "meaning": "teacher"
        },
        {
          "sanskrit": "गगनम्",
          "transliteration": "gaganam",
          "meaning": "sky"
        }
      ],
      "group": "velar"
    },
    {
      "letter": "घ",
      "transliteration": "gha",
      "words": [
        {
          "sanskrit": "घटः",
          "transliteration": "ghaṭaḥ",
          "meaning": "pot"
        },
        {
          "sanskrit": "घनः",
          "transliteration": "ghanaḥ",
          "meaning": "cloud"
        },
        {
          "sanskrit": "घोषः",
          "transliteration": "ghoṣaḥ",
          "meaning": "sound"
        }
      ],
      "group": "velar"
    },
    {
      "letter": "ङ",
      "transliteration": "ṅa",
      "words": [
        {
          "sanskrit": "अङ्गम्",
          "transliteration": "aṅgam",
          "meaning": "limb"
        },
        {
          "sanskrit": "गङ्गा",
          "transliteration": "gaṅgā",
          "meaning": "Ganges"
        },
        {
          "sanskrit": "अङ्कः",
          "transliteration": "aṅkaḥ",
          "meaning": "mark"
        }
      ],
      "group": "velar"
    },
    {
      "letter": "च",
      "transliteration": "ca",
      "words": [
        {
          "sanskrit": "चन्द्रः",
          "transliteration": "candraḥ",
          "meaning": "moon"
        },
        {
          "sanskrit": "चक्रम्",
          "transliteration": "cakram",
          "meaning": "wheel"
        },
        {
          "sanskrit": "चलति",
          "transliteration": "calati",
          "meaning": "moves"
        }
      ],
      "group": "palatal"
    },
    {
      "letter": "छ",
      "transliteration": "cha",
      "words": [
        {
          "sanskrit": "छत्रम्",
          "transliteration": "chatram",
          "meaning": "umbrella"
        },
        {
          "sanskrit": "छाया",
          "transliteration": "chāyā",
          "meaning": "shade"
        },
        {
          "sanskrit": "छात्रः",
          "transliteration": "chātraḥ",
          "meaning": "student"
        }
      ],
      "group": "palatal"
    },
    {
      "letter": "ज",
      "transliteration": "ja",
      "words": [
        {
          "sanskrit": "जलम्",
          "transliteration": "jalam",
          "meaning": "water"
        },
        {
          "sanskrit": "जनः",
          "transliteration": "janaḥ",
          "meaning": "person"
        },
        {
          "sanskrit": "जपः",
          "transliteration": "japaḥ",
          "meaning": "recitation"
        }
      ],
      "group": "palatal"
    },
    {
      "letter": "झ",
      "transliteration": "jha",
      "words": [
        {
          "sanskrit": "झषः",
          "transliteration": "jhaṣaḥ",
          "meaning": "fish; rare"
        },
        {
          "sanskrit": "झङ्कारः",
          "transliteration": "jhaṅkāraḥ",
          "meaning": "resonant sound"
        }
      ],
      "group": "palatal",
      "level": "rare_or_advanced"
    },
    {
      "letter": "ञ",
      "transliteration": "ña",
      "words": [
        {
          "sanskrit": "पञ्च",
          "transliteration": "pañca",
          "meaning": "five"
        },
        {
          "sanskrit": "अञ्जलिः",
          "transliteration": "añjaliḥ",
          "meaning": "salutation"
        },
        {
          "sanskrit": "सञ्चयः",
          "transliteration": "sañcayaḥ",
          "meaning": "collection"
        }
      ],
      "group": "palatal"
    },
    {
      "letter": "ट",
      "transliteration": "ṭa",
      "words": [
        {
          "sanskrit": "टङ्कः",
          "transliteration": "ṭaṅkaḥ",
          "meaning": "chisel/coin"
        },
        {
          "sanskrit": "टिट्टिभः",
          "transliteration": "ṭiṭṭibhaḥ",
          "meaning": "lapwing"
        },
        {
          "sanskrit": "घटिका",
          "transliteration": "ghaṭikā",
          "meaning": "unit of time"
        }
      ],
      "group": "retroflex"
    },
    {
      "letter": "ठ",
      "transliteration": "ṭha",
      "words": [
        {
          "sanskrit": "ठकारः",
          "transliteration": "ṭhakāraḥ",
          "meaning": "name of ठ"
        },
        {
          "sanskrit": "कण्ठः",
          "transliteration": "kaṇṭhaḥ",
          "meaning": "throat"
        },
        {
          "sanskrit": "पृष्ठम्",
          "transliteration": "pṛṣṭham",
          "meaning": "back/surface"
        }
      ],
      "group": "retroflex",
      "level": "rare_or_advanced"
    },
    {
      "letter": "ड",
      "transliteration": "ḍa",
      "words": [
        {
          "sanskrit": "डमरुः",
          "transliteration": "ḍamaruḥ",
          "meaning": "small drum"
        },
        {
          "sanskrit": "डाकिनी",
          "transliteration": "ḍākinī",
          "meaning": "spirit in traditional lore"
        },
        {
          "sanskrit": "विडालः",
          "transliteration": "viḍālaḥ",
          "meaning": "cat; variant"
        }
      ],
      "group": "retroflex"
    },
    {
      "letter": "ढ",
      "transliteration": "ḍha",
      "words": [
        {
          "sanskrit": "ढक्का",
          "transliteration": "ḍhakkā",
          "meaning": "drum; rare"
        },
        {
          "sanskrit": "प्रौढः",
          "transliteration": "prauḍhaḥ",
          "meaning": "mature"
        }
      ],
      "group": "retroflex",
      "level": "rare_or_advanced"
    },
    {
      "letter": "ण",
      "transliteration": "ṇa",
      "words": [
        {
          "sanskrit": "गणः",
          "transliteration": "gaṇaḥ",
          "meaning": "group"
        },
        {
          "sanskrit": "मणिः",
          "transliteration": "maṇiḥ",
          "meaning": "jewel"
        },
        {
          "sanskrit": "वर्णः",
          "transliteration": "varṇaḥ",
          "meaning": "colour/class"
        }
      ],
      "group": "retroflex"
    },
    {
      "letter": "त",
      "transliteration": "ta",
      "words": [
        {
          "sanskrit": "तरुः",
          "transliteration": "taruḥ",
          "meaning": "tree"
        },
        {
          "sanskrit": "तारा",
          "transliteration": "tārā",
          "meaning": "star"
        },
        {
          "sanskrit": "तपः",
          "transliteration": "tapaḥ",
          "meaning": "austerity"
        }
      ],
      "group": "dental"
    },
    {
      "letter": "थ",
      "transliteration": "tha",
      "words": [
        {
          "sanskrit": "थकारः",
          "transliteration": "thakāraḥ",
          "meaning": "name of थ"
        },
        {
          "sanskrit": "स्थानम्",
          "transliteration": "sthānam",
          "meaning": "place"
        },
        {
          "sanskrit": "पथः",
          "transliteration": "pathaḥ",
          "meaning": "path"
        }
      ],
      "group": "dental"
    },
    {
      "letter": "द",
      "transliteration": "da",
      "words": [
        {
          "sanskrit": "दन्तः",
          "transliteration": "dantaḥ",
          "meaning": "tooth"
        },
        {
          "sanskrit": "दिनम्",
          "transliteration": "dinam",
          "meaning": "day"
        },
        {
          "sanskrit": "देवः",
          "transliteration": "devaḥ",
          "meaning": "deity"
        }
      ],
      "group": "dental"
    },
    {
      "letter": "ध",
      "transliteration": "dha",
      "words": [
        {
          "sanskrit": "धनम्",
          "transliteration": "dhanam",
          "meaning": "wealth"
        },
        {
          "sanskrit": "धर्मः",
          "transliteration": "dharmaḥ",
          "meaning": "dharma"
        },
        {
          "sanskrit": "धारा",
          "transliteration": "dhārā",
          "meaning": "stream"
        }
      ],
      "group": "dental"
    },
    {
      "letter": "न",
      "transliteration": "na",
      "words": [
        {
          "sanskrit": "नदी",
          "transliteration": "nadī",
          "meaning": "river"
        },
        {
          "sanskrit": "नरः",
          "transliteration": "naraḥ",
          "meaning": "person"
        },
        {
          "sanskrit": "नयनम्",
          "transliteration": "nayanam",
          "meaning": "eye"
        }
      ],
      "group": "dental"
    },
    {
      "letter": "प",
      "transliteration": "pa",
      "words": [
        {
          "sanskrit": "पतति",
          "transliteration": "patati",
          "meaning": "falls"
        },
        {
          "sanskrit": "पुस्तकम्",
          "transliteration": "pustakam",
          "meaning": "book"
        },
        {
          "sanskrit": "पवनः",
          "transliteration": "pavanaḥ",
          "meaning": "wind"
        }
      ],
      "group": "labial"
    },
    {
      "letter": "फ",
      "transliteration": "pha",
      "words": [
        {
          "sanskrit": "फलम्",
          "transliteration": "phalam",
          "meaning": "fruit"
        },
        {
          "sanskrit": "फेनः",
          "transliteration": "phenaḥ",
          "meaning": "foam"
        },
        {
          "sanskrit": "फालः",
          "transliteration": "phālaḥ",
          "meaning": "ploughshare"
        }
      ],
      "group": "labial"
    },
    {
      "letter": "ब",
      "transliteration": "ba",
      "words": [
        {
          "sanskrit": "बालः",
          "transliteration": "bālaḥ",
          "meaning": "child"
        },
        {
          "sanskrit": "बलम्",
          "transliteration": "balam",
          "meaning": "strength"
        },
        {
          "sanskrit": "बिलम्",
          "transliteration": "bilam",
          "meaning": "cavity"
        }
      ],
      "group": "labial"
    },
    {
      "letter": "भ",
      "transliteration": "bha",
      "words": [
        {
          "sanskrit": "भवनम्",
          "transliteration": "bhavanam",
          "meaning": "building"
        },
        {
          "sanskrit": "भानुः",
          "transliteration": "bhānuḥ",
          "meaning": "sun"
        },
        {
          "sanskrit": "भक्तिः",
          "transliteration": "bhaktiḥ",
          "meaning": "devotion"
        }
      ],
      "group": "labial"
    },
    {
      "letter": "म",
      "transliteration": "ma",
      "words": [
        {
          "sanskrit": "माता",
          "transliteration": "mātā",
          "meaning": "mother"
        },
        {
          "sanskrit": "मित्रम्",
          "transliteration": "mitram",
          "meaning": "friend"
        },
        {
          "sanskrit": "मधु",
          "transliteration": "madhu",
          "meaning": "honey"
        }
      ],
      "group": "labial"
    },
    {
      "letter": "य",
      "transliteration": "ya",
      "words": [
        {
          "sanskrit": "यज्ञः",
          "transliteration": "yajñaḥ",
          "meaning": "ritual"
        },
        {
          "sanskrit": "योगः",
          "transliteration": "yogaḥ",
          "meaning": "yoga"
        },
        {
          "sanskrit": "यात्रा",
          "transliteration": "yātrā",
          "meaning": "journey"
        }
      ],
      "group": "semivowel"
    },
    {
      "letter": "र",
      "transliteration": "ra",
      "words": [
        {
          "sanskrit": "रथः",
          "transliteration": "rathaḥ",
          "meaning": "chariot"
        },
        {
          "sanskrit": "राजा",
          "transliteration": "rājā",
          "meaning": "king"
        },
        {
          "sanskrit": "रविः",
          "transliteration": "raviḥ",
          "meaning": "sun"
        }
      ],
      "group": "semivowel"
    },
    {
      "letter": "ल",
      "transliteration": "la",
      "words": [
        {
          "sanskrit": "लता",
          "transliteration": "latā",
          "meaning": "creeper"
        },
        {
          "sanskrit": "लक्ष्मीः",
          "transliteration": "lakṣmīḥ",
          "meaning": "Lakshmi"
        },
        {
          "sanskrit": "लवः",
          "transliteration": "lavaḥ",
          "meaning": "particle"
        }
      ],
      "group": "semivowel"
    },
    {
      "letter": "व",
      "transliteration": "va",
      "words": [
        {
          "sanskrit": "वनम्",
          "transliteration": "vanam",
          "meaning": "forest"
        },
        {
          "sanskrit": "वायुः",
          "transliteration": "vāyuḥ",
          "meaning": "wind"
        },
        {
          "sanskrit": "वचनम्",
          "transliteration": "vacanam",
          "meaning": "statement"
        }
      ],
      "group": "semivowel"
    },
    {
      "letter": "श",
      "transliteration": "śa",
      "words": [
        {
          "sanskrit": "शशः",
          "transliteration": "śaśaḥ",
          "meaning": "hare"
        },
        {
          "sanskrit": "शिवः",
          "transliteration": "śivaḥ",
          "meaning": "Shiva/auspicious"
        },
        {
          "sanskrit": "शाला",
          "transliteration": "śālā",
          "meaning": "hall/school"
        }
      ],
      "group": "sibilant"
    },
    {
      "letter": "ष",
      "transliteration": "ṣa",
      "words": [
        {
          "sanskrit": "षट्",
          "transliteration": "ṣaṭ",
          "meaning": "six"
        },
        {
          "sanskrit": "षष्ठः",
          "transliteration": "ṣaṣṭhaḥ",
          "meaning": "sixth"
        },
        {
          "sanskrit": "कृष्णः",
          "transliteration": "kṛṣṇaḥ",
          "meaning": "Krishna/dark"
        }
      ],
      "group": "sibilant"
    },
    {
      "letter": "स",
      "transliteration": "sa",
      "words": [
        {
          "sanskrit": "सूर्यः",
          "transliteration": "sūryaḥ",
          "meaning": "sun"
        },
        {
          "sanskrit": "सरः",
          "transliteration": "saraḥ",
          "meaning": "lake"
        },
        {
          "sanskrit": "सखा",
          "transliteration": "sakhā",
          "meaning": "friend"
        }
      ],
      "group": "sibilant"
    },
    {
      "letter": "ह",
      "transliteration": "ha",
      "words": [
        {
          "sanskrit": "हरिः",
          "transliteration": "hariḥ",
          "meaning": "Hari"
        },
        {
          "sanskrit": "हंसः",
          "transliteration": "haṃsaḥ",
          "meaning": "swan"
        },
        {
          "sanskrit": "हस्तः",
          "transliteration": "hastaḥ",
          "meaning": "hand"
        }
      ],
      "group": "aspirate"
    }
  ]
}''';

final Map<String, dynamic> swarPracticeWordsData =
    jsonDecode(_practiceWordsJson) as Map<String, dynamic>;
