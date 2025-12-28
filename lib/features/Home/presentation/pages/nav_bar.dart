import 'package:cure_team_1_update/features/Booking/presentation/screen/my_booking_screen.dart';
import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/chat.dart';
import 'package:cure_team_1_update/features/chat/data/modle/conversion/conversion/conversion.dart';
import 'package:cure_team_1_update/features/chat/persention/view_modle/chat_cubit/chat_cubit.dart';
import 'package:cure_team_1_update/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/style/responsive_size.dart';
import '../../../../core/utils/assets.dart';
import '../state/favorite_store.dart';
import 'home_page.dart';

class NavBar extends StatefulWidget {
  final int initialIndex;
  final Conversion? initialConversation;
  const NavBar({
    super.key,
    this.initialIndex = 0,
    this.initialConversation,
  });

  @override
  State<NavBar> createState() => _HomePageState();
}

class _HomePageState extends State<NavBar> {
  late int _currentIndex;
  Conversion? _pendingConversation;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pendingConversation = widget.initialConversation;
    FavoriteStore.ensureSynced();
    _openPendingConversation();
  }

  @override
  void didUpdateWidget(covariant NavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialIndex != oldWidget.initialIndex) {
      setState(() {
        _currentIndex = widget.initialIndex;
      });
    }
    if (widget.initialConversation != oldWidget.initialConversation) {
      _pendingConversation = widget.initialConversation;
      _openPendingConversation();
    }
  }

  void _openPendingConversation() {
    if (_pendingConversation == null || _currentIndex != 2) {
      return;
    }
    final conversation = _pendingConversation;
    _pendingConversation = null;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || conversation == null) {
        return;
      }
      context.push(AppRoute.chatbody, extra: conversation);
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomePage(),
      MyBookingScreen(isActive: _currentIndex == 1),
      BlocProvider.value(
        value: getIt.get<ChatCubit>(),
        child: const Chat(),
      ),
      const ProfileScreen(),
    ];
    return Scaffold(
        backgroundColor: Colors.white,
        body: IndexedStack(
          index: _currentIndex,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            _openPendingConversation();
          },
          currentIndex: _currentIndex,
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

class NavBarArgs {
  final int index;
  final Conversion? conversation;

  const NavBarArgs({this.index = 0, this.conversation});
}
