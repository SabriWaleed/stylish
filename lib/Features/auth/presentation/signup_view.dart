import 'package:ecommerce_project/Core/functions/validate_auth_fields.dart';
import 'package:ecommerce_project/Core/router/app_routes.dart';
import 'package:ecommerce_project/Core/utils/app_colors.dart';
import 'package:ecommerce_project/Core/utils/app_text_style.dart';
import 'package:ecommerce_project/Core/widgets/elevated_button_widget.dart';
import 'package:ecommerce_project/Core/widgets/social_media_row_body.dart';
import 'package:ecommerce_project/Core/widgets/text_button_widget.dart';
import 'package:ecommerce_project/Core/widgets/text_form_field_widget.dart';
import 'package:ecommerce_project/Core/widgets/underline_button_widget.dart';
import 'package:ecommerce_project/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Create an\naccount",
                        style: AppTextStyles.bold36.copyWith(
                          color: AppColors.onBackground,
                        ),
                      ),
                    ),
                    SizedBox(height: 33.h),
                    TextFormFieldWidget(
                      iconLink: Assets.assetsImagesUser,
                      hintText: "Username or Email",
                      controller: emailController,
                      validator: (value) => validateEmailField(value?.trim()),

                      obscureText: false,
                    ),
                    SizedBox(height: 31.h),
                    TextFormFieldWidget(
                      iconLink: Assets.assetsImagesLock,
                      hintText: "Password",
                      controller: passwordController,
                      validator: (value) =>
                          validatePasswordField(value?.trim()),

                      obscureText: true,
                    ),
                    SizedBox(height: 31.h),
                    TextFormFieldWidget(
                      iconLink: Assets.assetsImagesLock,
                      hintText: "ConfirmPassword",
                      controller: confirmPasswordController,
                      validator: (value) =>
                          validatePasswordField(value?.trim()),
                      obscureText: true,
                    ),
                    SizedBox(height: 19.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "By clicking the ",
                              style: AppTextStyles.regular12_2.copyWith(
                                color: AppColors.strongGrey,
                              ),
                            ),

                            WidgetSpan(
                              child: TextButtonWidget(
                                text: "Registert",
                                onPressed: () {},
                              ),
                            ),

                            TextSpan(
                              text: " button, you agree\nto the public offer",
                              style: AppTextStyles.regular12_2.copyWith(
                                color: AppColors.strongGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 38.h),
                    ElevatedButtonWidget(
                      label: 'Create Account',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print("Success");
                        }
                      },
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "- OR Continue with -",
                          style: AppTextStyles.semiBold12.copyWith(
                            color: AppColors.strongGrey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    SocialMediaRowBody(),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "I Already Have an Account ",
                          style: AppTextStyles.regular14_4.copyWith(
                            color: AppColors.strongGrey,
                          ),
                        ),
                        UnderlineButtonWidget(
                          label: "Login",
                          onPressed: () {
                            context.go(AppRoutes.kAuthLoginView);
                          },
                        ),
                      ],
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
