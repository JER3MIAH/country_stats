import 'package:country_stats/src/features/home/logic/blocs/blocs.dart';
import 'package:country_stats/src/features/home/presentation/components/components.dart';
import 'package:country_stats/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context).colorScheme;
    final isMobile = DeviceType(context).isMobile;
    final searchController = useTextEditingController();

    return BlocBuilder<CountryBloc, CountryState>(
      builder: (_, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: CustomAppBar(),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 15 : 40)
                .copyWith(top: 30),
            child: Column(
              children: [
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    SearchTextfield(controller: searchController),
                    XBox(30),
                    CustomDropdown(),
                  ],
                ),
                YBox(20),
                Expanded(
                  child: GridView.builder(
                    itemCount: state.filteredCountries.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 264,
                      childAspectRatio: 264 / 336,
                      mainAxisSpacing: 40,
                      crossAxisSpacing: 40,
                    ),
                    itemBuilder: (context, index) {
                      final country = state.filteredCountries[index];
                      return CountryBox(
                        country: country,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
