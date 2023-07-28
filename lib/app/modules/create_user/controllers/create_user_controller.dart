import 'dart:developer';

import 'package:bci_company_task/app/models/drawer_item.dart';
import 'package:bci_company_task/app/models/dtos/user_dto.dart';
import 'package:bci_company_task/app/service/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUserController extends GetxController {
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
  final branches = <String>[
    'Abha',
    'Badr',
    'Jizan',
  ];
  final accountType = <String>[
    'User',
    'Administration',
    'Manager',
  ];
  final selectedBranch = Rx<String?>(null);
  final selectedAccount = Rx<String?>(null);

  // service
  final service = Get.find<UserService>();

  // controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final showPassword = false.obs;
  final showConfirm = false.obs;

  final loading = false.obs;

  Future<void> addUser() async {
    try {
      validate();
      loading.value = true;
      final res = await service.addUser(
        dto: UserDto(
          name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          branch: selectedBranch.value!,
          account: selectedAccount.value!,
          age: ageController.text,
          address: addressController.text,
          city: cityController.text,
          country: countryController.text,
          password: passwordController.text,
          confirmPassword: confirmPasswordController.text,
        ),
      );
      Get.back();
      Get.snackbar(res, '');
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      Get.snackbar('error', e.toString());
    } finally {
      loading.value = false;
    }
  }

  void validate() {
    if (nameController.text.isEmpty) {
      throw 'Please enter Name';
    }
    if (emailController.text.isEmpty) {
      throw 'Please enter Email';
    }
    if (phoneController.text.isEmpty) {
      throw 'Please enter Phone';
    }
    if (selectedBranch.value == null) {
      throw 'Please choose branch';
    }
    if (selectedAccount.value == null) {
      throw 'Please choose Account Type';
    }
    if (ageController.text.isEmpty) {
      throw 'Please enter Age';
    }
    if (addressController.text.isEmpty) {
      throw 'Please enter Address';
    }
    if (cityController.text.isEmpty) {
      throw 'Please enter City';
    }
    if (countryController.text.isEmpty) {
      throw 'Please enter Country';
    }
    if (passwordController.text != confirmPasswordController.text) {
      throw 'Password doesn\'t match';
    }
  }
}
