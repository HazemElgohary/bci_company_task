import 'package:bci_company_task/app/config/widgets/drawer.dart';
import 'package:bci_company_task/app/config/widgets/resposive_layout.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_management_controller.dart';

class UserManagementView extends GetView<UserManagementController> {
  const UserManagementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeLayout: Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: 3,
              child: CustomDrawer(
                items: controller.drawerItems,
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(

              ),
            ),
          ],
        ),
      ),
      smallLayout: Scaffold(
        body: Column(
          children: [
            Text('small'),
          ],
        ),
      ),
    );
  }
}
