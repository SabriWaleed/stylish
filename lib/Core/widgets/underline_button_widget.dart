import 'package:ecommerce_project/Core/utils/app_colors.dart';
import 'package:ecommerce_project/Core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class UnderlineButtonWidget extends StatelessWidget {
  const UnderlineButtonWidget({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.centerRight,
      ),
      child: Text(
        label,
        style: AppTextStyles.regular14_3.copyWith(
          color: AppColors.darkPrimary,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.darkPrimary,
        ),
      ),
    );
  }
}
