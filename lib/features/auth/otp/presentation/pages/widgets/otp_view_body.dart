import 'package:cure_team_1_update/core/common/widgets/custome_appbar.dart';
import 'package:cure_team_1_update/core/common/widgets/custome_button.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/auth/otp/presentation/manage/otp_cubit.dart';
import 'package:cure_team_1_update/features/auth/otp/presentation/pages/widgets/otp_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpViewBody extends StatefulWidget {
  final String phoneNum;
  const OtpViewBody({super.key, required this.phoneNum});

  @override
  State<OtpViewBody> createState() => _OtpViewBodyState();
}

class _OtpViewBodyState extends State<OtpViewBody> {
  late OtpCubit otpCubit;
  @override
  void initState() {
    super.initState();
    otpCubit = BlocProvider.of<OtpCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            const CustomeAppbar(title: 'OTP Code Verification'),
            SizedBox(
              height: 70.h,
            ),
            Text(
              'Code has been sent to ${widget.phoneNum}',
              style: AppTextStyles.styleMedium16(context),
            ),
            Form(
              key: otpCubit.formKey,
              child: OtpItem(otpNumController: otpCubit.otpNumController),
            ),
            Column(
              children: [
                Text(
                  'Wrong code',
                  style: AppTextStyles.styleLarge16(context)
                      .copyWith(color: Colors.red),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Resend',
                        style: AppTextStyles.styleLarge16(context)
                            .copyWith(color: ColorsLight.primaryColor),
                      ),
                    ),
                    Text(
                      'or',
                      style: AppTextStyles.styleLarge16(context),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Enter another phone number',
                        style: AppTextStyles.styleLarge16(context)
                            .copyWith(color: ColorsLight.primaryColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 60.h,
            ),
            CustomeButton(
                text: 'Verify',
                color: ColorsLight.primaryColor,
                onTap: () {
                  otpCubit.phoneNumController.text = widget.phoneNum;
                  otpCubit.registUser();
                }),
            SizedBox(height: 10.h),
            BlocBuilder<OtpCubit, OtpState>(
              builder: (context, state) {
                if (state is OtpLoading) {
                  return const CircularProgressIndicator();
                }
                return const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }
}
