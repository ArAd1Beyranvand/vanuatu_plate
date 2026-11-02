FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Vanuatu to view examples:

https://platexample.ir/#/discover/vanuatu

# vanuatu_plate

Vanuatu's licence plates for the `plate_core` library. The 372×134 white-on-black palm plate and the red-on-green diplomatic plate.

## Install

```yaml
dependencies:
  plate_core: ^0.12.0
  vanuatu_plate: ^0.1.0
```

## Use

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

## Contains

- `VanuatuCountry` — country panel: `vanuatu`.
- `VanuatuPlates` — 2 plate specs: `standard`, `diplomatic`.
- `VanuatuThemes` — 2 themes: `standard`, `diplomatic`.
- `VanuatuValidator` — advisory validator; flags the frame, never blocks a keystroke.
- `VanuatuDiplomaticValidator` — advisory validator; flags the frame, never blocks a keystroke.
- 2 bundled assets (`palm_left.png`, `palm_right.png`).

## Plates

`standard` holds 1-5 digits in one field laid out for five and centred, so
a four-digit number sits where the photograph has it. Only the palm design
has a measurable reference, so every length uses it. Palms are decals
cropped from the reference photograph.

`standard` has one text group, `number`; `diplomatic` has `code` and
`serial`.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

