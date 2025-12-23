// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EditProfileResponseImpl _$$EditProfileResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EditProfileResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: EditProfileData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EditProfileResponseImplToJson(
        _$EditProfileResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$EditProfileDataImpl _$$EditProfileDataImplFromJson(
        Map<String, dynamic> json) =>
    _$EditProfileDataImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      birthdate: json['birthdate'] as String,
    );

Map<String, dynamic> _$$EditProfileDataImplToJson(
        _$EditProfileDataImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'birthdate': instance.birthdate,
    };
