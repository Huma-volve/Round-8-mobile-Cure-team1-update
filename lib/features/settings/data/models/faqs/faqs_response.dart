import 'package:freezed_annotation/freezed_annotation.dart';

/**
 * 
 * {
    "success": true,
    "message": "FAQs retrieved successfully",
    "data": [
        {
            "id": 1,
            "question": {
                "en": "What is this System1 ?"
            },
            "answer": {
                "en": "this system is bla bla bla1"
            }
        },
        {
            "id": 2,
            "question": {
                "en": "ايه المنصه2"
            },
            "answer": {
                "en": "ايه المنصه2"
            }
        }
    ]
}
*/

part 'faqs_response.freezed.dart';
part 'faqs_response.g.dart';

@freezed
class FaqsResponse with _$FaqsResponse {
  const factory FaqsResponse({
    required bool success,
    required String message,
    required List<Faq> data,
  }) = _FaqsResponse;

  factory FaqsResponse.fromJson(Map<String, dynamic> json) =>
      _$FaqsResponseFromJson(json);
}

@freezed
class Faq with _$Faq {
  const factory Faq({
    required int id,
    required FaqContent question,
    required FaqContent answer,
  }) = _Faq;

  factory Faq.fromJson(Map<String, dynamic> json) => _$FaqFromJson(json);
}

@freezed
class FaqContent with _$FaqContent {
  const factory FaqContent({
    required String en,
  }) = _FaqContent;

  factory FaqContent.fromJson(Map<String, dynamic> json) =>
      _$FaqContentFromJson(json);
}
