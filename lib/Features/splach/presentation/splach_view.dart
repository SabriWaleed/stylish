import 'package:ecommerce_project/Core/router/app_routes.dart';
import 'package:ecommerce_project/Core/services/getit_service.dart';
import 'package:ecommerce_project/Core/services/shared_preferences_service.dart';
import 'package:ecommerce_project/Core/utils/app_colors.dart';
import 'package:ecommerce_project/Core/utils/app_text_style.dart';
import 'package:ecommerce_project/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplachView extends StatefulWidget {
  const SplachView({super.key});

  @override
  State<SplachView> createState() => _SplachViewState();
}

class _SplachViewState extends State<SplachView> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      final isLoggedIn = getit<SharedPreferencesService>().isLoggedIn();
      if (isLoggedIn) {
        GoRouter.of(context).pushReplacement(AppRoutes.kHomeView);
      } else {
        GoRouter.of(context).pushReplacement(AppRoutes.kOnboardingView);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Assets.assetsImagesSplachIcon, height: 100),
              SizedBox(width: 9),
              Text(
                "Stylish",
                style: AppTextStyles.extraBold18.copyWith(
                  color: AppColors.darkPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
