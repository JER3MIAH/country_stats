import 'package:country_stats/src/features/home/data/models/country.dart';
import 'package:country_stats/src/features/theme/data/colors.dart';
import 'package:country_stats/src/shared/shared.dart';
import 'package:flutter/material.dart';

class CountryBox extends StatelessWidget {
  final Country country;
  const CountryBox({
    super.key,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: theme.primary,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: appColors.black.withOpacity(.02),
            offset: Offset(0, 0),
            blurRadius: 7,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [AppText(country.name)],
      ),
    );
  }
}
