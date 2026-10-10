import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'vanuatu_colors.dart';

/// The Vanuatu liveries.
abstract final class VanuatuThemes {
  static PlateTheme _plate({
    required Color field,
    required Color border,
    required Color ink,
    required Color inactive,
    required double borderWidthRatio,
  }) => PlateTheme(
    plateBackground: field,
    plateBorder: border,
    ink: ink,
    dividerColor: ink,
    borderWidthRatio: borderWidthRatio,
    plateRadiusRatio: 0.05,
    activeColor: ink,
    inactiveColor: inactive,
    alertColor: const Color(0xFFD32F2F),
  );

  /// White on black inside a white border ~7 mm wide (28 px of the 1488 px
  /// flattened photo, 134 mm tall).
  static final PlateTheme standard = _plate(
    field: VanuatuColors.black,
    border: VanuatuColors.white,
    ink: VanuatuColors.white,
    inactive: VanuatuColors.inactiveOnDark,
    borderWidthRatio: 0.05,
  );

  /// Red on green with a thin dark-red rim: the diplomatic plate.
  static final PlateTheme diplomatic = _plate(
    field: VanuatuColors.diplomaticGreen,
    border: VanuatuColors.diplomaticRim,
    ink: VanuatuColors.diplomaticRed,
    inactive: VanuatuColors.inactiveOnGreen,
    borderWidthRatio: 0.02,
  );
}
