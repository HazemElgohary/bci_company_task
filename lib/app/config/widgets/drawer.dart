import 'package:bci_company_task/app/config/theme.dart';
import 'package:bci_company_task/app/models/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  final List<DrawerItemModel> items;
  final bool isPhone;

  const CustomDrawer({Key? key, required this.items, this.isPhone = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: AppColors.primary,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.second,
                  border: Border.all(
                    color: AppColors.borderColor,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'TestX',
                          style: context.textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const Directionality(
                        textDirection: TextDirection.rtl,
                        child: Icon(
                          Icons.sort,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                leading: const Icon(Icons.computer),
                title: Text(
                  'Dashboard',
                  style: context.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
              ...items.map((e) => DrawerItem(item: e,),).toList(),
            ],
          ),
        ),
      ),
    );
  }
}


class DrawerItem extends StatelessWidget {
  final DrawerItemModel item;
  const DrawerItem({Key? key,required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      leading: Icon(item.icon),
      title: Text(
        item.text,
        style: context.textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
      trailing: const Icon(Icons.keyboard_arrow_down),
    );
  }
}
