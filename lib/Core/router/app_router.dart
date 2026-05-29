import 'package:ecommerce_project/Core/router/app_routes.dart';
import 'package:ecommerce_project/Core/services/getit_service.dart';
import 'package:ecommerce_project/Features/auth/data/repos/auth_repo.dart';
import 'package:ecommerce_project/Features/auth/presentation/forget_password_view.dart';
import 'package:ecommerce_project/Features/auth/presentation/login_view.dart';
import 'package:ecommerce_project/Features/auth/presentation/manager/login/cubit/login_cubit.dart';
import 'package:ecommerce_project/Features/auth/presentation/manager/register/cubit/register_cubit.dart';
import 'package:ecommerce_project/Features/auth/presentation/signup_view.dart';
import 'package:ecommerce_project/Features/onBoarding/presentation/on_boarding_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        builder: (context, state) => BlocProvider(
          create: (_) => LoginCubit(getit<AuthRepo>()),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.kAuthSignupView,
        builder: (context, state) => BlocProvider(
          create: (_) => RegisterCubit(authRepo: getit<AuthRepo>()),
          child: const SignUpView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.kAuthForgetPasswordView,
        builder: (context, state) => const ForgetPasswordView(),
      ),
    ],
  );
}
