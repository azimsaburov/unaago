// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: json['id'] as String,
  email: json['email'] as String,
  name: json['name'] as String,
  phoneNumber: json['phoneNumber'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
  role: $enumDecode(_$UserRoleEnumMap, json['role']),
  companyName: json['companyName'] as String?,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'name': instance.name,
  'phoneNumber': instance.phoneNumber,
  'avatarUrl': instance.avatarUrl,
  'role': _$UserRoleEnumMap[instance.role]!,
  'companyName': instance.companyName,
};

const _$UserRoleEnumMap = {
  UserRole.renter: 'renter',
  UserRole.owner: 'owner',
  UserRole.company: 'company',
};
