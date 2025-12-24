import 'package:cure_team_1_update/features/Booking/presentation/screen/my_booking_screen.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cure_team_1_update/core/utils/chattab.dart';
import 'package:cure_team_1_update/features/chat/persention/view_modle/chat_cubit/chat_cubit.dart';
import '../../location/Data/DataSource/location_datasoucre.dart';
import '../../location/Data/repo/location_repository_impl.dart';
import '../../location/Domin/useCase/get_user_location.dart';
import '../../location/presentation/cubit/location_cubit.dart';
import '../../../../core/style/responsive_size.dart';
import '../../../../core/utils/assets.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import 'home_page.dart';

class NavBar extends StatefulWidget {
  final int initialIndex;

  const NavBar({super.key, this.initialIndex = 0});

  @override
  State<NavBar> createState() => _HomePageState();
}

class _HomePageState extends State<NavBar> {
  final List<Widget> pages = [
    const HomePage(),
    const MyBookingScreen(),
    const Chat(),
    const ProfileScreen()
  ];
  late int currentitem;
  late final LocationCubit _locationCubit;

  @override
  void initState() {
    super.initState();
    currentitem = widget.initialIndex.clamp(0, pages.length - 1);
    final dataSource = LocationDataSource();
    final repo = LocationRepositoryImpl(dataSource);
    _locationCubit = LocationCubit(
      GetUserLocation(repo: repo),
      GetUserAddress(repo: repo),
    )..fetchLocationAndAddress();
  }

  @override
  void dispose() {
    _locationCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const activeColor = Color(0xFF1B6CA8);
    const inactiveColor = Color(0xFF98A1AB);

    return BlocProvider.value(
      value: _locationCubit,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: IndexedStack(
            index: currentitem,
            children: pages,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.grey.shade200),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 12,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: BottomNavigationBar(
                onTap: (index) {
                  setState(() {
                    currentitem = index;
                  });
                  if (index == 2) {
                    context
                        .read<ChatCubit>()
                        .getconv(Chattab.all, forceRefresh: true);
                  }
                },
                currentIndex: currentitem,
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                backgroundColor: Colors.transparent,
                selectedFontSize: responsive_size(context, fontsize: 12),
                unselectedFontSize: responsive_size(context, fontsize: 12),
                selectedItemColor: activeColor,
                unselectedItemColor: inactiveColor,
                selectedLabelStyle: TextStyle(
                  color: activeColor,
                  fontSize: responsive_size(context, fontsize: 12),
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: TextStyle(
                  color: inactiveColor,
                  fontSize: responsive_size(context, fontsize: 12),
                ),
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Assets.resourceImagesHome,
                      width: 24,
                      height: 24,
                      colorFilter: const ColorFilter.mode(
                          inactiveColor, BlendMode.srcIn),
                    ),
                    activeIcon: SvgPicture.asset(
                      Assets.resourceImagesHome,
                      width: 24,
                      height: 24,
                      colorFilter:
                          const ColorFilter.mode(activeColor, BlendMode.srcIn),
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Assets.resourceImagesCalendar,
                      width: 24,
                      height: 24,
                      colorFilter: const ColorFilter.mode(
                          inactiveColor, BlendMode.srcIn),
                    ),
                    activeIcon: SvgPicture.asset(
                      Assets.resourceImagesCalendar,
                      width: 24,
                      height: 24,
                      colorFilter:
                          const ColorFilter.mode(activeColor, BlendMode.srcIn),
                    ),
                    label: 'Booking',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Assets.resourceImagesChat,
                      width: 24,
                      height: 24,
                      colorFilter: const ColorFilter.mode(
                          inactiveColor, BlendMode.srcIn),
                    ),
                    activeIcon: SvgPicture.asset(
                      Assets.resourceImagesChat,
                      width: 24,
                      height: 24,
                      colorFilter:
                          const ColorFilter.mode(activeColor, BlendMode.srcIn),
                    ),
                    label: 'Chat',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Assets.resourceImagesProfile,
                      width: 24,
                      height: 24,
                      colorFilter: const ColorFilter.mode(
                          inactiveColor, BlendMode.srcIn),
                    ),
                    activeIcon: SvgPicture.asset(
                      Assets.resourceImagesProfile,
                      width: 24,
                      height: 24,
                      colorFilter:
                          const ColorFilter.mode(activeColor, BlendMode.srcIn),
                    ),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
