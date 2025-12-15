import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/features/Booking/data/models/myBooking_model.dart';
import 'package:cure_team_1_update/features/Booking/presentation/screen/my_book_item_screen.dart';
import 'package:cure_team_1_update/features/Booking/presentation/screen/my_booking_screen.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/screens/add_review_screen.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/screens/book_apointmennt_.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/screens/doctor_details_screen.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/screens/select_payment_method_screen.dart';
import 'package:cure_team_1_update/features/payment/screens/add_card_screen.dart';
import 'package:cure_team_1_update/features/payment/screens/cards_screen.dart';
import 'package:cure_team_1_update/features/payment/screens/payment_methods_screen.dart';
import 'package:cure_team_1_update/features/profile/screens/edit_profile_screen.dart';
import 'package:cure_team_1_update/features/profile/screens/profile_screen.dart';
import 'package:cure_team_1_update/features/settings/screens/faqs_screen.dart';
import 'package:cure_team_1_update/features/settings/screens/password_management_screen.dart';
import 'package:cure_team_1_update/features/settings/screens/privacy_policy_screen.dart';
import 'package:cure_team_1_update/features/settings/screens/settings_screen.dart';
import 'package:go_router/go_router.dart';

abstract class Approutes {
  static GoRouter router = GoRouter(
    initialLocation: AppRoute.myBookingScreen,
    routes: [
      //booking

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
        path: AppRoute.myBookingitemSsceen,
        builder: (context, state) {
          final mybokkingModel = state.extra as MybookingModel;
          return MyBookItemScreen(
            mybookingModel: mybokkingModel,
          );
        },
      ),
      GoRoute(
        path: AppRoute.myBookingScreen,
        builder: (context, state) => const MyBookingScreen(),
      ),

      //payment
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

      //profile
      GoRoute(
        path: AppRoute.editProfileScreen,
        builder: (context, state) => const EditProfileScreen(),
      ),

      GoRoute(
        path: AppRoute.profileScreen,
        builder: (context, state) => const ProfileScreen(),
      ),
//settings
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
        builder: (context, state) => const FAQsScreen(),
      ),
      GoRoute(
        path: AppRoute.privacyPolicyScreen,
        builder: (context, state) => const PrivacyPolicyScreen(),
      ),
    ],
  );
}
