import 'package:cure_team_1_update/features/Home/Data/models/api_doctor.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/utils/app_toast.dart';
import 'package:cure_team_1_update/features/Home/presentation/state/favorite_store.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/doctor_image.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/doctor_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsWidget extends StatelessWidget {
  final ApiDoctor? doctor;
  const DoctorDetailsWidget({
    super.key,
    this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    FavoriteStore.ensureSynced();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DoctorImage(imageUrl: doctor?.profilePhoto),
        SizedBox(
          width: 16.r,
        ),
        Expanded(
          child: DoctorInfo(doctor: doctor),
        ),
        SizedBox(
          width: 12.r,
        ),
        ValueListenableBuilder<Set<int>>(
          valueListenable: FavoriteStore.favorites,
          builder: (context, favorites, child) {
            final doctorId = doctor?.id ?? 0;
            final isFavorite = doctorId != 0 && favorites.contains(doctorId);
            return InkWell(
              onTap: () async {
                if (doctor == null || doctorId == 0) {
                  AppToast.show(context, 'Doctor data is missing.');
                  return;
                }
                final previous = isFavorite;
                FavoriteStore.setFavoriteById(doctorId, !previous);
                final result = await FavoriteStore.toggleRemoteApi(doctor!);
                if (result.isFavorite == null) {
                  FavoriteStore.setFavoriteById(doctorId, previous);
                  AppToast.show(
                    context,
                    result.message ?? 'Failed to update favorite status.',
                  );
                }
              },
              borderRadius: BorderRadius.circular(19.r),
              child: Container(
                height: 38.r,
                width: 38.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19.r),
                  border: Border.all(color: ColorsLight.border),
                ),
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 20,
                  color: isFavorite ? ColorsLight.red : ColorsLight.prussianBlue,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
