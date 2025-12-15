
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/style/responsive_size.dart';
import '../../../../core/utils/assets.dart';
import '../../../profile/screens/profile_screen.dart';
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
  //  const BookingSection(),
   // const Chat(),
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
                  Assets.resourceImagescalendar,
                  colorFilter:
                  const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ),
              ),
              activeIcon: Center(
                child: SvgPicture.asset(
                  Assets.resourceImagescalendar,
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
                  Assets.resourceImagesprofile,
                  colorFilter:
                  const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ),
              ),
              activeIcon: Center(
                child: SvgPicture.asset(
                  Assets.resourceImagesprofile,
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