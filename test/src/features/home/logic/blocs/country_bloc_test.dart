import 'package:bloc_test/bloc_test.dart';
import 'package:country_stats/src/features/home/data/models/country.dart';
import 'package:country_stats/src/features/home/logic/blocs/country_bloc/country_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CountryBloc countryBloc;

  setUp(() {
    countryBloc = CountryBloc();
  });

  tearDown(() {
    countryBloc.close();
  });

  group(
    'Country Bloc -',
    () {
      blocTest(
        'emit state with updated region when [SelectRegion] event is added',
        build: () => countryBloc,
        act: (bloc) => bloc.add(SelectRegion(region: 'region')),
        expect: () => [
          isA<CountryState>().having(
            (state) => state.selectedRegion,
            'Selected Region',
            'region',
          ),
        ],
      );

      blocTest(
        'emit state with updated selectedCountry when [SelectCountry] event is added',
        build: () => countryBloc,
        seed: () => CountryState(
            countries: [Country.empty().copyWith(name: 'country')]),
        act: (bloc) {
          bloc.add(SelectCountry(countryName: 'country'));
        },
        expect: () => [
          isA<CountryState>().having(
            (state) => state.selectedCountry,
            'Selected Country',
            isA<Country>().having(
              (country) => country.name,
              'Country name',
              'country',
            ),
          ),
        ],
      );

      blocTest(
        'emit state with null selectedCountry when [ResetSelectedCountry] event is added',
        build: () => countryBloc,
        act: (bloc) => bloc.add(ResetSelectedCountry()),
        expect: () => [
          isA<CountryState>().having(
            (state) => state.selectedCountry,
            'Selected Country',
            isNull,
          ),
        ],
      );

      blocTest(
        'emit state with updated searchQuery when [InputSearchQuery] event is added',
        build: () => countryBloc,
        act: (bloc) => bloc.add(InputSearchQuery(query: 'query')),
        expect: () => [
          isA<CountryState>().having(
            (state) => state.searchQuery,
            'Search Query',
            'query',
          ),
        ],
      );
    },
  );
}
