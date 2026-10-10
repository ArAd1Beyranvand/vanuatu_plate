import 'package:plate_core/plate_core.dart';

/// Judges a `VanuatuPlates.standard` number. Reports, never bars.
///
/// The article gives only the format: one to five digits (`1234`, `12345`).
/// It documents no ranges, so nothing further is checked.
class VanuatuValidator extends GatedPlateValidator {
  const VanuatuValidator();

  @override
  String get gateGroup => 'number';

  static const String reasonNumber = 'The number is 1 to 5 digits.';

  @override
  PlateValidation judge(PlateEntry entry) {
    final String number = entry.group('number');
    if (number.isEmpty || number.length > 5 || !isDigits(number)) {
      return const PlateValidation.invalid(reasonNumber);
    }
    return const PlateValidation.valid();
  }
}

/// Judges a `VanuatuPlates.diplomatic` value: four letters and one digit
/// (`ABCD 1`). The article lists no mission codes.
class VanuatuDiplomaticValidator extends GatedPlateValidator {
  const VanuatuDiplomaticValidator();

  @override
  String get gateGroup => 'serial';

  static const String reasonCode = 'The code is four letters.';
  static const String reasonSerial = 'The serial is one digit.';

  @override
  PlateValidation judge(PlateEntry entry) {
    final String code = entry.group('code');
    if (code.length != 4 || !RegExp(r'^[A-Z]{4}$').hasMatch(code)) {
      return const PlateValidation.invalid(reasonCode);
    }
    final String serial = entry.group('serial');
    if (serial.length != 1 || !isDigits(serial)) {
      return const PlateValidation.invalid(reasonSerial);
    }
    return const PlateValidation.valid();
  }
}
