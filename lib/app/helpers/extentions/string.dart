import 'package:bci_company_task/app/models/user.dart';

extension ToPermissionEnum on String {
  DateTime toDate() {
    return DateTime.parse(this);
  }

  String toUserModel(UserModel user) {
    switch (this) {
      case 'Name':
        return user.name;
      case 'Email':
        return user.email;
      case 'Phone number':
        return user.phone;
      case 'Branch':
        return user.branch;
      case 'Account':
        return user.account;
      case 'Age':
        return user.age;
      default:
        return '';
    }
  }
}
