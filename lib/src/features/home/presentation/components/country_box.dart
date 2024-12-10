import 'package:country_stats/src/features/home/data/models/country.dart';
import 'package:country_stats/src/features/theme/data/colors.dart';
import 'package:country_stats/src/shared/shared.dart';
import 'package:flutter/material.dart';

class CountryBox extends StatelessWidget {
  final Country country;
  final VoidCallback onTap;
  const CountryBox({
    super.key,
    required this.country,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return BounceInAnimation(
      onTap: onTap,
      child: MouseRegion(
        child: Container(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                child: SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: SvgNework(country.flags.svg),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10).copyWith(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      country.name,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                    YBox(10),
                    _buildKeyValue('Population', formatNumber(country.population)),
                    _buildKeyValue('Region', country.region),
                    _buildKeyValue('Capital', country.capital),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKeyValue(String key, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            '$key: ',
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          AppText(
            value,
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ],
      ),
    );
  }
}
