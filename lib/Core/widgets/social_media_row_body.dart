import 'package:ecommerce_project/Core/widgets/social_media_button.dart';
import 'package:ecommerce_project/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialMediaRowBody extends StatelessWidget {
  const SocialMediaRowBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialMediaButton(imageLink: Assets.assetsImagesGoogle, onTap: () {}),
        SizedBox(width: 10.h),
        SocialMediaButton(imageLink: Assets.assetsImagesApple, onTap: () {}),
        SizedBox(width: 10.h),
        SocialMediaButton(imageLink: Assets.assetsImagesFacebook, onTap: () {}),
      ],
    );
  }
}
