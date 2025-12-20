import 'package:cure_team_1_update/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_route.dart';
import '../../location/presentation/cubit/location_cubit.dart';
import '../../location/presentation/state/location_state.dart';
import '../pages/favorite_page.dart';

class HomeTopSection extends StatelessWidget {
  const HomeTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 18,
          child: Icon(Icons.person),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Welcome back, Rahma",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              BlocBuilder<LocationCubit, LocationState>(
                builder: (context, state) {

                  if(state is LoadingState){
                    return const CircularProgressIndicator();
                  }
                  else if(state is LocationAddressLoaded){
                    final address = state.address;
                    return Row(
                    children: [
                      const Icon(Icons.location_on_outlined, size: 16),
                      const SizedBox(height: 4),
                      TextButton(
                        onPressed: () {
    final cubitState = context.read<LocationCubit>().state;

    if (cubitState is LocationAddressLoaded) {
    GoRouter.of(context).push(
    AppRoute.map,
    extra: cubitState.location,
    );
    }

                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                  "${address.street}, ${address.city}",
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  );
                }
                  else if (state is LocationError) {
                    return Text(state.message);
                  }
                  return const SizedBox();
                  },

              ),
            ],
          ),
        ),
        Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, offset: Offset(0, 6), blurRadius: 6),
              ],
            ),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FavoritePage()));
                },
                child: const Icon(
                  Icons.favorite_border,
                ))),
        const SizedBox(
          width: 4,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(17),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, offset: Offset(0, 6), blurRadius: 6),
            ],
          ),
          child: InkWell(
              onTap: () {
                context.push(AppRoute.notifications);
              },
              child: const Icon(
                Icons.notifications_none_outlined,
              )),
        ),
      ],
    );
  }
}
