import 'package:ecommerce_project/Core/utils/app_colors.dart';
import 'package:ecommerce_project/Core/utils/app_text_style.dart';
import 'package:ecommerce_project/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Timedaycontainer extends StatelessWidget {
  const Timedaycontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 70.h,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Deal of the Day",
                  style: AppTextStyles.semiBold16.copyWith(
                    color: AppColors.background,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Image.asset(Assets.assetsImagesAlarm),
                    SizedBox(width: 4.w),
                    Text(
                      "22h 55m 20s remaining ",
                      style: AppTextStyles.regular12.copyWith(
                        color: AppColors.background,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(width: 40.w),
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
                  Text("View all", style: AppTextStyles.semiBold122),
                  SizedBox(width: 6.w),
                  Image.asset(Assets.assetsImagesArrow),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
