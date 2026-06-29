import 'dart:developer';

import 'package:ecommerce_project/Core/functions/validate_auth_fields.dart';
import 'package:ecommerce_project/Core/utils/app_colors.dart';
import 'package:ecommerce_project/Core/utils/app_text_style.dart';
import 'package:ecommerce_project/Core/widgets/elevated_button_widget.dart';
import 'package:ecommerce_project/Core/widgets/text_form_field_widget.dart';
import 'package:ecommerce_project/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(26),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentGeometry.topLeft,
                      child: Text(
                        "Forgot\npassword?",
                        style: AppTextStyles.bold36.copyWith(
                          color: AppColors.onBackground,
                        ),
                      ),
                    ),
                    SizedBox(height: 36.h),
                    TextFormFieldWidget(
                      iconLink: Assets.assetsImagesMail,
                      hintText: "Enter your email address",
                      controller: emailController,
                      validator: (value) => validateEmailField(value?.trim()),
                      obscureText: false,
                    ),
                    SizedBox(height: 32.h),
                    Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "* ",
                            style: AppTextStyles.regular12.copyWith(
                              color: AppColors.darkPrimary,
                            ),
                          ),
                          Text(
                            "We will send you a message to set or\nreset your new password",
                            style: AppTextStyles.regular12.copyWith(
                              color: AppColors.strongGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 26.h),
                    ElevatedButtonWidget(
                      label: 'Submit',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          log("Success");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
