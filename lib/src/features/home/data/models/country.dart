class Country {
  final String name;
  final List<String> topLevelDomain;
  final String alpha2Code;
  final String alpha3Code;
  final List<String> callingCodes;
  final String capital;
  final List<String> altSpellings;
  final String subregion;
  final String region;
  final int population;
  final List<double> latlng;
  final String demonym;
  final double area;
  final List<String> timezones;
  final List<String> borders;
  final String nativeName;
  final String numericCode;
  final Flag flags;
  final List<Currency> currencies;
  final List<Language> languages;
  final Map<String, String> translations;
  final List<RegionalBloc> regionalBlocs;
  final bool independent;

  Country({
    required this.name,
    required this.topLevelDomain,
    required this.alpha2Code,
    required this.alpha3Code,
    required this.callingCodes,
    required this.capital,
    required this.altSpellings,
    required this.subregion,
    required this.region,
    required this.population,
    required this.latlng,
    required this.demonym,
    required this.area,
    required this.timezones,
    required this.borders,
    required this.nativeName,
    required this.numericCode,
    required this.flags,
    required this.currencies,
    required this.languages,
    required this.translations,
    required this.regionalBlocs,
    required this.independent,
  });

  Country.empty()
      : name = 'country',
        topLevelDomain = [],
        alpha2Code = '',
        alpha3Code = '',
        callingCodes = [],
        capital = '',
        altSpellings = [],
        subregion = '',
        region = '',
        population = 0,
        latlng = [],
        demonym = '',
        area = 0,
        timezones = [],
        borders = [],
        nativeName = '',
        numericCode = '',
        flags = Flag(svg: '', png: ''),
        currencies = [],
        languages = [],
        translations = {},
        regionalBlocs = [],
        independent = false;

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'] ?? '',
      topLevelDomain: List<String>.from(json['topLevelDomain'] ?? []),
      alpha2Code: json['alpha2Code'] ?? '',
      alpha3Code: json['alpha3Code'] ?? '',
      callingCodes: List<String>.from(json['callingCodes'] ?? []),
      capital: json['capital'] ?? '',
      altSpellings: List<String>.from(json['altSpellings'] ?? []),
      subregion: json['subregion'] ?? '',
      region: json['region'] ?? '',
      population: json['population'] ?? 0,
      latlng:
          List<double>.from((json['latlng'] ?? []).map((e) => e.toDouble())),
      demonym: json['demonym'] ?? '',
      area: (json['area'] ?? 0).toDouble(),
      timezones: List<String>.from(json['timezones'] ?? []),
      borders: List<String>.from(json['borders'] ?? []),
      nativeName: json['nativeName'] ?? '',
      numericCode: json['numericCode'] ?? '',
      flags: Flag.fromJson(json['flags'] ?? {}),
      currencies: List<Currency>.from(
          (json['currencies'] ?? []).map((e) => Currency.fromJson(e))),
      languages: List<Language>.from(
          (json['languages'] ?? []).map((e) => Language.fromJson(e))),
      translations: Map<String, String>.from(json['translations'] ?? {}),
      regionalBlocs: List<RegionalBloc>.from(
          (json['regionalBlocs'] ?? []).map((e) => RegionalBloc.fromJson(e))),
      independent: json['independent'] ?? false,
    );
  }

  Country copyWith({
    String? name,
    List<String>? topLevelDomain,
    String? alpha2Code,
    String? alpha3Code,
    List<String>? callingCodes,
    String? capital,
    List<String>? altSpellings,
    String? subregion,
    String? region,
    int? population,
    List<double>? latlng,
    String? demonym,
    double? area,
    List<String>? timezones,
    List<String>? borders,
    String? nativeName,
    String? numericCode,
    Flag? flags,
    List<Currency>? currencies,
    List<Language>? languages,
    Map<String, String>? translations,
    List<RegionalBloc>? regionalBlocs,
    bool? independent,
  }) {
    return Country(
      name: name ?? this.name,
      topLevelDomain: topLevelDomain ?? this.topLevelDomain,
      alpha2Code: alpha2Code ?? this.alpha2Code,
      alpha3Code: alpha3Code ?? this.alpha3Code,
      callingCodes: callingCodes ?? this.callingCodes,
      capital: capital ?? this.capital,
      altSpellings: altSpellings ?? this.altSpellings,
      subregion: subregion ?? this.subregion,
      region: region ?? this.region,
      population: population ?? this.population,
      latlng: latlng ?? this.latlng,
      demonym: demonym ?? this.demonym,
      area: area ?? this.area,
      timezones: timezones ?? this.timezones,
      borders: borders ?? this.borders,
      nativeName: nativeName ?? this.nativeName,
      numericCode: numericCode ?? this.numericCode,
      flags: flags ?? this.flags,
      currencies: currencies ?? this.currencies,
      languages: languages ?? this.languages,
      translations: translations ?? this.translations,
      regionalBlocs: regionalBlocs ?? this.regionalBlocs,
      independent: independent ?? this.independent,
    );
  }
}

class Flag {
  final String svg;
  final String png;

  Flag({
    required this.svg,
    required this.png,
  });

  factory Flag.fromJson(Map<String, dynamic> json) {
    return Flag(
      svg: json['svg'] ?? '',
      png: json['png'] ?? '',
    );
  }
}

class Currency {
  final String code;
  final String name;
  final String symbol;

  Currency({
    required this.code,
    required this.name,
    required this.symbol,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      code: json['code'] ?? '',
      name: json['name'] ?? '',
      symbol: json['symbol'] ?? '',
    );
  }
}

class Language {
  final String iso639_1;
  final String iso639_2;
  final String name;
  final String nativeName;

  Language({
    required this.iso639_1,
    required this.iso639_2,
    required this.name,
    required this.nativeName,
  });

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      iso639_1: json['iso639_1'] ?? '',
      iso639_2: json['iso639_2'] ?? '',
      name: json['name'] ?? '',
      nativeName: json['nativeName'] ?? '',
    );
  }
}

class RegionalBloc {
  final String acronym;
  final String name;

  RegionalBloc({
    required this.acronym,
    required this.name,
  });

  factory RegionalBloc.fromJson(Map<String, dynamic> json) {
    return RegionalBloc(
      acronym: json['acronym'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
