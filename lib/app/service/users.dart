import 'dart:io';

import 'package:bci_company_task/app/helpers/api.dart';
import 'package:bci_company_task/app/helpers/end_points.dart';
import 'package:bci_company_task/app/models/user.dart';

class UserService {
  Future<List<UserModel>> getUsers({
    required int page,
  }) async {
    final res = await Api.get(
      EndPoints.showUser,
      query: {
        'page': page,
      },
    );
    if (res.statusCode != HttpStatus.ok) {
      throw res.data['details'] ?? res.data;
    }

    return (res.data['users']['data'] as List)
        .map(
          (e) => UserModel.fromJson(e),
        )
        .toList();
  }
}
