import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/features/Booking/data/models/myBooking_model.dart';
import 'package:cure_team_1_update/features/Booking/presentation/screen/my_book_item_screen.dart';
import 'package:cure_team_1_update/features/Home/presentation/pages/map.dart';
import 'package:cure_team_1_update/features/Home/presentation/pages/nav_bar.dart';
import 'package:cure_team_1_update/features/chat/data/modle/conversion/conversion/conversion.dart';
import 'package:cure_team_1_update/features/chat/domain/repo/chatrepo.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/chatbody.dart';
import 'package:cure_team_1_update/features/chat/persention/view_modle/chat_cubit/chat_cubit.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/screens/add_review_screen.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/screens/book_apointmennt_.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/screens/doctor_details_screen.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/screens/select_payment_method_screen.dart';
import 'package:cure_team_1_update/features/auth/login/presentation/pages/login_page.dart';
import 'package:cure_team_1_update/features/auth/otp/presentation/pages/otp_page.dart';
import 'package:cure_team_1_update/features/auth/sign_up/presentation/pages/sign_up_page.dart';
import 'package:cure_team_1_update/features/notifications/screen/notifications.dart';
import 'package:cure_team_1_update/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:cure_team_1_update/features/payment/presentation/screens/add_card_screen.dart';
import 'package:cure_team_1_update/features/payment/presentation/screens/cards_screen.dart';
import 'package:cure_team_1_update/features/payment/presentation/screens/payment_methods_screen.dart';
import 'package:cure_team_1_update/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:cure_team_1_update/features/profile/presentation/screens/profile_screen.dart';
import 'package:cure_team_1_update/features/settings/presentation/view/screens/faqs_screen.dart';
import 'package:cure_team_1_update/features/settings/presentation/view/screens/password_management_screen.dart';
import 'package:cure_team_1_update/features/settings/presentation/view/screens/privacy_policy_screen.dart';
import 'package:cure_team_1_update/features/settings/presentation/view/screens/settings_screen.dart';
import 'package:cure_team_1_update/features/splash/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/Home/location/Domin/entities/user_location.dart';

abstract class Approutes {
  static GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      // Splash
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),

      // Booking
      GoRoute(
        path: AppRoute.bookappointment,
        builder: (context, state) => const Bookappointment(),
      ),
      GoRoute(
        path: AppRoute.selectPaymentMethodScreen,
        builder: (context, state) => const SelectPaymentMethodScreen(),
      ),
      GoRoute(
        path: AppRoute.addReviewScreen,
        builder: (context, state) => const AddReviewScreen(),
      ),
      GoRoute(
        path: AppRoute.doctorDetails,
        builder: (context, state) => const DoctorDetailsScreen(),
      ),
      GoRoute(
        path: AppRoute.myBookingScreen,
        builder: (context, state) => const NavBar(initialIndex: 1),
      ),
      GoRoute(
        path: AppRoute.myBookingitemSsceen,
        builder: (context, state) {
          final mybokkingModel = state.extra as MybookingModel;
          return MyBookItemScreen(
            mybookingModel: mybokkingModel,
          );
        },
      ),

      // Auth
      GoRoute(
        path: AppRoute.signupPage,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: AppRoute.otpPage,
        builder: (context, state) {
          final phoneNum = state.extra as String;
          return OtpPage(phoneNum: phoneNum);
        },
      ),
      GoRoute(
        path: AppRoute.loginPage,
        builder: (context, state) => const LoginPage(),
      ),

      // Chat
      GoRoute(
        path: AppRoute.chat,
        builder: (context, state) => const NavBar(initialIndex: 2),
      ),
      GoRoute(
        path: AppRoute.chatbody,
        builder: (context, state) {
          final conv = state.extra as Conversion;
          return BlocProvider(
            create: (context) =>
                ChatCubit(getit.get<Chatrepoa>())..getmassages(conv),
            child: Chatbody(convers: conv),
          );
        },
      ),

      // Notifications
      GoRoute(
        path: AppRoute.notifications,
        builder: (context, state) => const Notifications(),
      ),

      // OnBoarding
      GoRoute(
        path: AppRoute.onBoarding,
        builder: (context, state) => const OnboaedingScreen(),
      ),

      // Nav & Home
      GoRoute(
        path: AppRoute.navBar,
        builder: (context, state) => const NavBar(initialIndex: 0),
      ),
      GoRoute(
        path: AppRoute.home,
        builder: (context, state) => const NavBar(initialIndex: 0),
      ),
      GoRoute(
        path: AppRoute.map,
        builder: (context, state) {
          final location = state.extra as UserLocation;
          return MapScreen(location: location);
        },
      ),

      // Payment
      GoRoute(
        path: AppRoute.paymentScreenpaymentScreen,
        builder: (context, state) => const PaymentMethodsScreen(),
      ),
      GoRoute(
        path: AppRoute.addCardScreen,
        builder: (context, state) => const AddCardScreen(),
      ),
      GoRoute(
        path: AppRoute.cardsScreen,
        builder: (context, state) => const CardsScreen(),
      ),

      // Profile
      GoRoute(
        path: AppRoute.ProfileScreen,
        builder: (context, state) => const NavBar(initialIndex: 3),
      ),
      GoRoute(
        path: AppRoute.profileScreen,
        builder: (context, state) => const NavBar(initialIndex: 3),
      ),
      GoRoute(
        path: AppRoute.editProfileScreen,
        builder: (context, state) => const EditProfileScreen(),
      ),

      // Settings
      GoRoute(
        path: AppRoute.settingsScreen,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: AppRoute.passwordManagementScreen,
        builder: (context, state) => const PasswordManagementScreen(),
      ),
      GoRoute(
        path: AppRoute.faqsScreen,
        builder: (context, state) => const FaqsScreen(),
      ),
      GoRoute(
        path: AppRoute.privacyPolicyScreen,
        builder: (context, state) => const PrivacyPolicyScreen(),
      ),
    ],
  );
}
