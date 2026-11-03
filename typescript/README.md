FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Vanuatu to view examples:

https://platexample.ir/#/discover/vanuatu:typescript

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

### Install (TypeScript)

Copy `typescript/src/countries/vanuatu/` into `plate_core/typescript/src/countries/`.

Then run the tests from `plate_core/typescript/`: `npm test`.

### Use

```ts
import country from './countries/vanuatu';

const spec = country.specs.get('vu.standard');
console.log(country.package);
```

## Specs

The specs are the same in every language (they come from shared data).

- `vu.standard`
- `vu.diplomatic`

## Themes

- `VanuatuThemes.standard`
- `VanuatuThemes.diplomatic`

## Change it

- Specs: `country.specs`, by id.
- Themes: `country.themes`.
- Validators: `country.validators` (`VanuatuValidator`, `VanuatuDiplomaticValidator`).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/vanuatu_plate/blob/main/LICENSE).
