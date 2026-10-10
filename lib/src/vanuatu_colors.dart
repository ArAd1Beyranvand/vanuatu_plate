import 'package:flutter/widgets.dart';

/// The colours a Vanuatu plate is printed in, taken from the flattened
/// Commons photographs (median of a flat region), not from the article, which
/// only names them.
abstract final class VanuatuColors {
  /// The black field of `Kfz-Kennzeichen Vanuatu retouched.jpg`; the raw
  /// sample (040404) carries a blue cast, so this is the neutral black.
  static const Color black = Color(0xFF0A0A0A);

  /// The white border and characters on [black]. Same photo, border strip.
  static const Color white = Color(0xFFFCFCFC);

  /// The diplomatic field: median of the green between the characters of
  /// `Vanuatu diplomatic license plate.jpg`. A small, low-quality photo.
  static const Color diplomaticGreen = Color(0xFF046300); // CALIBRATE

  /// The diplomatic characters, median of the C's stem. The offline fit
  /// reported FF0104 for the brightest pixels; the median is darker.
  static const Color diplomaticRed = Color(0xFFBA0002); // CALIBRATE

  /// The thin dark-red rim inside the diplomatic plate's edge.
  static const Color diplomaticRim = Color(0xFF2C0404); // CALIBRATE

  static const Color inactiveOnDark = Color(0xFF5A5A5A);
  static const Color inactiveOnGreen = Color(0xFF3A8A3A);
}
