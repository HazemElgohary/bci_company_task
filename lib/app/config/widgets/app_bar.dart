import 'package:bci_company_task/app/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAppBar extends StatelessWidget {
  final bool isPhone;

  const UserAppBar({
    Key? key,
    this.isPhone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: EdgeInsets.symmetric(horizontal: isPhone ? 0 : 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.borderColor,
        ),
      ),
      child: Row(
        children: [
          if (isPhone)
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
            ),
          Expanded(
            child: Text(
              'User Management',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: isPhone ? 16 : 20,
              ),
            ),
          ),
          const Icon(Icons.notifications_none_outlined),
          if (!isPhone)
            const SizedBox(
              width: 24,
            ),
          const Icon(Icons.help_outline),
          const SizedBox(
            width: 24,
          ),
          Text(
            'Super Admin',
            style: context.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}
