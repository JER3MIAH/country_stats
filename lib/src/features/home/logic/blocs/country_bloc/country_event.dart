import 'package:equatable/equatable.dart';

abstract class CountryEvent extends Equatable {
  const CountryEvent();

  @override
  List<Object> get props => [];
}

class GetCountries extends CountryEvent {
  const GetCountries();
}

class SelectRegion extends CountryEvent {
  final String region;
  const SelectRegion({
    required this.region,
  });

  @override
  List<Object> get props => [region];
}

class SelectCountry extends CountryEvent {
  final String countryName;
  const SelectCountry({
    required this.countryName,
  });

  @override
  List<Object> get props => [countryName];
}

class ResetSelectedCountry extends CountryEvent {
  const ResetSelectedCountry();
}

class InputSearchQuery extends CountryEvent {
  final String query;
  const InputSearchQuery({
    required this.query,
  });

  @override
  List<Object> get props => [query];
}
