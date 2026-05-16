import 'package:ecommerce_project/Core/router/app_routes.dart';
import 'package:ecommerce_project/Features/auth/presentation/forget_password_view.dart';
import 'package:ecommerce_project/Features/auth/presentation/login_view.dart';
import 'package:ecommerce_project/Features/auth/presentation/signup_view.dart';
import 'package:ecommerce_project/Features/onBoarding/presentation/on_boarding_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.kOnboardingView,
        builder: (context, state) => const OnBoardingView(),
      ),

      GoRoute(
        path: AppRoutes.kAuthLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: AppRoutes.kAuthSignupView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: AppRoutes.kAuthForgetPasswordView,
        builder: (context, state) => const ForgetPasswordView(),
      ),
    ],
  );
}
