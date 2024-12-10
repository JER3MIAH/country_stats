import 'package:country_stats/src/features/theme/data/colors.dart';
import 'package:country_stats/src/shared/shared.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onTap;
  const CustomBackButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return BounceInAnimation(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          width: 136,
          height: 40,
          decoration: BoxDecoration(
            color: theme.primary,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: appColors.black.withOpacity(.02),
                offset: Offset(0, 0),
                blurRadius: 7,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back,
                color: theme.onSurface,
                size: 20,
              ),
              XBox(9),
              AppText(
                'Back',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: theme.onSurface,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
