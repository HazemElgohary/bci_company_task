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
        return user.name;
      case 'Phone number':
        return user.name;
      case 'Branch':
        return user.name;
      case 'Account':
        return user.name;
      case 'Age':
        return user.name;
      default:
        return '';
    }
  }
}
