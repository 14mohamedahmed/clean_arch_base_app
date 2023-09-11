import 'package:aqarmap/features/auth/domain/enitites/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.phoneNumber,
    required super.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        phoneNumber: json['phone_numner'],
        token: json['token'],
      );
}
