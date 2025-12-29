import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/features/Booking/domain/entites/my_booking_entity.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/features/Booking/presentation/screen/update_booking_screen.dart';
import 'package:cure_team_1_update/features/Booking/presentation/screen/my_booking_screen.dart';
import 'package:cure_team_1_update/features/Home/presentation/pages/map.dart';
import 'package:cure_team_1_update/features/Home/presentation/pages/nav_bar.dart';
import 'package:cure_team_1_update/features/Home/presentation/pages/favorite_page.dart';
import 'package:cure_team_1_update/features/Home/Data/models/api_doctor.dart';
import 'package:cure_team_1_update/features/chat/data/modle/conversion/conversion/conversion.dart';
import 'package:cure_team_1_update/features/chat/data/chatrepoimplment/repoimpement.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/chat.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/chatbody.dart';
import 'package:cure_team_1_update/features/chat/persention/view_modle/chat_cubit/chat_cubit.dart';
import 'package:cure_team_1_update/features/chat/persention/view_modle/chatbody_cubit/cubit/chatbody_cubit.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/screens/add_review_screen.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/screens/book_apointmennt_.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/screens/doctor_details_screen.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/screens/select_payment_method_screen.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/models/booking_flow_data.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/models/add_review_args.dart';
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
        builder: (context, state) {
          final doctor =
              state.extra is ApiDoctor ? state.extra as ApiDoctor : null;
          return Bookappointment(doctor: doctor);
        },
      ),
      GoRoute(
        path: AppRoute.selectPaymentMethodScreen,
        builder: (context, state) {
          final data =
              state.extra is BookingFlowData ? state.extra as BookingFlowData : null;
          return SelectPaymentMethodScreen(data: data);
        },
      ),
      GoRoute(
        path: AppRoute.addReviewScreen,
        builder: (context, state) {
          final args =
              state.extra is AddReviewArgs ? state.extra as AddReviewArgs : null;
          return AddReviewScreen(args: args);
        },
      ),
      GoRoute(
        path: AppRoute.doctorDetails,
        builder: (context, state) {
          final doctor =
              state.extra is ApiDoctor ? state.extra as ApiDoctor : null;
          return DoctorDetailsScreen(doctor: doctor);
        },
      ),
      GoRoute(
        path: AppRoute.myBookingScreen,
        builder: (context, state) => const MyBookingScreen(
          isActive: true,
        ),
      ),
      GoRoute(
          path: AppRoute.updateMyBookingSceen,
          builder: (context, state) {
            final booking = state.extra as MyBookingEntity;
            return UpdateMyBookingScreen(booking: booking);
          }),

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
        builder: (context, state) => BlocProvider.value(
          value: getIt.get<ChatCubit>(),
          child: const Chat(),
        ),
      ),
      GoRoute(
        path: AppRoute.chatbody,
        builder: (context, state) {
          final conv = state.extra as Conversion;
          return BlocProvider(
            create: (context) =>
                ChatbodyCubit(getIt.get<Repoimplement>())..getmassages(conv),
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
        builder: (context, state) {
          final extra = state.extra;
          if (extra is NavBarArgs) {
            return NavBar(
              initialIndex: extra.index,
              initialConversation: extra.conversation,
            );
          }
          final index = extra is int ? extra : 0;
          return NavBar(initialIndex: index);
        },
      ),
      GoRoute(
        path: AppRoute.home,
        builder: (context, state) => const NavBar(),
      ),
      GoRoute(
        path: AppRoute.map,
        builder: (context, state) {
          final location = state.extra as UserLocation;
          return MapScreen(location: location);
        },
      ),
      GoRoute(
        path: AppRoute.favorite,
        builder: (context, state) => const FavoritePage(),
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
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: AppRoute.profileScreen,
        builder: (context, state) => const ProfileScreen(),
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
