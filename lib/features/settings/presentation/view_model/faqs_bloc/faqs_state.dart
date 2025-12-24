part of 'faqs_bloc.dart';

@freezed
class FaqsState with _$FaqsState {
  const factory FaqsState.loading() = LoadingState;
  const factory FaqsState.success({
    required FaqsResponse faqsResponse,
  }) = SuccessState;
  const factory FaqsState.error({required String error}) = ErrorState;
}
