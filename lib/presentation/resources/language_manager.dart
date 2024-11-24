enum LanguageType { en, ar }

const String en = 'en';
const String ar = 'ar';

extension LanguageExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.en:
        return en;
      case LanguageType.ar:
        return ar;
    }
  }
}
