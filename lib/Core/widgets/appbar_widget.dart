import 'package:ecommerce_project/Core/utils/app_colors.dart';
import 'package:ecommerce_project/Core/utils/app_text_style.dart';
import 'package:ecommerce_project/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundTextField,
      centerTitle: true,
      title: Row(
        children: [
          Image.asset(
            Assets.assetsImagesComponent1,
            width: 24.w,
            height: 24.h,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 84),
          Image.asset(
            Assets.assetsImagesSplachIcon,
            width: 39.w,
            height: 32.h,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 10),
          Text(
            "Stylish",
            style: AppTextStyles.extraBold19.copyWith(
              color: AppColors.secondary,
            ),
          ),
          const SizedBox(width: 90),
          Image.asset(
            Assets.assetsImagesProfile,
            width: 40.w,
            height: 40.h,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
