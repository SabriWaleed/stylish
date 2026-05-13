import 'package:ecommerce_project/Core/router/app_routes.dart';
import 'package:ecommerce_project/Features/auth/presentation/login_view.dart';
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
        path: AppRoutes.kAuthView,
        builder: (context, state) => const LoginView(),
      ),
    ],
  );
}
