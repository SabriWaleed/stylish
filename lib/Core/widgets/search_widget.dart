import 'package:ecommerce_project/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(12.w),
          child: Image.asset(Assets.assetsImagesComponent2),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.all(12.w),
          child: Image.asset(Assets.assetsImagesComponent3),
        ),
        hintText: 'Search any Product..',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
