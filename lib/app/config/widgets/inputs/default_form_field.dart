import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../theme.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final bool isNumber;
  final bool isLarge;
  final bool show;
  final VoidCallback? onChangeVision;

  const DefaultFormField({
    Key? key,
    required this.controller,
    required this.label,
    this.onChangeVision,
    this.isNumber = false,
    this.show = false,
    this.isPassword = false,
    this.isLarge = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: isLarge
              ? isPassword
                  ? ((constraints.maxWidth / 2) - 16)
                  : ((constraints.maxWidth / 3) - 16)
              : constraints.maxWidth,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
            child: TextFormField(
              controller: controller,
              obscureText: show,
              keyboardType:
                  isNumber ? TextInputType.number : TextInputType.text,
              inputFormatters: isNumber
                  ? [
                      FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                    ]
                  : [],
              decoration: InputDecoration(
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
                label: Text(
                  label,
                  style: context.textTheme.titleLarge!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                suffixIcon: isPassword
                    ? IconButton(
                        onPressed: onChangeVision,
                        icon: show
                            ? const Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.grey,
                              )
                            : const Icon(
                                Icons.visibility_off_outlined,
                                color: Colors.grey,
                              ),
                      )
                    : null,
              ),
            ),
          ),
        );
      },
    );
  }
}
