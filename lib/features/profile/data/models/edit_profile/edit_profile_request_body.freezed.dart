// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_request_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EditProfileRequestBody _$EditProfileRequestBodyFromJson(
    Map<String, dynamic> json) {
  return _EditProfileRequestBody.fromJson(json);
}

/// @nodoc
mixin _$EditProfileRequestBody {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get birthdate => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;

  /// Serializes this EditProfileRequestBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EditProfileRequestBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditProfileRequestBodyCopyWith<EditProfileRequestBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileRequestBodyCopyWith<$Res> {
  factory $EditProfileRequestBodyCopyWith(EditProfileRequestBody value,
          $Res Function(EditProfileRequestBody) then) =
      _$EditProfileRequestBodyCopyWithImpl<$Res, EditProfileRequestBody>;
  @useResult
  $Res call({String name, String email, String birthdate, String phone});
}

/// @nodoc
class _$EditProfileRequestBodyCopyWithImpl<$Res,
        $Val extends EditProfileRequestBody>
    implements $EditProfileRequestBodyCopyWith<$Res> {
  _$EditProfileRequestBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditProfileRequestBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? birthdate = null,
    Object? phone = null,
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
      birthdate: null == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditProfileRequestBodyImplCopyWith<$Res>
    implements $EditProfileRequestBodyCopyWith<$Res> {
  factory _$$EditProfileRequestBodyImplCopyWith(
          _$EditProfileRequestBodyImpl value,
          $Res Function(_$EditProfileRequestBodyImpl) then) =
      __$$EditProfileRequestBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String email, String birthdate, String phone});
}

/// @nodoc
class __$$EditProfileRequestBodyImplCopyWithImpl<$Res>
    extends _$EditProfileRequestBodyCopyWithImpl<$Res,
        _$EditProfileRequestBodyImpl>
    implements _$$EditProfileRequestBodyImplCopyWith<$Res> {
  __$$EditProfileRequestBodyImplCopyWithImpl(
      _$EditProfileRequestBodyImpl _value,
      $Res Function(_$EditProfileRequestBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditProfileRequestBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? birthdate = null,
    Object? phone = null,
  }) {
    return _then(_$EditProfileRequestBodyImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      birthdate: null == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EditProfileRequestBodyImpl implements _EditProfileRequestBody {
  const _$EditProfileRequestBodyImpl(
      {required this.name,
      required this.email,
      required this.birthdate,
      required this.phone});

  factory _$EditProfileRequestBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditProfileRequestBodyImplFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String birthdate;
  @override
  final String phone;

  @override
  String toString() {
    return 'EditProfileRequestBody(name: $name, email: $email, birthdate: $birthdate, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditProfileRequestBodyImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, birthdate, phone);

  /// Create a copy of EditProfileRequestBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditProfileRequestBodyImplCopyWith<_$EditProfileRequestBodyImpl>
      get copyWith => __$$EditProfileRequestBodyImplCopyWithImpl<
          _$EditProfileRequestBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditProfileRequestBodyImplToJson(
      this,
    );
  }
}

abstract class _EditProfileRequestBody implements EditProfileRequestBody {
  const factory _EditProfileRequestBody(
      {required final String name,
      required final String email,
      required final String birthdate,
      required final String phone}) = _$EditProfileRequestBodyImpl;

  factory _EditProfileRequestBody.fromJson(Map<String, dynamic> json) =
      _$EditProfileRequestBodyImpl.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String get birthdate;
  @override
  String get phone;

  /// Create a copy of EditProfileRequestBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditProfileRequestBodyImplCopyWith<_$EditProfileRequestBodyImpl>
      get copyWith => throw _privateConstructorUsedError;
}
