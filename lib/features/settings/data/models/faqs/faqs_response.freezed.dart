// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faqs_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FaqsResponse _$FaqsResponseFromJson(Map<String, dynamic> json) {
  return _FaqsResponse.fromJson(json);
}

/// @nodoc
mixin _$FaqsResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<Faq> get data => throw _privateConstructorUsedError;

  /// Serializes this FaqsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FaqsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FaqsResponseCopyWith<FaqsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqsResponseCopyWith<$Res> {
  factory $FaqsResponseCopyWith(
          FaqsResponse value, $Res Function(FaqsResponse) then) =
      _$FaqsResponseCopyWithImpl<$Res, FaqsResponse>;
  @useResult
  $Res call({bool success, String message, List<Faq> data});
}

/// @nodoc
class _$FaqsResponseCopyWithImpl<$Res, $Val extends FaqsResponse>
    implements $FaqsResponseCopyWith<$Res> {
  _$FaqsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FaqsResponse
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
              as List<Faq>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FaqsResponseImplCopyWith<$Res>
    implements $FaqsResponseCopyWith<$Res> {
  factory _$$FaqsResponseImplCopyWith(
          _$FaqsResponseImpl value, $Res Function(_$FaqsResponseImpl) then) =
      __$$FaqsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, List<Faq> data});
}

/// @nodoc
class __$$FaqsResponseImplCopyWithImpl<$Res>
    extends _$FaqsResponseCopyWithImpl<$Res, _$FaqsResponseImpl>
    implements _$$FaqsResponseImplCopyWith<$Res> {
  __$$FaqsResponseImplCopyWithImpl(
      _$FaqsResponseImpl _value, $Res Function(_$FaqsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of FaqsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$FaqsResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Faq>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FaqsResponseImpl implements _FaqsResponse {
  const _$FaqsResponseImpl(
      {required this.success,
      required this.message,
      required final List<Faq> data})
      : _data = data;

  factory _$FaqsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaqsResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<Faq> _data;
  @override
  List<Faq> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'FaqsResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaqsResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message,
      const DeepCollectionEquality().hash(_data));

  /// Create a copy of FaqsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FaqsResponseImplCopyWith<_$FaqsResponseImpl> get copyWith =>
      __$$FaqsResponseImplCopyWithImpl<_$FaqsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaqsResponseImplToJson(
      this,
    );
  }
}

abstract class _FaqsResponse implements FaqsResponse {
  const factory _FaqsResponse(
      {required final bool success,
      required final String message,
      required final List<Faq> data}) = _$FaqsResponseImpl;

  factory _FaqsResponse.fromJson(Map<String, dynamic> json) =
      _$FaqsResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<Faq> get data;

  /// Create a copy of FaqsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FaqsResponseImplCopyWith<_$FaqsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Faq _$FaqFromJson(Map<String, dynamic> json) {
  return _Faq.fromJson(json);
}

/// @nodoc
mixin _$Faq {
  int get id => throw _privateConstructorUsedError;
  FaqContent get question => throw _privateConstructorUsedError;
  FaqContent get answer => throw _privateConstructorUsedError;

  /// Serializes this Faq to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Faq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FaqCopyWith<Faq> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqCopyWith<$Res> {
  factory $FaqCopyWith(Faq value, $Res Function(Faq) then) =
      _$FaqCopyWithImpl<$Res, Faq>;
  @useResult
  $Res call({int id, FaqContent question, FaqContent answer});

  $FaqContentCopyWith<$Res> get question;
  $FaqContentCopyWith<$Res> get answer;
}

/// @nodoc
class _$FaqCopyWithImpl<$Res, $Val extends Faq> implements $FaqCopyWith<$Res> {
  _$FaqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Faq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? answer = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as FaqContent,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as FaqContent,
    ) as $Val);
  }

  /// Create a copy of Faq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FaqContentCopyWith<$Res> get question {
    return $FaqContentCopyWith<$Res>(_value.question, (value) {
      return _then(_value.copyWith(question: value) as $Val);
    });
  }

  /// Create a copy of Faq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FaqContentCopyWith<$Res> get answer {
    return $FaqContentCopyWith<$Res>(_value.answer, (value) {
      return _then(_value.copyWith(answer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FaqImplCopyWith<$Res> implements $FaqCopyWith<$Res> {
  factory _$$FaqImplCopyWith(_$FaqImpl value, $Res Function(_$FaqImpl) then) =
      __$$FaqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, FaqContent question, FaqContent answer});

  @override
  $FaqContentCopyWith<$Res> get question;
  @override
  $FaqContentCopyWith<$Res> get answer;
}

/// @nodoc
class __$$FaqImplCopyWithImpl<$Res> extends _$FaqCopyWithImpl<$Res, _$FaqImpl>
    implements _$$FaqImplCopyWith<$Res> {
  __$$FaqImplCopyWithImpl(_$FaqImpl _value, $Res Function(_$FaqImpl) _then)
      : super(_value, _then);

  /// Create a copy of Faq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? answer = null,
  }) {
    return _then(_$FaqImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as FaqContent,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as FaqContent,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FaqImpl implements _Faq {
  const _$FaqImpl(
      {required this.id, required this.question, required this.answer});

  factory _$FaqImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaqImplFromJson(json);

  @override
  final int id;
  @override
  final FaqContent question;
  @override
  final FaqContent answer;

  @override
  String toString() {
    return 'Faq(id: $id, question: $question, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaqImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, question, answer);

  /// Create a copy of Faq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FaqImplCopyWith<_$FaqImpl> get copyWith =>
      __$$FaqImplCopyWithImpl<_$FaqImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaqImplToJson(
      this,
    );
  }
}

abstract class _Faq implements Faq {
  const factory _Faq(
      {required final int id,
      required final FaqContent question,
      required final FaqContent answer}) = _$FaqImpl;

  factory _Faq.fromJson(Map<String, dynamic> json) = _$FaqImpl.fromJson;

  @override
  int get id;
  @override
  FaqContent get question;
  @override
  FaqContent get answer;

  /// Create a copy of Faq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FaqImplCopyWith<_$FaqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FaqContent _$FaqContentFromJson(Map<String, dynamic> json) {
  return _FaqContent.fromJson(json);
}

/// @nodoc
mixin _$FaqContent {
  String get en => throw _privateConstructorUsedError;

  /// Serializes this FaqContent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FaqContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FaqContentCopyWith<FaqContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqContentCopyWith<$Res> {
  factory $FaqContentCopyWith(
          FaqContent value, $Res Function(FaqContent) then) =
      _$FaqContentCopyWithImpl<$Res, FaqContent>;
  @useResult
  $Res call({String en});
}

/// @nodoc
class _$FaqContentCopyWithImpl<$Res, $Val extends FaqContent>
    implements $FaqContentCopyWith<$Res> {
  _$FaqContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FaqContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? en = null,
  }) {
    return _then(_value.copyWith(
      en: null == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FaqContentImplCopyWith<$Res>
    implements $FaqContentCopyWith<$Res> {
  factory _$$FaqContentImplCopyWith(
          _$FaqContentImpl value, $Res Function(_$FaqContentImpl) then) =
      __$$FaqContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String en});
}

/// @nodoc
class __$$FaqContentImplCopyWithImpl<$Res>
    extends _$FaqContentCopyWithImpl<$Res, _$FaqContentImpl>
    implements _$$FaqContentImplCopyWith<$Res> {
  __$$FaqContentImplCopyWithImpl(
      _$FaqContentImpl _value, $Res Function(_$FaqContentImpl) _then)
      : super(_value, _then);

  /// Create a copy of FaqContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? en = null,
  }) {
    return _then(_$FaqContentImpl(
      en: null == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FaqContentImpl implements _FaqContent {
  const _$FaqContentImpl({required this.en});

  factory _$FaqContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaqContentImplFromJson(json);

  @override
  final String en;

  @override
  String toString() {
    return 'FaqContent(en: $en)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaqContentImpl &&
            (identical(other.en, en) || other.en == en));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, en);

  /// Create a copy of FaqContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FaqContentImplCopyWith<_$FaqContentImpl> get copyWith =>
      __$$FaqContentImplCopyWithImpl<_$FaqContentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaqContentImplToJson(
      this,
    );
  }
}

abstract class _FaqContent implements FaqContent {
  const factory _FaqContent({required final String en}) = _$FaqContentImpl;

  factory _FaqContent.fromJson(Map<String, dynamic> json) =
      _$FaqContentImpl.fromJson;

  @override
  String get en;

  /// Create a copy of FaqContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FaqContentImplCopyWith<_$FaqContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
