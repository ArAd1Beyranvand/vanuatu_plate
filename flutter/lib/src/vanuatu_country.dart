import 'package:plate_core/plate_core.dart';

import 'vanuatu_colors.dart';

/// Vanuatu as a `PlateCountry`. The plates carry no flag block, so every spec
/// sets `noPanel`; the colours are only the required placeholders.
abstract final class VanuatuCountry {
  static const PlateCountry vanuatu = PlateCountry(
    code: 'vu',
    captionLines: <String>[],
    panelColor: VanuatuColors.black,
    panelTextColor: VanuatuColors.white,
  );
}
