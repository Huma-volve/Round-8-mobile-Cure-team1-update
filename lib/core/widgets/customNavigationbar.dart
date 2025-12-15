import 'package:cure_team_1_update/core/style/responsive_size.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/features/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class Customnavigationbar extends StatefulWidget {
  const Customnavigationbar({super.key, required this.pages});
  final List<String>? pages;

  @override
  State<Customnavigationbar> createState() => _CustomnavigationbarState();
}

class _CustomnavigationbarState extends State<Customnavigationbar> {
  int currentitem = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        // if (index == 0) {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const HomePage(),
        //     ),
        //   );
        // }
        // if (index == 1) {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const BookingSection(),
        //     ),
        //   );
        // }
        // if (index == 2) {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const Chat(),
        //     ),
        //   );
        // }
        if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProfileScreen(),
            ),
          );
        }
      },
      currentIndex: currentitem,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedFontSize: responsive_size(context, fontsize: 16),
      unselectedFontSize: responsive_size(context, fontsize: 16),
      selectedIconTheme: const IconThemeData(size: 50),
      unselectedIconTheme: const IconThemeData(size: 50),
      selectedLabelStyle: TextStyle(
        color: Colors.blue,
        fontSize: responsive_size(context, fontsize: 16),
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        color: Colors.grey,
        fontSize: responsive_size(context, fontsize: 14),
      ),
      items: [
        BottomNavigationBarItem(
          icon: Center(
            child: SvgPicture.asset(
              Assets.resourceImagesHome,
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
          ),
          activeIcon: Center(
            child: SvgPicture.asset(
              Assets.resourceImagesHome,
              colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Center(
            child: SvgPicture.asset(
              Assets.resourceImagescalendar,
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
          ),
          activeIcon: Center(
            child: SvgPicture.asset(
              Assets.resourceImagescalendar,
              colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
            ),
          ),
          label: 'Booking',
        ),
        BottomNavigationBarItem(
          icon: Center(
            child: SvgPicture.asset(
              Assets.resourceImagesChat,
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
          ),
          activeIcon: Center(
            child: SvgPicture.asset(
              Assets.resourceImagesChat,
              colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
            ),
          ),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Center(
            child: SvgPicture.asset(
              Assets.resourceImagesprofile,
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
          ),
          activeIcon: Center(
            child: SvgPicture.asset(
              Assets.resourceImagesprofile,
              colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
            ),
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
