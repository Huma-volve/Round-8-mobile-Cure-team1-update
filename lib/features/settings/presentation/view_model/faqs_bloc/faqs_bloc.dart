import 'dart:async';
import 'package:cure_team_1_update/features/settings/data/models/faqs/faqs_response.dart';
import 'package:cure_team_1_update/features/settings/data/repos/faqs/faqs_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'faqs_event.dart';
part 'faqs_state.dart';
part 'faqs_bloc.freezed.dart';

class FaqsBloc extends Bloc<FaqsEvent, FaqsState> {
  FaqsBloc(this._repo) : super(const FaqsState.loading()) {
    on<EventFaqs>(_getFAQS);
  }

  final FaqsRepo _repo;

  FutureOr<void> _getFAQS(
    EventFaqs event,
    Emitter<FaqsState> emit,
  ) async {
    emit(const FaqsState.loading());
    print('lllllllllllllllllll ');

    final result = await _repo.Faqs();
    print('sssssssssssssssss');

    result.when(
      success: (FaqsStateRes) {
        print('faqs successful: $FaqsStateRes');
        emit(FaqsState.success(faqsResponse: FaqsStateRes));
      },
      failure: (error) {
        print('Error in faqsBloc: $error');
        emit(FaqsState.error(error: error));
      },
    );
  }
}
