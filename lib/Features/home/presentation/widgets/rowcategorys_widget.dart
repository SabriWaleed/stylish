import 'package:ecommerce_project/Core/router/app_routes.dart';
import 'package:ecommerce_project/Core/utils/app_colors.dart';
import 'package:ecommerce_project/Core/utils/app_text_style.dart';
import 'package:ecommerce_project/Features/home/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RowcategorysWidget extends StatelessWidget {
  const RowcategorysWidget({super.key, required this.allCategory});
  final List<Category> allCategory;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: allCategory.length,
        itemBuilder: (BuildContext context, int index) {
          final category = allCategory[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: GestureDetector(
              onTap: () {
                final categoryId = category.id?.toString();
                if (categoryId != null && categoryId.trim().isNotEmpty) {
                  context.go(
                    '${AppRoutes.kProductListByCategory}?categoryId=$categoryId',
                  );
                }
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: Image.network(
                      category.image!,
                      width: 56,
                      height: 56,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 56,
                        height: 56,
                        color: Colors.grey[300],
                        child: const Icon(Icons.category),
                      ),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    category.name!,
                    style: AppTextStyles.regular10.copyWith(
                      color: AppColors.onBackground,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
