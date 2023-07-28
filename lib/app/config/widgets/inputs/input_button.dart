import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme.dart';

class DefaultButton extends StatelessWidget {
  final String? label;
  final bool loading;
  final VoidCallback onTap;

  const DefaultButton({
    Key? key,
    required this.onTap,
    this.label, this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 117,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: label != null
              ? Center(
                child: loading?CircularProgressIndicator.adaptive():Text(
                    label!,
                    style: context.textTheme.titleLarge!.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: AppColors.blackColor,
                    ),
                    Text(
                      'Add user',
                      style: context.textTheme.titleLarge!.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
class SecondButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const SecondButton({
    Key? key,
    required this.onTap,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 117,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            border: Border.all(color: AppColors.borderColor,width: 5,),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Center(
            child: Text(
              label,
              style: context.textTheme.titleLarge!.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
