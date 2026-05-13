import 'package:ecommerce_project/Core/utils/app_text_style.dart';
import 'package:ecommerce_project/Features/onBoarding/data/onboarding_model.dart';
import 'package:flutter/material.dart';

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
        const SizedBox(height: 32),
        Container(
          height: 290,
          width: 345,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(onBoardingModel.image),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          onBoardingModel.title,
          textAlign: TextAlign.center,
          style: AppTextStyle.montserratExtraBold24w800.copyWith(
            fontWeight: FontWeight.w700,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 16),
        Text(
          onBoardingModel.subTitle,
          textAlign: TextAlign.center,
          style: AppTextStyle.montserratSemiBold14w600.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
