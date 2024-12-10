import 'package:country_stats/src/features/theme/data/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextfield extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;
  const SearchTextfield({
    super.key,
    required this.controller,
     this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final tStyle = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: theme.onSurface,
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: appColors.black.withOpacity(.06),
            offset: Offset(0, 2),
            blurRadius: 9,
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        cursorColor: theme.primary,
        style: tStyle,
        keyboardType: TextInputType.text,
        onChanged:onChanged ,
        decoration: InputDecoration(
          filled: true,
          fillColor: theme.primary,
          border: InputBorder.none,
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: theme.onSurface,
            size: 18,
          ),
          hintText: 'Search for a country...',
          hintStyle: tStyle.copyWith(
            color: theme.onSurface.withOpacity(.25),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 12,
          ).copyWith(top: 12),
          constraints: BoxConstraints(
            minHeight: 56,
            maxHeight: 56,
            maxWidth: 480,
          ),
        ),
      ),
    );
  }
}
