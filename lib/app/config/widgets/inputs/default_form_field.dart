import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../theme.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final double? radius;
  final FocusNode? focusNode;
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

  const DefaultFormField({
    Key? key,
    this.radius,
    this.controller,
    required this.label,
    this.onChangeVision,
    this.focusNode,
    this.onChange,
    this.maxLines,
    this.background,
    this.error = false,
    this.isNumber = false,
    this.onlyEn = false,
    this.enable = true,
    this.show = false,
    this.maxLength,
    this.isCreateShop = false,
    this.isPassword = false,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isCreateShop
        ? Container(
            height: maxLines != null ? null : 50,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 25)),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x40000000),
                  blurRadius: 6,
                  offset: Offset(0, 1),
                ),
              ],
              border: Border.all(
                color: error ? AppColors.primary : const Color(0xFFe9e9e9),
              ),
            ),
            child: TextFormField(
              controller: controller,
              // validator: validator,
              maxLines: maxLines,
              obscureText: show,
              onChanged: onChange,
              inputFormatters: onlyEn
                  ? [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))]
                  : null,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintStyle: context.textTheme.titleLarge!
                    .copyWith(fontSize: 16, color: const Color(0xFFc5c5c5)),
                hintText: label,
                border: InputBorder.none,
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
          )
        : TextFormField(
            enabled: enable,
            focusNode: focusNode,
            controller: controller,
            onChanged: onChange,
            initialValue: initialValue,
            maxLines: maxLines ?? 1,
            maxLength: maxLength,
            obscureText: show,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            inputFormatters: isNumber
                ? [
                    FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                  ]
                : [],
            decoration: InputDecoration(
              fillColor: background,
              filled: background != null ? true : false,
              hintStyle: context.textTheme.titleLarge!
                  .copyWith(fontSize: 18, color: const Color(0xFFc5c5c5)),
              hintText: label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius ?? 35)),
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: error ? AppColors.primary : const Color(0xFFCDCCCC),
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius ?? 35)),
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: error ? AppColors.primary : const Color(0xFFCDCCCC),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius ?? 35)),
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: error ? AppColors.primary : const Color(0xFFCDCCCC),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius ?? 35)),
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: error ? AppColors.primary : const Color(0xFFCDCCCC),
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              suffixIcon: isPassword
                  ? Padding(
                      padding: const EdgeInsetsDirectional.only(
                        end: 14,
                      ),
                      child: IconButton(
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
                      ),
                    )
                  : null,
            ),
          );
  }
}
