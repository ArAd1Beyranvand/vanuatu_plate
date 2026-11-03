FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Vanuatu to view examples:

https://platexample.ir/#/discover/vanuatu:python

# vanuatu_plate

Vanuatu's licence plates for the plate_core library — the white-on-black palm plate and the red-on-green diplomatic plate, with themes, alphabets and advisory validators.

## Languages

| Language | Folder | Example |
| --- | --- | --- |
| Flutter / Dart | [`flutter/`](https://github.com/ArAd1Beyranvand/vanuatu_plate/tree/main/flutter) | [platexample](https://platexample.ir/#/discover/vanuatu:flutter) |
| Kotlin | [`kotlin/`](https://github.com/ArAd1Beyranvand/vanuatu_plate/tree/main/kotlin) | [platexample](https://platexample.ir/#/discover/vanuatu:kotlin) |
| Python | [`python/`](https://github.com/ArAd1Beyranvand/vanuatu_plate/tree/main/python) | [platexample](https://platexample.ir/#/discover/vanuatu:python) |
| TypeScript | [`typescript/`](https://github.com/ArAd1Beyranvand/vanuatu_plate/tree/main/typescript) | [platexample](https://platexample.ir/#/discover/vanuatu:typescript) |

## Quick start

### Install (Python)

Copy `python/plates/countries/vanuatu/` into `plate_core/python/plates/countries/`.

Then run the tests from `plate_core/python/`: `pytest`.

### Use

```python
from plates.countries.vanuatu.data import SPECS, THEMES

spec = SPECS["vu.standard"]
theme = THEMES["VanuatuThemes.standard"]
print(spec.id)
```

## Specs

The specs are the same in every language (they come from shared data).

- `vu.standard`
- `vu.diplomatic`

## Themes

- `VanuatuThemes.standard`
- `VanuatuThemes.diplomatic`

## Change it

- Pick a spec: use another key of `SPECS`.
- Pick a theme: use another key of `THEMES`.
- Validators: `VALIDATORS` maps the names `VanuatuValidator`, `VanuatuDiplomaticValidator` to classes.

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/vanuatu_plate/blob/main/LICENSE).
