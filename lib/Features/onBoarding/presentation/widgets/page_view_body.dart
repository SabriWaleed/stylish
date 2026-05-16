import 'package:ecommerce_project/Core/utils/app_colors.dart';
import 'package:ecommerce_project/Core/utils/app_text_style.dart';
import 'package:ecommerce_project/Features/onBoarding/data/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageViewBody extends StatelessWidget {
  const PageViewBody({
    super.key,
    required this.controller,
    required this.onBoardingModel,
  });

  final PageController controller;
  final OnBoardingModel onBoardingModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 110.h),
        Container(
          height: 300.h,
          width: 300.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(onBoardingModel.image),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(height: 15.h),
        Text(
          onBoardingModel.title,
          textAlign: TextAlign.center,
          style: AppTextStyles.extraBold24.copyWith(
            color: AppColors.onBackground,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          onBoardingModel.subTitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.bold14.copyWith(color: AppColors.textGrey),
        ),
      ],
    );
  }
}
