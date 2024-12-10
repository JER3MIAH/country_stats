import 'package:equatable/equatable.dart';
import 'package:country_stats/src/features/home/data/models/country.dart';
import 'package:country_stats/src/shared/utils/utils.dart';

export 'country_bloc.dart';
export 'country_event.dart';

class CountryState extends Equatable {
  final Country? selectedCountry;
  final String selectedRegion;
  final String searchQuery;
  final List<Country> countries;
  final List<Country> filteredCountries;
  const CountryState({
    this.selectedCountry,
    this.selectedRegion = ALL_REGIONS,
    this.searchQuery = '',
    this.countries = const [],
    this.filteredCountries = const [],
  });

  @override
  List<Object> get props => [
        selectedCountry ?? '',
        selectedRegion,
        searchQuery,
        countries,
        filteredCountries,
      ];

  CountryState copyWith({
    Country? selectedCountry,
    String? selectedRegion,
    String? searchQuery,
    List<Country>? countries,
    List<Country>? filteredCountries,
    bool overrideSelectedCountry = true,
  }) {
    return CountryState(
      selectedCountry:
          overrideSelectedCountry ? selectedCountry : this.selectedCountry,
      selectedRegion: selectedRegion ?? this.selectedRegion,
      searchQuery: searchQuery ?? this.searchQuery,
      countries: countries ?? this.countries,
      filteredCountries: filteredCountries ?? this.filteredCountries,
    );
  }
}
