import 'package:bci_company_task/app/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickFromList extends StatelessWidget {
  final List<String> items;
  final String label;
  final String? selected;
  final bool isLarge;
  final ValueChanged<String> onChanged;

  const PickFromList({
    Key? key,
    required this.items,
    required this.onChanged,
    this.selected,
    this.isLarge = false, required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return DropdownMenu<String>(
          width: isLarge
              ? ((constraints.maxWidth / 3) - 16)
              : constraints.maxWidth,
          onSelected: (value) {
            if (value == null) return;
            onChanged(value);
          },
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(
                color: AppColors.borderColor,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(
                color: AppColors.borderColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(
                color: AppColors.borderColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(
                color: AppColors.borderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(
                color: AppColors.blackColor,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(
                color: AppColors.borderColor,
              ),
            ),
          ),
          label: Text(
            label,
            style: context.textTheme.titleLarge!.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          dropdownMenuEntries: items
              .map(
                (e) => DropdownMenuEntry(value: e, label: e),
              )
              .toList(),
        );
      },
    );
  }
}
