import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';
import 'package:vanuatu_plate/vanuatu_plate.dart';

void main() => runApp(
  PlateExampleApp(spec: VanuatuPlates.standard, theme: VanuatuThemes.standard),
);
