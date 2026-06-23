import 'package:ecommerce_project/Core/utils/app_colors.dart';
import 'package:ecommerce_project/Core/utils/app_text_style.dart';
import 'package:ecommerce_project/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowSortFilterWidget extends StatelessWidget {
  const RowSortFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "All Featured",
          style: AppTextStyles.semiBold19.copyWith(
            color: AppColors.onBackground,
          ),
        ),
        Container(
          color: AppColors.background,
          width: 71.w,
          height: 34.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Sort",
                style: AppTextStyles.regular12_4.copyWith(
                  color: AppColors.onBackground,
                ),
              ),
              Image.asset(
                Assets.assetsImagesSort,
                width: 16.w,
                height: 16.h,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
        Container(
          color: AppColors.background,
          width: 71.w,
          height: 34.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Filter",
                style: AppTextStyles.regular12_4.copyWith(
                  color: AppColors.onBackground,
                ),
              ),
              Image.asset(
                Assets.assetsImagesFilter,
                width: 16.w,
                height: 16.h,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
