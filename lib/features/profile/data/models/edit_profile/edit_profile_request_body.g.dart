// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EditProfileRequestBodyImpl _$$EditProfileRequestBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$EditProfileRequestBodyImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      birthdate: json['birthdate'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$$EditProfileRequestBodyImplToJson(
        _$EditProfileRequestBodyImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'birthdate': instance.birthdate,
      'phone': instance.phone,
    };
