import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'package:plate_alphabet/plate_alphabet.dart';
import 'vanuatu_colors.dart';
import 'vanuatu_country.dart';

/// Where the ink sits on a Vanuatu plate, in millimetres.
///
/// The canvas is the 372×134 the article gives. The flattened photographs are
/// 1488×536 px, exactly 4 px/mm, so every number is a pixel measurement ÷ 4:
///
/// * Standard (`Kfz-Kennzeichen Vanuatu retouched.jpg`, `7906`): digit ink y
///   32..103 (71 tall), ink x 72.5..103.7, 137..172, 202..237, 269..302 — a
///   pitch of ~65.9 about the plate's centre. Palms: left x 14..56, right
///   x 318..360, both y 20..104. White border ~7 mm; the bottom border is
///   interrupted from x 102 to 271 and "Republic of Vanuatu" sits in the gap
///   (ink x 110..265, cap height ~11, y 120..132); see `captionLeft`.
/// * Diplomatic (`Vanuatu diplomatic license plate.jpg`, `CDNZ 7`): ink y
///   32..105; letters x 49.5..92, 104..145.5, 158..200, 210.5..237 (pitch
///   ~54), digit 299..324.
///
/// **Under-height ink, accepted.** 71 mm of ink would need a ~129 mm slot on a
/// 134 mm plate; the standard slot is 118 (~65 mm of ink, ~92%), and the
/// diplomatic one is limited by cell width (the artwork's face is condensed,
/// DejaVu is not).
abstract final class _Layout {
  static const double width = 372;
  static const double height = 134;

  // Standard.
  static const double pitch = 65.9;
  static const double slotHeight = 118;

  /// Digit ink centre 67.5, slot centred on it.
  static const double slotTop = 8.5;

  static const double palmTop = 20;
  static const double palmWidth = 42.5;
  static const double palmHeight = 83.75;
  static const double palmLeft = 13.75;
  static const double palmRight = 317.5;

  /// The caption's box. On the reference it sits in a gap in the bottom
  /// border (cap tops at y 120, below the field's edge at 127), which the
  /// engine cannot cut — the frame is painted over the background and clips
  /// bands to the face — so it is lifted into the field, centred at 120.
  static const double captionLeft = 102;
  static const double captionWidth = 169;

  static const double captionGlyph = 18;
  static const double captionTop = 112;
  static const double captionHeight = 16;

  // Diplomatic.
  static const double dipLetterLeft = 46;
  static const double dipLetterPitch = 54;
  static const double dipSlotHeight = 90;
  static const double dipSlotTop = 21;
  static const double dipDigitLeft = 287;
  static const double dipDigitWidth = 49;
}

/// Vanuatu's plate geometries.
///
/// * [standard] — white on black, 1–5 digits ([digits] defaults to 4), with a
///   palm tree either side and "Republic of Vanuatu" in the bottom border.
///   The article shows a five-digit plate without palms; only the palm design
///   has a measurable reference, so the five-digit variant uses it too.
/// * [diplomatic] — red on green, four letters and one digit (`CDNZ 7`).
///
/// Palms are decals cropped from the Commons photograph (white on alpha): a
/// crest-like drawing no algorithm reproduces. The photograph is
/// `Kfz-Kennzeichen Vanuatu retouched.jpg`.
///
/// [standard] has one text group, `number`; [diplomatic] has `code` and
/// `serial`.
abstract final class VanuatuPlates {
  static const List<int> digitLengths = <int>[1, 2, 3, 4, 5];

  static final Map<int, PlateSpec> _standard = <int, PlateSpec>{};

  static const AssetImage _palmLeft = AssetImage(
    'assets/icons/palm_left.png',
    package: 'vanuatu_plate',
  );
  static const AssetImage _palmRight = AssetImage(
    'assets/icons/palm_right.png',
    package: 'vanuatu_plate',
  );

  static PlateSpec standard({int digits = 4}) {
    if (!digitLengths.contains(digits)) {
      throw ArgumentError('A Vanuatu plate has 1–5 digits (got $digits).');
    }
    return _standard[digits] ??= _standardSpec(digits);
  }

  static PlateSpec _standardSpec(int digits) {
    final double left = (_Layout.width - digits * _Layout.pitch) / 2;
    return PlateSpec(
      id: 'vu.standard.$digits',
      country: VanuatuCountry.vanuatu,
      canvasWidth: _Layout.width,
      canvasHeight: _Layout.height,
      noPanel: true,
      panel: const PlatePanel(box: PlateBox(0, 0, 0, _Layout.height)),
      slots: plateRegister(
        alphabet: VanuatuAlphabets.digits,
        count: digits,
        left: left,
        top: _Layout.slotTop,
        width: _Layout.pitch,
        height: _Layout.slotHeight,
      ),
      decals: const <PlateDecal>[
        PlateDecal(
          image: _palmLeft,
          box: PlateBox(
            _Layout.palmLeft,
            _Layout.palmTop,
            _Layout.palmWidth,
            _Layout.palmHeight,
          ),
        ),
        PlateDecal(
          image: _palmRight,
          box: PlateBox(
            _Layout.palmRight,
            _Layout.palmTop,
            _Layout.palmWidth,
            _Layout.palmHeight,
          ),
        ),
      ],
      labels: const <PlateLabel>[
        PlateLabel(
          text: 'Republic of Vanuatu',
          box: PlateBox(
            _Layout.captionLeft,
            _Layout.captionTop,
            _Layout.captionWidth,
            _Layout.captionHeight,
          ),
          glyphHeight: _Layout.captionGlyph,
          color: VanuatuColors.white,
        ),
      ],
      textGroups: <PlateTextGroup>[
        PlateTextGroup(<int>[
          for (int i = 0; i < digits; i++) i,
        ], key: 'number'),
      ],
    );
  }

  /// `CDNZ 7`: four letters, a gap, one digit.
  static final PlateSpec diplomatic = PlateSpec(
    id: 'vu.diplomatic',
    country: VanuatuCountry.vanuatu,
    canvasWidth: _Layout.width,
    canvasHeight: _Layout.height,
    noPanel: true,
    panel: const PlatePanel(box: PlateBox(0, 0, 0, _Layout.height)),
    slots: <PlateSlot>[
      ...plateRegister(
        alphabet: VanuatuAlphabets.letters,
        count: 4,
        left: _Layout.dipLetterLeft,
        top: _Layout.dipSlotTop,
        width: _Layout.dipLetterPitch,
        height: _Layout.dipSlotHeight,
      ),
      PlateSlot(
        alphabet: VanuatuAlphabets.digits,
        box: const PlateBox(
          _Layout.dipDigitLeft,
          _Layout.dipSlotTop,
          _Layout.dipDigitWidth,
          _Layout.dipSlotHeight,
        ),
      ),
    ],
    textGroups: const <PlateTextGroup>[
      PlateTextGroup(<int>[0, 1, 2, 3], key: 'code'),
      PlateTextGroup(<int>[4], key: 'serial'),
    ],
  );
}
