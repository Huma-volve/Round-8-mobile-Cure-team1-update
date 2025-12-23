// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_password_request_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChangePasswordRequestBody _$ChangePasswordRequestBodyFromJson(
    Map<String, dynamic> json) {
  return _ChangePasswordRequestBody.fromJson(json);
}

/// @nodoc
mixin _$ChangePasswordRequestBody {
  String get current_password => throw _privateConstructorUsedError;
  String get new_password => throw _privateConstructorUsedError;
  String get new_password_confirmation => throw _privateConstructorUsedError;

  /// Serializes this ChangePasswordRequestBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChangePasswordRequestBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChangePasswordRequestBodyCopyWith<ChangePasswordRequestBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePasswordRequestBodyCopyWith<$Res> {
  factory $ChangePasswordRequestBodyCopyWith(ChangePasswordRequestBody value,
          $Res Function(ChangePasswordRequestBody) then) =
      _$ChangePasswordRequestBodyCopyWithImpl<$Res, ChangePasswordRequestBody>;
  @useResult
  $Res call(
      {String current_password,
      String new_password,
      String new_password_confirmation});
}

/// @nodoc
class _$ChangePasswordRequestBodyCopyWithImpl<$Res,
        $Val extends ChangePasswordRequestBody>
    implements $ChangePasswordRequestBodyCopyWith<$Res> {
  _$ChangePasswordRequestBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChangePasswordRequestBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current_password = null,
    Object? new_password = null,
    Object? new_password_confirmation = null,
  }) {
    return _then(_value.copyWith(
      current_password: null == current_password
          ? _value.current_password
          : current_password // ignore: cast_nullable_to_non_nullable
              as String,
      new_password: null == new_password
          ? _value.new_password
          : new_password // ignore: cast_nullable_to_non_nullable
              as String,
      new_password_confirmation: null == new_password_confirmation
          ? _value.new_password_confirmation
          : new_password_confirmation // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangePasswordRequestBodyImplCopyWith<$Res>
    implements $ChangePasswordRequestBodyCopyWith<$Res> {
  factory _$$ChangePasswordRequestBodyImplCopyWith(
          _$ChangePasswordRequestBodyImpl value,
          $Res Function(_$ChangePasswordRequestBodyImpl) then) =
      __$$ChangePasswordRequestBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String current_password,
      String new_password,
      String new_password_confirmation});
}

/// @nodoc
class __$$ChangePasswordRequestBodyImplCopyWithImpl<$Res>
    extends _$ChangePasswordRequestBodyCopyWithImpl<$Res,
        _$ChangePasswordRequestBodyImpl>
    implements _$$ChangePasswordRequestBodyImplCopyWith<$Res> {
  __$$ChangePasswordRequestBodyImplCopyWithImpl(
      _$ChangePasswordRequestBodyImpl _value,
      $Res Function(_$ChangePasswordRequestBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChangePasswordRequestBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current_password = null,
    Object? new_password = null,
    Object? new_password_confirmation = null,
  }) {
    return _then(_$ChangePasswordRequestBodyImpl(
      current_password: null == current_password
          ? _value.current_password
          : current_password // ignore: cast_nullable_to_non_nullable
              as String,
      new_password: null == new_password
          ? _value.new_password
          : new_password // ignore: cast_nullable_to_non_nullable
              as String,
      new_password_confirmation: null == new_password_confirmation
          ? _value.new_password_confirmation
          : new_password_confirmation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChangePasswordRequestBodyImpl implements _ChangePasswordRequestBody {
  const _$ChangePasswordRequestBodyImpl(
      {required this.current_password,
      required this.new_password,
      required this.new_password_confirmation});

  factory _$ChangePasswordRequestBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChangePasswordRequestBodyImplFromJson(json);

  @override
  final String current_password;
  @override
  final String new_password;
  @override
  final String new_password_confirmation;

  @override
  String toString() {
    return 'ChangePasswordRequestBody(current_password: $current_password, new_password: $new_password, new_password_confirmation: $new_password_confirmation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePasswordRequestBodyImpl &&
            (identical(other.current_password, current_password) ||
                other.current_password == current_password) &&
            (identical(other.new_password, new_password) ||
                other.new_password == new_password) &&
            (identical(other.new_password_confirmation,
                    new_password_confirmation) ||
                other.new_password_confirmation == new_password_confirmation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, current_password, new_password, new_password_confirmation);

  /// Create a copy of ChangePasswordRequestBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePasswordRequestBodyImplCopyWith<_$ChangePasswordRequestBodyImpl>
      get copyWith => __$$ChangePasswordRequestBodyImplCopyWithImpl<
          _$ChangePasswordRequestBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChangePasswordRequestBodyImplToJson(
      this,
    );
  }
}

abstract class _ChangePasswordRequestBody implements ChangePasswordRequestBody {
  const factory _ChangePasswordRequestBody(
          {required final String current_password,
          required final String new_password,
          required final String new_password_confirmation}) =
      _$ChangePasswordRequestBodyImpl;

  factory _ChangePasswordRequestBody.fromJson(Map<String, dynamic> json) =
      _$ChangePasswordRequestBodyImpl.fromJson;

  @override
  String get current_password;
  @override
  String get new_password;
  @override
  String get new_password_confirmation;

  /// Create a copy of ChangePasswordRequestBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangePasswordRequestBodyImplCopyWith<_$ChangePasswordRequestBodyImpl>
      get copyWith => throw _privateConstructorUsedError;
}
