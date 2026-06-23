import 'package:ecommerce_project/Core/utils/app_colors.dart';
import 'package:ecommerce_project/Core/utils/app_text_style.dart';
import 'package:ecommerce_project/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StackimagehomeWidget extends StatelessWidget {
  const StackimagehomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Image.asset(
            Assets.assetsImagesBarimage1,
            width: 343.w,
            height: 189.h,
            fit: BoxFit.cover,
          ),
        ),

        Positioned(
          top: 20.h,
          left: 20.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "50-40% OFF",
                style: AppTextStyles.bold22.copyWith(
                  color: AppColors.background,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Now in (product)",
                style: AppTextStyles.regular12.copyWith(
                  color: AppColors.background,
                ),
              ),
              SizedBox(height: 4.h),

              Text(
                "All colours",
                style: AppTextStyles.regular12.copyWith(
                  color: AppColors.background,
                ),
              ),
              SizedBox(height: 12.h),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                  side: const BorderSide(color: Colors.white, width: 1.5),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    Text("Shop Now", style: AppTextStyles.semiBold122),
                    SizedBox(width: 6.w),
                    Image.asset(Assets.assetsImagesArrow),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
