import 'package:country_stats/src/features/home/logic/blocs/blocs.dart';
import 'package:country_stats/src/features/theme/data/colors.dart';
import 'package:country_stats/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryDetailView extends StatelessWidget {
  const CountryDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return BlocBuilder<CountryBloc, CountryState>(
      builder: (_, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomBackButton(
                onTap: () =>
                    context.read<CountryBloc>().add(ResetSelectedCountry()),
              ),
              YBox(20),
              Wrap(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 401,
                      maxHeight: 560,
                    ),
                    child: AspectRatio(
                      aspectRatio: 560 / 401,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: SvgNework(
                          state.selectedCountry?.flags.svg ?? '',
                        ),
                      ),
                    ),
                  ),
                  XBox(80),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppText(
                        state.selectedCountry?.name ?? '...',
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                      ),
                      YBox(20),
                      Wrap(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildKeyValue(
                                theme,
                                'Native Name',
                                state.selectedCountry?.nativeName ?? '...',
                              ),
                              _buildKeyValue(
                                theme,
                                'Population',
                                state.selectedCountry == null
                                    ? '...'
                                    : formatNumber(
                                        state.selectedCountry!.population),
                              ),
                              _buildKeyValue(
                                theme,
                                'Region',
                                state.selectedCountry?.region ?? '...',
                              ),
                              _buildKeyValue(
                                theme,
                                'Sub Region',
                                state.selectedCountry?.subregion ?? '...',
                              ),
                              _buildKeyValue(
                                theme,
                                'Native Name',
                                state.selectedCountry?.capital ?? '...',
                              ),
                            ],
                          ),
                          XBox(80),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildKeyValue(
                                theme,
                                'Top Lavel Domain',
                                state.selectedCountry?.topLevelDomain
                                        .join(', ') ??
                                    '...',
                              ),
                              _buildKeyValue(
                                theme,
                                'Currencies',
                                state.selectedCountry?.currencies
                                        .map((c) => c.name)
                                        .toList()
                                        .join(', ') ??
                                    '...',
                              ),
                              _buildKeyValue(
                                theme,
                                'Languages',
                                state.selectedCountry?.languages
                                        .map((c) => c.name)
                                        .toList()
                                        .join(', ') ??
                                    '...',
                              ),
                            ],
                          ),
                        ],
                      ),
                      YBox(20),
                      if (state.selectedCountry?.borders.isNotEmpty ?? false)
                        Wrap(
                          children: [
                            AppText(
                              'Border Countries: ',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            ...List.generate(
                              state.selectedCountry?.borders.length ?? 0,
                              (index) {
                                final border =
                                    state.selectedCountry!.borders[index];
                                return Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 100,
                                    maxHeight: 28,
                                  ),
                                  alignment: Alignment.center,
                                  // padding: EdgeInsets.symmetric(
                                  //     horizontal: 10, vertical: 5),
                                  margin:
                                      EdgeInsets.only(right: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                    color: theme.primary,
                                    borderRadius: BorderRadius.circular(2),
                                    boxShadow: [
                                      BoxShadow(
                                        color: appColors.black.withOpacity(.01),
                                        offset: Offset(0, 0),
                                        blurRadius: 4,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: AppText(
                                    border,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                    ],
                  ),
                ],
              ),
              YBox(20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildKeyValue(ColorScheme theme, String key, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text.rich(
        TextSpan(
          text: '$key ',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: theme.onSurface,
          ),
          children: [
            TextSpan(
              text: value,
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
