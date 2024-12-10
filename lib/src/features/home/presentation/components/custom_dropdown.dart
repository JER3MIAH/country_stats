import 'package:country_stats/src/features/home/logic/blocs/blocs.dart';
import 'package:country_stats/src/features/theme/data/colors.dart';
import 'package:country_stats/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomDropdown extends HookWidget {
  const CustomDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final selectedRegion = useState<String>(ALL_REGIONS);

    void selectRegion(String? value) {
      if (value != null) {
        context.read<CountryBloc>().add(SelectRegion(region: value));
        selectedRegion.value = value;
      }
    }

    return PopupMenuButton(
      position: PopupMenuPosition.under,
      color: theme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      constraints: BoxConstraints(
        minWidth: 200,
      ),
      itemBuilder: (_) {
        return REGIONS
            .map(
              (e) => PopupMenuItem(
                onTap: () {
                  selectRegion(e);
                },
                child: AppText(
                  e,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
            .toList();
      },
      child: Container(
        width: 200,
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
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
              selectedRegion.value,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: theme.onSurface,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
