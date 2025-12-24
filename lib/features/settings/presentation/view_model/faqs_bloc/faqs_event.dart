part of 'faqs_bloc.dart';

@freezed
class FaqsEvent with _$FaqsEvent {
  const factory FaqsEvent.started() = _Started;
  const factory FaqsEvent.getFAQS() = EventFaqs;
}
