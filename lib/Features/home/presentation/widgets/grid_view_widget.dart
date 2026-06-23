import 'package:ecommerce_project/Core/utils/app_colors.dart';
import 'package:ecommerce_project/Core/utils/app_text_style.dart';
import 'package:ecommerce_project/Features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key, required this.allProducts});
  final List<Products> allProducts;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: allProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.58,
      ),
      itemBuilder: (context, index) {
        final product = allProducts[index];

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.network(
                    (product.images != null && product.images!.isNotEmpty)
                        ? product.images![0].replaceAll(
                            RegExp(r'^\["|"\]$'),
                            '',
                          )
                        : 'https://placehold.co/600x400.png',
                    height: 150.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return ColoredBox(
                        color: Colors.grey[200]!,
                        child: const Icon(
                          Icons.image_not_supported,
                          size: 50,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title ?? 'No Title',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.semiBold12.copyWith(
                          color: AppColors.onBackground,
                        ),
                      ),

                      const SizedBox(height: 4),
                      Text(
                        product.description ?? 'No Description',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.regular10.copyWith(
                          color: AppColors.onBackground,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        '₹${product.price}',
                        style: AppTextStyles.semiBold12_4.copyWith(
                          color: AppColors.onBackground,
                        ),
                      ),

                      // Row(
                      //   children: [
                      //     Text(
                      //       '₹${"2499"}',
                      //       style: const TextStyle(
                      //         decoration:
                      //             TextDecoration.lineThrough,
                      //         color: Colors.grey,
                      //       ),
                      //     ),
                      //     SizedBox(width: 8.w),
                      //     Text(
                      //       '${"40"}% Off',
                      //       style: const TextStyle(
                      //         color: Colors.red,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(height: 20.h),

                      Row(
                        children: [
                          const Icon(Icons.star, size: 16, color: Colors.amber),
                          const Icon(Icons.star, size: 16, color: Colors.amber),
                          const Icon(Icons.star, size: 16, color: Colors.amber),
                          const Icon(Icons.star, size: 16, color: Colors.amber),
                          const Icon(
                            Icons.star_half,
                            size: 16,
                            color: Colors.amber,
                          ),
                          const SizedBox(width: 4),
                          // Text(
                          //   '${product.ratingCount}',
                          //   style: const TextStyle(color: Colors.grey),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
        );
      },
    );
  }
}
