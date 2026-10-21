import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

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

/// [standard] holds 1-5 digits in one field laid out for five and centred, so
/// a four-digit number sits where the photograph has it. Only the palm design
/// has a measurable reference, so every length uses it. Palms are decals
/// cropped from the reference photograph.
///
/// [standard] has one text group, `number`; [diplomatic] has `code` and
/// `serial`.
abstract final class VanuatuPlates {
  static const AssetImage _palmLeft = AssetImage(
    'assets/icons/palm_left.png',
    package: 'vanuatu_plate',
  );
  static const AssetImage _palmRight = AssetImage(
    'assets/icons/palm_right.png',
    package: 'vanuatu_plate',
  );

  static final PlateSpec standard = PlateSpec(
    id: 'vu.standard',
    country: VanuatuCountry.vanuatu,
    canvasWidth: _Layout.width,
    canvasHeight: _Layout.height,
    noPanel: true,
    panel: const PlatePanel(box: PlateBox(0, 0, 0, _Layout.height)),
    slots: <PlateSlot>[
      PlateSlot(
        alphabet: VanuatuAlphabets.digits,
        box: PlateBox(
          (_Layout.width - 5 * _Layout.pitch) / 2,
          _Layout.slotTop,
          5 * _Layout.pitch,
          _Layout.slotHeight,
        ),
        length: 5,
        minLength: 1,
      ),
    ],
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
    textGroups: const <PlateTextGroup>[
      PlateTextGroup(<int>[0], key: 'number'),
    ],
  );

  /// `CDNZ 7`: four letters, a gap, one digit.
  static final PlateSpec diplomatic = PlateSpec(
    id: 'vu.diplomatic',
    country: VanuatuCountry.vanuatu,
    canvasWidth: _Layout.width,
    canvasHeight: _Layout.height,
    noPanel: true,
    panel: const PlatePanel(box: PlateBox(0, 0, 0, _Layout.height)),
    slots: <PlateSlot>[
      PlateSlot(
        alphabet: VanuatuAlphabets.letters,
        box: const PlateBox(
          _Layout.dipLetterLeft,
          _Layout.dipSlotTop,
          4 * _Layout.dipLetterPitch,
          _Layout.dipSlotHeight,
        ),
        length: 4,
        spacing: max(
          0,
          _Layout.dipLetterPitch - 0.6 * 0.72 * _Layout.dipSlotHeight,
        ),
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
      PlateTextGroup(<int>[0], key: 'code'),
      PlateTextGroup(<int>[1], key: 'serial'),
    ],
  );
}
