import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

enum UserRole { renter, owner, company }

@JsonSerializable()
class UserModel {
  final String id;
  final String email;
  final String name;
  final String? phoneNumber;
  final String? avatarUrl;
  final UserRole role;
  final String? companyName; // Only for company role

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.phoneNumber,
    this.avatarUrl,
    required this.role,
    this.companyName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
