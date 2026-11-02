/// Vanuatu's licence plates for the `plate_core` library.
///
/// The 372×134 white-on-black palm plate and the red-on-green diplomatic plate.
library;

// TODO(py): [D5] one module `plates.countries.vanuatu`; assets via importlib.resources.
// TODO(ts): [D5] one subpath export `./countries/vanuatu`; tree-shakable.
// TODO(kt): [D5] package `countries.vanuatu` in the countries module.
export 'package:plate_alphabet/plate_alphabet.dart' show VanuatuAlphabets;
export 'src/vanuatu_colors.dart';
export 'src/vanuatu_country.dart';
export 'src/vanuatu_plates.dart';
export 'src/vanuatu_themes.dart';
export 'src/vanuatu_validators.dart';
