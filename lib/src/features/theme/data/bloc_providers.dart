import 'package:country_stats/src/features/theme/logic/bloc/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<BlocProvider> themeBlocProviders = [
  BlocProvider<ThemeBloc>(create: (_) => ThemeBloc()),
];
