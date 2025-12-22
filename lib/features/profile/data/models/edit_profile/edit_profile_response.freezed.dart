// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EditProfileResponse _$EditProfileResponseFromJson(Map<String, dynamic> json) {
  return _EditProfileResponse.fromJson(json);
}

/// @nodoc
mixin _$EditProfileResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  EditProfileData get data => throw _privateConstructorUsedError;

  /// Serializes this EditProfileResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EditProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditProfileResponseCopyWith<EditProfileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileResponseCopyWith<$Res> {
  factory $EditProfileResponseCopyWith(
          EditProfileResponse value, $Res Function(EditProfileResponse) then) =
      _$EditProfileResponseCopyWithImpl<$Res, EditProfileResponse>;
  @useResult
  $Res call({bool success, String message, EditProfileData data});

  $EditProfileDataCopyWith<$Res> get data;
}

/// @nodoc
class _$EditProfileResponseCopyWithImpl<$Res, $Val extends EditProfileResponse>
    implements $EditProfileResponseCopyWith<$Res> {
  _$EditProfileResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as EditProfileData,
    ) as $Val);
  }

  /// Create a copy of EditProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EditProfileDataCopyWith<$Res> get data {
    return $EditProfileDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EditProfileResponseImplCopyWith<$Res>
    implements $EditProfileResponseCopyWith<$Res> {
  factory _$$EditProfileResponseImplCopyWith(_$EditProfileResponseImpl value,
          $Res Function(_$EditProfileResponseImpl) then) =
      __$$EditProfileResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, EditProfileData data});

  @override
  $EditProfileDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$EditProfileResponseImplCopyWithImpl<$Res>
    extends _$EditProfileResponseCopyWithImpl<$Res, _$EditProfileResponseImpl>
    implements _$$EditProfileResponseImplCopyWith<$Res> {
  __$$EditProfileResponseImplCopyWithImpl(_$EditProfileResponseImpl _value,
      $Res Function(_$EditProfileResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$EditProfileResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as EditProfileData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EditProfileResponseImpl implements _EditProfileResponse {
  const _$EditProfileResponseImpl(
      {required this.success, required this.message, required this.data});

  factory _$EditProfileResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditProfileResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final EditProfileData data;

  @override
  String toString() {
    return 'EditProfileResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditProfileResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of EditProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditProfileResponseImplCopyWith<_$EditProfileResponseImpl> get copyWith =>
      __$$EditProfileResponseImplCopyWithImpl<_$EditProfileResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditProfileResponseImplToJson(
      this,
    );
  }
}

abstract class _EditProfileResponse implements EditProfileResponse {
  const factory _EditProfileResponse(
      {required final bool success,
      required final String message,
      required final EditProfileData data}) = _$EditProfileResponseImpl;

  factory _EditProfileResponse.fromJson(Map<String, dynamic> json) =
      _$EditProfileResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  EditProfileData get data;

  /// Create a copy of EditProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditProfileResponseImplCopyWith<_$EditProfileResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EditProfileData _$EditProfileDataFromJson(Map<String, dynamic> json) {
  return _EditProfileData.fromJson(json);
}

/// @nodoc
mixin _$EditProfileData {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get birthdate => throw _privateConstructorUsedError;

  /// Serializes this EditProfileData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EditProfileData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditProfileDataCopyWith<EditProfileData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileDataCopyWith<$Res> {
  factory $EditProfileDataCopyWith(
          EditProfileData value, $Res Function(EditProfileData) then) =
      _$EditProfileDataCopyWithImpl<$Res, EditProfileData>;
  @useResult
  $Res call({String name, String email, String phone, String birthdate});
}

/// @nodoc
class _$EditProfileDataCopyWithImpl<$Res, $Val extends EditProfileData>
    implements $EditProfileDataCopyWith<$Res> {
  _$EditProfileDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditProfileData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? birthdate = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      birthdate: null == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditProfileDataImplCopyWith<$Res>
    implements $EditProfileDataCopyWith<$Res> {
  factory _$$EditProfileDataImplCopyWith(_$EditProfileDataImpl value,
          $Res Function(_$EditProfileDataImpl) then) =
      __$$EditProfileDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String email, String phone, String birthdate});
}

/// @nodoc
class __$$EditProfileDataImplCopyWithImpl<$Res>
    extends _$EditProfileDataCopyWithImpl<$Res, _$EditProfileDataImpl>
    implements _$$EditProfileDataImplCopyWith<$Res> {
  __$$EditProfileDataImplCopyWithImpl(
      _$EditProfileDataImpl _value, $Res Function(_$EditProfileDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditProfileData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? birthdate = null,
  }) {
    return _then(_$EditProfileDataImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      birthdate: null == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EditProfileDataImpl implements _EditProfileData {
  const _$EditProfileDataImpl(
      {required this.name,
      required this.email,
      required this.phone,
      required this.birthdate});

  factory _$EditProfileDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditProfileDataImplFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String birthdate;

  @override
  String toString() {
    return 'EditProfileData(name: $name, email: $email, phone: $phone, birthdate: $birthdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditProfileDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, phone, birthdate);

  /// Create a copy of EditProfileData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditProfileDataImplCopyWith<_$EditProfileDataImpl> get copyWith =>
      __$$EditProfileDataImplCopyWithImpl<_$EditProfileDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditProfileDataImplToJson(
      this,
    );
  }
}

abstract class _EditProfileData implements EditProfileData {
  const factory _EditProfileData(
      {required final String name,
      required final String email,
      required final String phone,
      required final String birthdate}) = _$EditProfileDataImpl;

  factory _EditProfileData.fromJson(Map<String, dynamic> json) =
      _$EditProfileDataImpl.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get birthdate;

  /// Create a copy of EditProfileData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditProfileDataImplCopyWith<_$EditProfileDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
