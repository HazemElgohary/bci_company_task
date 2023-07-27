import 'package:bci_company_task/app/config/theme.dart';
import 'package:bci_company_task/app/config/widgets/app_bar.dart';
import 'package:bci_company_task/app/config/widgets/drawer.dart';
import 'package:bci_company_task/app/config/widgets/inputs/input_button.dart';
import 'package:bci_company_task/app/config/widgets/pagination_item.dart';
import 'package:bci_company_task/app/config/widgets/resposive_layout.dart';
import 'package:bci_company_task/app/config/widgets/user_row_item.dart';
import 'package:bci_company_task/app/models/user.dart';
import 'package:bci_company_task/app/models/user.dart';
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const UserAppBar(),
                  DefaultButton(
                    onTap: () {},
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 16,
                        left: 16,
                        right: 16,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: AppColors.borderColor),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Obx(
                                  () => controller.loading.value
                                      ? const Center(
                                          child: CircularProgressIndicator
                                              .adaptive())
                                      : Table(
                                          children: [
                                            TableRow(
                                              decoration: BoxDecoration(
                                                color: AppColors.primary,
                                              ),
                                              children: controller.tableList
                                                  .map(
                                                    (e) => Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                              8, 0, 0, 0),
                                                      child: SizedBox(
                                                        height: 40,
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional
                                                                  .centerStart,
                                                          child: Text(
                                                            e,
                                                            style: context
                                                                .textTheme
                                                                .titleLarge!
                                                                .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                            ),
                                            ...(controller.item.value?.users ??
                                                    <UserModel>[])
                                                .map(
                                                  (element) => TableRow(
                                                    decoration: BoxDecoration(
                                                      color: (controller
                                                                      .item
                                                                      .value
                                                                      ?.users ??
                                                                  <UserModel>[])
                                                              .indexOf(element)
                                                              .isEven
                                                          ? null
                                                          : AppColors.primary,
                                                    ),
                                                    children: controller
                                                        .tableList
                                                        .map(
                                                      (e) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                            8,
                                                            0,
                                                            0,
                                                            0,
                                                          ),
                                                          child: UserRowItem(
                                                              user: element,
                                                              text: e),
                                                        );
                                                      },
                                                    ).toList(),
                                                  ),
                                                )
                                                .toList(),
                                          ],
                                        ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Text(
                                    '10 Row',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        context.textTheme.titleLarge!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const Icon(Icons.keyboard_arrow_down),
                                  Obx(() => controller.item.value?.total != null
                                      ? Text(
                                          'Total ${controller.item.value?.total}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: context.textTheme.titleLarge!
                                              .copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                          ),
                                        )
                                      : const SizedBox.shrink()),
                                  const Spacer(),
                                  Obx(
                                    () => PaginationItem(
                                      page: controller.page.value,
                                      last:
                                          controller.item.value?.lastPage ?? 0,
                                      onBack: () {
                                        controller.page.value--;
                                      },
                                      onProgress: () {
                                        controller.page.value++;
                                      },
                                    ),
                                  ),
                                  Spacer(),
                                  Obx(
                                        () => SecondPaginationItem(
                                      page: controller.page.value,
                                      last:
                                      controller.item.value?.lastPage ?? 0,
                                      onProgress: () {
                                        controller.page.value++;
                                      },
                                    ),
                                  ),
                                ],
                              ),
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
      smallLayout: const Scaffold(
        body: Column(
          children: [
            Text('small'),
          ],
        ),
      ),
    );
  }
}
