import 'package:plate_core/plate_core.dart';

// TODO(py): [D4-code] hand-port; reason strings are the contract, keep them byte-identical.
// TODO(ts): [D4-code] hand-port; reason strings are the contract, keep them byte-identical.
// TODO(kt): [D4-code] hand-port; reason strings are the contract, keep them byte-identical.
/// Judges a `VanuatuPlates.standard` number: one to five digits. Reports,
/// never bars.
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
  // TODO(py): [H9] Python re: \d/\w match Unicode; keep explicit [0-9]/[A-Z] classes (or re.ASCII).
  // TODO(ts): [H9] same flavour as Dart; port as is, cover accept/reject in the vectors (D9).
  // TODO(kt): [H9] Regex engine differs per target (JVM/JS/Native): keep to portable syntax.
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
