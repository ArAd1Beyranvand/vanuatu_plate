import 'package:plate_core/plate_core.dart';

/// Judges a `VanuatuPlates.standard` number: one to five digits. Reports,
/// never bars.
class VanuatuValidator extends GatedPlateValidator {
  const VanuatuValidator() : super('number');

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
  const VanuatuDiplomaticValidator() : super('serial');

  static const String reasonCode = 'The code is four letters.';
  static final RegExp _code = RegExp(r'^[A-Z]{4}$');
  static const String reasonSerial = 'The serial is one digit.';

  @override
  PlateValidation judge(PlateEntry entry) {
    final String code = entry.group('code');
    if (!_code.hasMatch(code)) {
      return const PlateValidation.invalid(reasonCode);
    }
    final String serial = entry.group('serial');
    if (serial.length != 1 || !isDigits(serial)) {
      return const PlateValidation.invalid(reasonSerial);
    }
    return const PlateValidation.valid();
  }
}
