import 'package:bci_company_task/app/models/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserManagementController extends GetxController {
  final drawerItems = <DrawerItemModel>[
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
}
