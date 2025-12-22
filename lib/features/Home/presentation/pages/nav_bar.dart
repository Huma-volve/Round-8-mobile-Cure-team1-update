import 'package:cure_team_1_update/features/Booking/data/models/myBooking_model.dart';
import 'package:cure_team_1_update/features/Booking/presentation/screen/my_book_item_screen.dart';
import 'package:cure_team_1_update/features/Booking/presentation/screen/my_booking_screen.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/style/responsive_size.dart';
import '../../../../core/utils/assets.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import '../../Data/models/doctor_model.dart';
import 'home_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _HomePageState();
}

class _HomePageState extends State<NavBar> {
  List<Widget> pages = [
    const HomePage(),
    const MyBookingScreen(),
    const Chat(),
    const ProfileScreen()
  ];
  int currentitem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: pages[currentitem],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentitem = index;
            });
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
                  colorFilter:
                      const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ),
              ),
              activeIcon: Center(
                child: SvgPicture.asset(
                  Assets.resourceImagesHome,
                  colorFilter:
                      const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Center(
                child: SvgPicture.asset(
                  Assets.resourceImagesCalendar,
                  colorFilter:
                      const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ),
              ),
              activeIcon: Center(
                child: SvgPicture.asset(
                  Assets.resourceImagesCalendar,
                  colorFilter:
                      const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                ),
              ),
              label: 'Booking',
            ),
            BottomNavigationBarItem(
              icon: Center(
                child: SvgPicture.asset(
                  Assets.resourceImagesChat,
                  colorFilter:
                      const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ),
              ),
              activeIcon: Center(
                child: SvgPicture.asset(
                  Assets.resourceImagesChat,
                  colorFilter:
                      const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                ),
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Center(
                child: SvgPicture.asset(
                  Assets.resourceImagesProfile,
                  colorFilter:
                      const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ),
              ),
              activeIcon: Center(
                child: SvgPicture.asset(
                  Assets.resourceImagesProfile,
                  colorFilter:
                      const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                ),
              ),
              label: 'Profile',
            ),
          ],
        ));
  }
}
