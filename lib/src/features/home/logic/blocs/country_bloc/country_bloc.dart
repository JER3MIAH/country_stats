import 'dart:convert';
import 'dart:developer';

import 'package:country_stats/src/features/home/data/models/country.dart';
import 'package:country_stats/src/shared/shared.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc() : super(const CountryState()) {
    on<GetCountries>(_getCoutries);
    on<SelectRegion>(_selectRegion);
    on<SelectCountry>(_selectCountry);
    on<ResetSelectedCountry>(_resetSelectedCountry);
    on<InputSearchQuery>(_inputSearchQuery);
  }

  void _getCoutries(GetCountries event, Emitter<CountryState> emit) async {
    try {
      String jsonString = await rootBundle.loadString('assets/json/data.json');
      final jsonData =
          jsonDecode(jsonString) as List;
      final countries = jsonData
          .map((c) => Country.fromJson(c as Map<String, dynamic>))
          .toList();
      emit(
        state.copyWith(
          countries: countries,
          filteredCountries: countries,
        ),
      );
    } catch (e, stack) {
      log('An error occured while getting countries:\n$e\n$stack');
    }
  }

  void _selectRegion(SelectRegion event, Emitter<CountryState> emit) {
    final filteredCountries = state.countries
        .where(
          (country) =>
              (state.searchQuery.isEmpty
                  ? true
                  : country.name
                      .toLowerCase()
                      .contains(state.searchQuery.toLowerCase())) &&
              (event.region == ALL_REGIONS
                  ? true
                  : country.region.toLowerCase() == event.region.toLowerCase()),
        )
        .toList();

    emit(state.copyWith(
      selectedRegion: event.region,
      filteredCountries: filteredCountries,
    ));
  }

  void _selectCountry(SelectCountry event, Emitter<CountryState> emit) {
    try {
      final selectedCountry = state.countries.firstWhere(
        (country) => country.name == event.countryName,
      );
      emit(
        state.copyWith(
          selectedCountry: selectedCountry,
        ),
      );
    } catch (e, stack) {
      log('An error occured while slecting country:\n$e\n$stack');
    }
  }

  void _resetSelectedCountry(
      ResetSelectedCountry event, Emitter<CountryState> emit) {
    emit(state.copyWith(
      selectedCountry: null,
      overrideSelectedCountry: true,
    ));
  }

  void _inputSearchQuery(InputSearchQuery event, Emitter<CountryState> emit) {
    if (event.query.isEmpty) {
      emit(state.copyWith(
        searchQuery: event.query,
        filteredCountries: state.countries,
      ));
      return;
    }
    final filteredCountries = state.countries
        .where(
          (country) =>
              country.name.toLowerCase().contains(event.query.toLowerCase()) &&
              (state.selectedRegion == ALL_REGIONS
                  ? true
                  : country.region.toLowerCase() ==
                      state.selectedRegion.toLowerCase()),
        )
        .toList();
    emit(state.copyWith(
      searchQuery: event.query,
      filteredCountries: filteredCountries,
    ));
  }
}
