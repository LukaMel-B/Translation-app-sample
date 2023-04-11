class LanguoCountry {
  final String country;
  final String language;
  final String countryCode;
  final String langCode;

  LanguoCountry(
      {required this.country,
      required this.language,
      required this.countryCode,
      required this.langCode});
}

class CountryInfo {
  List<LanguoCountry> listInfo = [];
}
