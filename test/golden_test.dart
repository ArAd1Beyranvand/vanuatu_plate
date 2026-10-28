import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vanuatu_plate/vanuatu_plate.dart';
import 'package:plate_core/plate_core.dart';

/// One golden per category, drawn with real bold faces so the ink can be
/// measured against the references (`platekit golden-check`).
///
/// Regenerate with `flutter test --update-goldens` after a deliberate change.
void main() {
  setUpAll(() async {
    final FontLoader loader = FontLoader('Roboto');
    for (final String path in const <String>[
      '/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf',
    ]) {
      final File face = File(path);
      if (!face.existsSync()) continue;
      loader.addFont(face.readAsBytes().then((b) => ByteData.view(b.buffer)));
    }
    await loader.load();
  });

  /// category id -> (spec, theme, space-separated sample value)
  final Map<String, (PlateSpec, PlateTheme, String)>
  cases = <String, (PlateSpec, PlateTheme, String)>{
    'standard': (VanuatuPlates.standard, VanuatuThemes.standard, '7906'),
    'standard_short': (VanuatuPlates.standard, VanuatuThemes.standard, '42'),
    'standard_five': (VanuatuPlates.standard, VanuatuThemes.standard, '12345'),
    'diplomatic': (
      VanuatuPlates.diplomatic,
      VanuatuThemes.diplomatic,
      'CDNZ 7',
    ),
  };

  for (final MapEntry<String, (PlateSpec, PlateTheme, String)> c
      in cases.entries) {
    testWidgets(c.key, (tester) async {
      final (PlateSpec spec, PlateTheme theme, String values) = c.value;
      final PlateController controller = PlateController.fromValues(
        spec,
        values.split(' '),
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 680,
                height: 300,
                child: PlateThemeScope(
                  theme: theme,
                  child: PlateView(
                    controller: controller,
                    theme: theme,
                    country: VanuatuCountry.vanuatu,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      // Decals decode off the fake clock; load them for real before the shot.
      final BuildContext context = tester.element(find.byType(PlateView));
      await tester.runAsync(() async {
        for (final PlateDecal decal in spec.decals) {
          final ImageProvider? image = decal.image;
          if (image != null) await precacheImage(image, context);
        }
      });
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(PlateView),
        matchesGoldenFile('goldens/vu_${c.key}.png'),
      );
      await tester.pumpWidget(const SizedBox.shrink());
      controller.dispose();
    });
  }

  test('the number completes from one digit', () {
    final PlateController controller = PlateController.fromValues(
      VanuatuPlates.standard,
      <String?>['4'],
    );
    expect(controller.isCompleted, isTrue);
    controller.setAt(0, '');
    expect(controller.isCompleted, isFalse);
    controller.dispose();
  });
}
