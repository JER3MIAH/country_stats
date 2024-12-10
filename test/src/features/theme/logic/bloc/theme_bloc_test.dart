import 'package:bloc_test/bloc_test.dart';
import 'package:country_stats/src/features/theme/logic/bloc/theme_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ThemeBloc themeBloc;

  setUp(() {
    themeBloc = ThemeBloc();
  });

  tearDown(() {
    themeBloc.close();
  });

  group(
    'Theme Bloc -',
    () {
      blocTest<ThemeBloc, ThemeState>(
        'emits updated isDarkMode when ToggleThemeEvent is added',
        build: () => themeBloc,
        seed: () => ThemeState(isDarkMode: true),
        act: (bloc) => bloc.add(ToggleThemeEvent()),
        expect: () => [ThemeState(isDarkMode: false)],
      );
    },
  );
}
