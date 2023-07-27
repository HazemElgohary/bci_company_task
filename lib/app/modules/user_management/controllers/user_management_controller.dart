import 'dart:developer';

import 'package:bci_company_task/app/models/drawer_item.dart';
import 'package:bci_company_task/app/models/user.dart';
import 'package:bci_company_task/app/service/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserManagementController extends GetxController {
  final service = Get.find<UserService>();
  final drawerItems = const <DrawerItemModel>[
    DrawerItemModel(
      icon: Icons.bar_chart_sharp,
      text: 'Report',
    ),
    DrawerItemModel(
      icon: Icons.person_outline_rounded,
      text: 'User Management',
    ),
    DrawerItemModel(
      icon: Icons.storefront_sharp,
      text: 'Branch & Inventory',
    ),
    DrawerItemModel(
      icon: Icons.receipt_long_rounded,
      text: 'Invoices',
    ),
    DrawerItemModel(
      icon: Icons.contact_mail_outlined,
      text: 'Contacts',
    ),
    DrawerItemModel(
      icon: Icons.local_offer_outlined,
      text: 'Promotion',
    ),
    DrawerItemModel(
      icon: Icons.settings_outlined,
      text: 'Settings',
    ),
  ];
  final tableList = const <String>[
    'Name',
    'Email',
    'Phone number',
    'Branch',
    'Account',
    'Age',
  ];

  final users = <UserModel>[].obs;

  final loading = false.obs;
  final page = 1.obs;

  Future<void> getUsers() async {
    try {
      loading.value = true;

      users.assignAll(
        await service.getUsers(
          page: page.value,
        ),
      );
      users.addAll(
        await service.getUsers(
          page: page.value,
        ),
      );users.addAll(
        await service.getUsers(
          page: page.value,
        ),
      );
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      Get.snackbar('error', e.toString());
    } finally {
      loading.value = false;
    }
  }

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }
}
