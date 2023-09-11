import 'package:equatable/equatable.dart';

// This object is not real, We will update it later.
class User extends Equatable {
  final int id;
  final String name;
  final String phoneNumber;
  final String token;

  const User({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.token,
  });

  @override
  List<Object?> get props => [id, name, phoneNumber, token];
}
