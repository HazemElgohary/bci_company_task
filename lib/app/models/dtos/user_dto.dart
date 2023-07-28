import 'package:equatable/equatable.dart';

class UserDto extends Equatable {
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
  final String confirmPassword;

  const UserDto({
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
    required this.confirmPassword,
  });


  Map<String,dynamic> toMap(){
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "branch": branch,
      "account": account,
      "age": age,
      "address": address,
      "city": city,
      "country": country,
      "password": password,
    };
  }

  @override
  List<Object?> get props => [
    name,
    email,
    phone,
    branch,
    account,
    age,
    country,
    password,
    confirmPassword,
  ];
}
