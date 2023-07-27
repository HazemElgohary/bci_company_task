import 'package:bci_company_task/app/helpers/extentions/string.dart';
import 'package:bci_company_task/app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRowItem extends StatelessWidget {
  final UserModel user;
  final String text;
  const UserRowItem({Key? key, required this.user, required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          text.toUserModel(user),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
