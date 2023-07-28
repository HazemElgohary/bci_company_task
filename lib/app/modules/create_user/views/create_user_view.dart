import 'package:bci_company_task/app/config/widgets/app_bar.dart';
import 'package:bci_company_task/app/config/widgets/drawer.dart';
import 'package:bci_company_task/app/config/widgets/inputs/default_form_field.dart';
import 'package:bci_company_task/app/config/widgets/inputs/input_button.dart';
import 'package:bci_company_task/app/config/widgets/pickers/pick_branch.dart';
import 'package:bci_company_task/app/config/widgets/resposive_layout.dart';
import 'package:bci_company_task/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_user_controller.dart';

class CreateUserView extends GetView<CreateUserController> {
  const CreateUserView({Key? key}) : super(key: key);

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const UserAppBar(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Create User',
                      style: context.textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 16,
                        left: 16,
                        right: 16,
                      ),
                      child: SingleChildScrollView(
                        padding: EdgeInsets.zero,
                        child: Column(
                          children: [
                            Wrap(
                              spacing: 16,
                              children: [
                                DefaultFormField(
                                  controller: controller.nameController,
                                  label: 'Name',
                                  isLarge: true,
                                ),
                                DefaultFormField(
                                  controller: controller.emailController,
                                  label: 'Email',
                                  isLarge: true,
                                ),
                                DefaultFormField(
                                  controller: controller.phoneController,
                                  label: 'Phone Number',
                                  isNumber: true,
                                  isLarge: true,
                                ),
                                PickFromList(
                                  label: 'Assign Branch',
                                  items: controller.branches,
                                  onChanged: (value) {
                                    controller.selectedBranch.value = value;
                                  },
                                  isLarge: true,
                                ),
                                PickFromList(
                                  label: 'Account',
                                  items: controller.accountType,
                                  onChanged: (value) {
                                    controller.selectedAccount.value = value;
                                  },
                                  isLarge: true,
                                ),
                                DefaultFormField(
                                  controller: controller.ageController,
                                  label: 'Age',
                                  isNumber: true,
                                  isLarge: true,
                                ),
                                DefaultFormField(
                                  controller: controller.addressController,
                                  label: 'Address',
                                  isLarge: true,
                                ),
                                DefaultFormField(
                                  controller: controller.cityController,
                                  label: 'City',
                                  isLarge: true,
                                ),
                                DefaultFormField(
                                  controller: controller.countryController,
                                  label: 'Country',
                                  isLarge: true,
                                ),
                                Obx(
                                  () => DefaultFormField(
                                    controller: controller.passwordController,
                                    label: 'Password',
                                    isLarge: true,
                                    show: controller.showPassword.value,
                                    onChangeVision: () {
                                      controller.showPassword.value =
                                          !controller.showPassword.value;
                                    },
                                    isPassword: true,
                                  ),
                                ),
                                Obx(
                                  () => DefaultFormField(
                                    controller:
                                        controller.confirmPasswordController,
                                    label: 'Confirm password',
                                    isLarge: true,
                                    show: controller.showConfirm.value,
                                    onChangeVision: () {
                                      controller.showConfirm.value =
                                          !controller.showConfirm.value;
                                    },
                                    isPassword: true,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SecondButton(
                                  label: 'Cancel',
                                  onTap: Get.back,
                                ),
                                Obx(
                                  () => DefaultButton(
                                    label: 'Save',
                                    loading: controller.loading.value,
                                    onTap: controller.addUser,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      smallLayout: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserAppBar(isPhone: true),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Create User',
                  style: context.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16,
                    left: 16,
                    right: 16,
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.zero,
                    child: Column(
                      children: [
                        Wrap(
                          spacing: 16,
                          children: [
                            DefaultFormField(
                              controller: controller.nameController,
                              label: 'Name',
                            ),
                            DefaultFormField(
                              controller: controller.emailController,
                              label: 'Email',
                            ),
                            DefaultFormField(
                              controller: controller.phoneController,
                              label: 'Phone Number',
                              isNumber: true,
                            ),
                            PickFromList(
                              label: 'Assign Branch',
                              items: controller.branches,
                              onChanged: (value) {
                                controller.selectedBranch.value = value;
                              },
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            PickFromList(
                              label: 'Account',
                              items: controller.accountType,
                              onChanged: (value) {
                                controller.selectedAccount.value = value;
                              },
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            DefaultFormField(
                              controller: controller.ageController,
                              label: 'Age',
                              isNumber: true,
                            ),
                            DefaultFormField(
                              controller: controller.addressController,
                              label: 'Address',
                            ),
                            DefaultFormField(
                              controller: controller.cityController,
                              label: 'City',
                            ),
                            DefaultFormField(
                              controller: controller.countryController,
                              label: 'Country',
                            ),
                            Obx(
                              () => DefaultFormField(
                                controller: controller.passwordController,
                                label: 'Password',
                                show: controller.showPassword.value,
                                onChangeVision: () {
                                  controller.showPassword.value =
                                      !controller.showPassword.value;
                                },
                                isPassword: true,
                              ),
                            ),
                            Obx(
                              () => DefaultFormField(
                                controller:
                                    controller.confirmPasswordController,
                                label: 'Confirm password',
                                show: controller.showConfirm.value,
                                onChangeVision: () {
                                  controller.showConfirm.value =
                                      !controller.showConfirm.value;
                                },
                                isPassword: true,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SecondButton(
                              label: 'Cancel',
                              onTap: Get.back,
                            ),
                            Obx(
                              () => DefaultButton(
                                label: 'Save',
                                loading: controller.loading.value,
                                onTap: controller.addUser,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        drawer: CustomDrawer(
          isPhone: true,
          items: controller.drawerItems,
        ),
      ),
    );
  }
}
