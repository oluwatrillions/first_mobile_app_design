// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
      name: json['name'] as String?,
      username: json['username'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String,
      registeredAt: json['registeredAt'] as String,
    );

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'avatar': instance.avatar,
      'registeredAt': instance.registeredAt,
    };
