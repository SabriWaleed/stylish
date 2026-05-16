import 'package:ecommerce_project/Core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
    required this.imageLink,
    required this.onTap,
  });
  final String imageLink;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: Container(
        width: 50.r,
        height: 50.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.backgroundSocialMediaAvatar,
          border: Border.all(color: AppColors.darkPrimary, width: 1),
        ),
        child: Center(
          child: Image.asset(imageLink, width: 24.w, height: 24.w),
        ),
      ),
    );
  }
}
