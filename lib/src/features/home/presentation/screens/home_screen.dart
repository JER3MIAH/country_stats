import 'package:country_stats/src/features/home/presentation/components/components.dart';
import 'package:country_stats/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final isMobile = DeviceType(context).isMobile;
    final searchController = useTextEditingController();

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
                CustomDropdown(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
