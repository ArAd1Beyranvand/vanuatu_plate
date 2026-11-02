import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'vanuatu_colors.dart';

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

  /// The white border is ~7 mm of the 134 mm height.
  static final PlateTheme standard = _plate(
    field: VanuatuColors.black,
    border: VanuatuColors.white,
    ink: VanuatuColors.white,
    inactive: VanuatuColors.inactiveOnDark,
    borderWidthRatio: 0.05,
  );

  static final PlateTheme diplomatic = _plate(
    field: VanuatuColors.diplomaticGreen,
    border: VanuatuColors.diplomaticRim,
    ink: VanuatuColors.diplomaticRed,
    inactive: VanuatuColors.inactiveOnGreen,
    borderWidthRatio: 0.02,
  );
}
