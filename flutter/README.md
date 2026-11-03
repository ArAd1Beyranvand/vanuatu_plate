FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Vanuatu to view examples:

https://platexample.ir/#/discover/vanuatu:flutter

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

### Install

```yaml
dependencies:
  plate_core: ^0.12.0
  vanuatu_plate: ^0.1.0
```

### Use

```dart
import 'package:plate_core/plate_core.dart';
import 'package:vanuatu_plate/vanuatu_plate.dart';

PlateCanvas(
  spec: VanuatuPlates.standard,
  theme: VanuatuThemes.standard,
  validator: const VanuatuValidator(),
  autoValidate: true,
  onChooseCharacter: noCharacterChooser,
);
```

## Specs

Each spec is one plate layout.

- `VanuatuPlates.standard` — id `vu.standard`
- `VanuatuPlates.diplomatic` — id `vu.diplomatic`

## Themes

- `VanuatuThemes.standard`
- `VanuatuThemes.diplomatic`

## Change it

`PlateCanvas` takes `spec:` (an entry of `VanuatuPlates`) and `theme:` (an entry of `VanuatuThemes`). Set `validator:` to `VanuatuValidator()` and `autoValidate: true` to show validation hints.

## Also included

- `VanuatuCountry` — the country panel.
- `VanuatuValidator` — the plate validator.

## Plates

`standard` holds 1-5 digits in one field laid out for five and centred, so
a four-digit number sits where the photograph has it. Only the palm design
has a measurable reference, so every length uses it. Palms are decals
cropped from the reference photograph.

`standard` has one text group, `number`; `diplomatic` has `code` and
`serial`.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/vanuatu_plate/blob/main/LICENSE).
