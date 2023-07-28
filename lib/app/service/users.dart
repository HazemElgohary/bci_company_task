import 'dart:io';

import 'package:bci_company_task/app/helpers/api.dart';
import 'package:bci_company_task/app/helpers/end_points.dart';
import 'package:bci_company_task/app/models/dtos/user_dto.dart';
import 'package:bci_company_task/app/models/user.dart';
import 'package:dio/dio.dart';

class UserService {
  Future<UserAndLastModel> getUsers({
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

    return UserAndLastModel.fromJson(res.data['users']);
  }

  Future<String> addUser({
    required UserDto dto,
  }) async {
    final res =
        await Api.post(EndPoints.addUser, body: FormData.fromMap(dto.toMap()));
    if (res.statusCode != HttpStatus.ok) {
      throw res.data['message'] ?? res.data;
    }

    return res.data['message'].toString();
  }
}
