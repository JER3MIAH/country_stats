import 'package:country_stats/src/features/home/logic/blocs/country_bloc/country_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<BlocProvider> homeBlocProviders = [
  BlocProvider<CountryBloc>(create: (_) => CountryBloc()..add(GetCountries())),
];
