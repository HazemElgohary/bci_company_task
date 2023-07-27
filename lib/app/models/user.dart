import 'package:equatable/equatable.dart';

class UserAndLastModel extends Equatable {
  final int lastPage;
  final int total;
  final List<UserModel> users;

  const UserAndLastModel({
    required this.total,
    required this.lastPage,
    required this.users,
  });

  factory UserAndLastModel.fromJson(Map<String, dynamic> json) {
    return UserAndLastModel(
      lastPage: json['last_page'],
      total: json['total'],
      users:  (json['data'] as List).map((e) => UserModel.fromJson(e)).toList(),
    );
  }

  @override
  List<Object?> get props => [
        lastPage
      ];
}
class UserModel extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String branch;
  final String account;
  final String age;
  final String address;
  final String city;
  final String country;
  final String password;
  final String createdAt;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.branch,
    required this.account,
    required this.age,
    required this.address,
    required this.city,
    required this.country,
    required this.password,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      branch: json['branch'],
      account: json['account'],
      age: json['age'],
      address: json['address'],
      city: json['city'],
      country: json['country'],
      password: json['password'],
      createdAt: json['created_at'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phone,
        branch,
        account,
        age,
        country,
        password,
        createdAt,
      ];
}
