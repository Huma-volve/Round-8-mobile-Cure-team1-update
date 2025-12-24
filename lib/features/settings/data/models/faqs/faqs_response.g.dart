// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faqs_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FaqsResponseImpl _$$FaqsResponseImplFromJson(Map<String, dynamic> json) =>
    _$FaqsResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Faq.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FaqsResponseImplToJson(_$FaqsResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$FaqImpl _$$FaqImplFromJson(Map<String, dynamic> json) => _$FaqImpl(
      id: (json['id'] as num).toInt(),
      question: FaqContent.fromJson(json['question'] as Map<String, dynamic>),
      answer: FaqContent.fromJson(json['answer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FaqImplToJson(_$FaqImpl instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
    };

_$FaqContentImpl _$$FaqContentImplFromJson(Map<String, dynamic> json) =>
    _$FaqContentImpl(
      en: json['en'] as String,
    );

Map<String, dynamic> _$$FaqContentImplToJson(_$FaqContentImpl instance) =>
    <String, dynamic>{
      'en': instance.en,
    };
