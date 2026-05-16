import 'package:ecommerce_project/Core/utils/app_colors.dart';
import 'package:ecommerce_project/Core/router/app_routes.dart';
import 'package:ecommerce_project/Core/utils/app_text_style.dart';
import 'package:ecommerce_project/Features/onBoarding/data/onboarding_model.dart';
import 'package:ecommerce_project/Features/onBoarding/presentation/widgets/onboarding_body.dart';
import 'package:ecommerce_project/Features/onBoarding/presentation/widgets/onboarding_skip_buttom.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '${_currentIndex + 1}/',
                        style: AppTextStyles.bold18_2.copyWith(
                          color: AppColors.onBackground,
                        ),
                      ),
                      Text(
                        '${onBoardingData.length}',
                        style: AppTextStyles.bold18_2.copyWith(
                          color: AppColors.textGrey,
                        ),
                      ),
                    ],
                  ),
                  OnboardingSkipButton(controller: _controller),
                ],
              ),

              // CustomSkipButton(controller: _controller),
              Expanded(
                child: OnBoardingBody(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: _currentIndex == 0
                        ? null
                        : () {
                            _controller.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                    child: Text(
                      'Prev',
                      style: AppTextStyles.bold18.copyWith(
                        color: AppColors.textGrey,
                      ),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: _controller, // PageController
                    count: 3,
                    effect: ExpandingDotsEffect(
                      activeDotColor: AppColors.onBackground,
                      dotWidth: 10,
                      dotHeight: 10,
                      radius: 5,
                    ), // your preferred effect
                    onDotClicked: (index) {
                      _controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      if (_currentIndex == onBoardingData.length - 1) {
                        context.go(AppRoutes.kAuthLoginView);
                        return;
                      }

                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      _currentIndex == onBoardingData.length - 1
                          ? 'Get Started'
                          : 'Next',
                      style: AppTextStyles.bold18.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
