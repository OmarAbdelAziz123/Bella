import 'package:bella/features/auth/presentation/add_card_view.dart';
import 'package:bella/features/auth/presentation/check_add_to_card_or_not_view.dart';
import 'package:bella/features/auth/presentation/check_view.dart';
import 'package:bella/features/auth/presentation/login_view.dart';
import 'package:bella/features/auth/presentation/send_otp_view.dart';
import 'package:bella/features/auth/presentation/signup_view.dart';
import 'package:bella/features/auth/presentation/splash_between_check_and_home.dart';
import 'package:bella/features/auth/presentation/well_done_view.dart';
import 'package:bella/features/layout/home/presentation/profie_view.dart';
import 'package:bella/features/layout/home/presentation/see_all__view.dart';
import 'package:bella/features/layout/home/presentation/widgets/add_card_in_home_view.dart';
import 'package:bella/features/layout/home/presentation/widgets/my_cards_screen.dart';
import 'package:bella/features/layout/layout_view.dart';
import 'package:bella/features/on_boardings/presentation/on_boarding_screen.dart';
import 'package:bella/features/splash/presentation/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'on-boarding-screen':
        return PageTransition(
          child: const OnBoardingScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case 'splash-screen':
        return PageTransition(
          child: const SplashView(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case 'check-screen':
        return PageTransition(
          child: const CheckView(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case 'login-screen':
        return PageTransition(
          child: const LoginView(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case 'signup-screen':
        return PageTransition(
          child: SignupView(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case 'add-card-screen':
        return PageTransition(
          child: AddCardView(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
        case 'add-card-in-home-screen':
        return PageTransition(
          child: AddCardInHomeView(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
        case 'well-done-screen':
        return PageTransition(
          child: WellDoneView(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
        // case 'my-cards-screen':
        // return PageTransition(
        //   child: MyCardsScreen(),
        //   type: PageTransitionType.rightToLeft,
        //   settings: settings,
        //   reverseDuration: const Duration(milliseconds: 250),
        // );
        case 'check-add-to-card-or-not':
        return PageTransition(
          child: CheckAddToCardOrNotView(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case 'layout-screen':
        return PageTransition(
          child: LayoutView(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case 'splash-screen':
        return PageTransition(
          child: const SplashBetweenCheckAndHome(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case 'send-otb-screen':
        return PageTransition(
          child: const SendOTBView(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case 'see-all-view':
        return PageTransition(
          child: const SeeAllView(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 100),
        );
      case 'profile-screen':
        return PageTransition(
          child: const ProfileView(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 100),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            '',
          ),
        ),
        body: const Center(
          child: Text(
            '',
          ),
        ),
      ),
    );
  }
}
