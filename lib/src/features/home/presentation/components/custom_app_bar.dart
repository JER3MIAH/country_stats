import 'package:country_stats/src/features/theme/data/colors.dart';
import 'package:country_stats/src/features/theme/logic/bloc/theme_state.dart';
import 'package:country_stats/src/shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final isMobile = DeviceType(context).isMobile;

    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 15 : 40),
      decoration: BoxDecoration(
        color: theme.primary,
        boxShadow: [
          BoxShadow(
            color: appColors.black.withOpacity(.1),
            offset: Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            'Where in the world?',
            fontSize: isMobile ? 14 : 24,
            fontWeight: FontWeight.w800,
          ),
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (_, themeState) {
              return GestureDetector(
                onTap: () => context.read<ThemeBloc>().add(ToggleThemeEvent()),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        themeState.isDarkMode
                            ? CupertinoIcons.moon
                            : CupertinoIcons.sun_max,
                      ),
                      XBox(10),
                      AppText(
                        themeState.isDarkMode ? 'dark mode' : 'light mode',
                        fontSize: isMobile ? 12 : 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
