import 'package:flutter/material.dart';

import '../screens/forgot_password_screen.dart';
import '../screens/login_screen.dart';
import '../screens/onboarding_screen.dart';
import '../screens/password_changed_screen.dart';
import '../screens/register_screen.dart';
import '../screens/splash_screen.dart';

class RouterGenerator {
  static const splashRoute = "/";
  static const introRoute = "/intro";
  static const loginRoute = "/login";
  static const registerRoute = "/register";
  static const forgotPasswordRoute = "/forgot-password";
  static const otpRoute = "/otp";
  static const newPasswordRoute = "/new-password";
  static const passwordChangedRoute = "/password-changed";
  static const welcomeRoute = "/welcome";

  // static const indexRoute = "/index";

  static Route<dynamic> navigate(RouteSettings setting) {
    debugPrint("$setting");
    switch (setting.name) {
      case RouterGenerator.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case RouterGenerator.introRoute:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case RouterGenerator.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case RouterGenerator.registerRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      case RouterGenerator.forgotPasswordRoute:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );
      case RouterGenerator.passwordChangedRoute:
        return MaterialPageRoute(
          builder: (_) => const PasswordChangedScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
    }
  }
}
