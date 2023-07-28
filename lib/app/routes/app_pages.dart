import 'package:get/get.dart';

import '../modules/create_user/bindings/create_user_binding.dart';
import '../modules/create_user/views/create_user_view.dart';
import '../modules/user_management/bindings/user_management_binding.dart';
import '../modules/user_management/views/user_management_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.USER_MANAGEMENT;

  static final routes = [
    GetPage(
      name: _Paths.USER_MANAGEMENT,
      page: () => const UserManagementView(),
      binding: UserManagementBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_USER,
      page: () => const CreateUserView(),
      binding: CreateUserBinding(),
    ),
  ];
}
