import 'dart:developer';

// import 'package:cure_team_1_update/core/extensions/context_extension.dart';
import 'package:cure_team_1_update/core/extensions/context_extension.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/features/Booking/domain/repo/my_book_repo.dart';
import 'package:cure_team_1_update/features/Booking/presentation/manager/cancel_book/cubit/cancel_boking_cubit.dart';
import 'package:cure_team_1_update/features/Booking/presentation/manager/cancel_book/cubit/cancel_boking_state.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/cancel_reason_widget.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/cancel_warning_section.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/dialog_confirm_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<dynamic> showDialogImplement(
    {required BuildContext context, required int bookId}) {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  ValueNotifier<bool> confirmCancel = ValueNotifier<bool>(false);
  ValueNotifier<String?> cancelReason = ValueNotifier<String?>(null);

  return showDialog(
      context: context,
      builder: (dialogContext) => BlocProvider(
            create: (context) =>
                CancelMyBookingCubit(myBookRepo: getit<MyBookRepo>()),
            child: BlocListener<CancelMyBookingCubit, CancelMyBookingState>(
              listener: (context, state) {
          if(state is CancelMyBookingSuccessState)
          {
  dialogContext.pop();
          }
              },
              child: Dialog(
                child: Container(
                  height: 445.r,
                  width: 341.r,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(48)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 48.w, vertical: 32.h),
                    child: ValueListenableBuilder(
                        valueListenable: confirmCancel,
                        builder: (context, value, _) {
                          return Column(
                            children: [
                              confirmCancel.value == false
                                  ? const CancelWarningSection()
                                  : CancelReasonWidget(
                                      onSaved: (value) {
                                        cancelReason.value = value;
                                      },
                                      formkey: formkey,
                                    ),
                              DialogConfirmButton(
                                onPressed: () async {
                                  if (!confirmCancel.value) {
                                    confirmCancel.value = true;
                                  } else {
                                    if (formkey.currentState!.validate()) {
                                      log('=================================${bookId.toString()}');
                                      formkey.currentState!.save();
                                       context
                                          .read<CancelMyBookingCubit>()
                                          .cancel(
                                              bookId: bookId,
                                              body: cancelReason.value!);
                                   
                                    }
                                  }
                                },
                              )
                            ],
                          );
                        }),
                  ),
                ),
              ),
            ),
          ));
}
