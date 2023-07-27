import 'package:bci_company_task/app/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAppBar extends StatelessWidget {
  const UserAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor,),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'User Management',
              style: context.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          ),
          const Icon(Icons.notifications_none_outlined),
          const SizedBox(width: 24,),
          const Icon(Icons.help_outline),
          const SizedBox(width: 24,),
          Text(
            'Super Admin',
            style: context.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          const SizedBox(width: 10,),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}
