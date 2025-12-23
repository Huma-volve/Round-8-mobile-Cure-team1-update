// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChangePasswordRequestBodyImpl _$$ChangePasswordRequestBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$ChangePasswordRequestBodyImpl(
      current_password: json['current_password'] as String,
      new_password: json['new_password'] as String,
      new_password_confirmation: json['new_password_confirmation'] as String,
    );

Map<String, dynamic> _$$ChangePasswordRequestBodyImplToJson(
        _$ChangePasswordRequestBodyImpl instance) =>
    <String, dynamic>{
      'current_password': instance.current_password,
      'new_password': instance.new_password,
      'new_password_confirmation': instance.new_password_confirmation,
    };
