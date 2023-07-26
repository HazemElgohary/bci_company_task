import 'package:bci_company_task/app/config/theme.dart';
import 'package:bci_company_task/app/config/widgets/inputs/default_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputWidget extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final String? label;
  final double? radius;
  final bool isPassword;
  final bool error;
  final bool enable;
  final Color? background;
  final bool isNumber;
  final bool onlyEn;
  final String? initialValue;
  final bool show;
  final int? maxLength;
  final bool isCreateShop;
  final VoidCallback? onChangeVision;
  final int? maxLines;
  final ValueChanged<String>? onChange;

  const InputWidget({
    Key? key,
    required this.title,
    this.controller,
    this.radius,
    this.label,
    this.onChangeVision,
    this.onChange,
    this.maxLines,
    this.error = false,
    this.onlyEn = false,
    this.enable = true,
    this.show = false,
    this.maxLength,
    this.isCreateShop = false,
    this.isPassword = false,
    this.initialValue,
    this.background,
    this.isNumber = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge!.copyWith(
            color: AppColors.blackColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 9,
        ),
        DefaultFormField(
          enable: enable,
          radius: radius,
          controller: controller,
          onChange: onChange,
          initialValue: initialValue,
          maxLines: maxLines,
          maxLength: maxLength,
          isNumber: isNumber,
          background: background,
          show: show,
          label: label ?? title,
          error: error,
          isCreateShop: isCreateShop,
          isPassword: isPassword,
          onChangeVision: onChangeVision,
          onlyEn: onlyEn,
        ),
      ],
    );
  }
}
