import 'package:ecommerce_project/Core/functions/validate_auth_fields.dart';
import 'package:ecommerce_project/Core/router/app_routes.dart';
import 'package:ecommerce_project/Core/utils/app_colors.dart';
import 'package:ecommerce_project/Core/utils/app_text_style.dart';
import 'package:ecommerce_project/Core/widgets/elevated_button_widget.dart';
import 'package:ecommerce_project/Core/widgets/social_media_row_body.dart';
import 'package:ecommerce_project/Core/widgets/text_button_widget.dart';
import 'package:ecommerce_project/Core/widgets/text_form_field_widget.dart';
import 'package:ecommerce_project/Core/widgets/underline_button_widget.dart';
import 'package:ecommerce_project/Features/auth/presentation/manager/register/cubit/register_cubit.dart';
import 'package:ecommerce_project/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }

        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Account created successfully')),
          );
          context.go(AppRoutes.kAuthLoginView);
        }
      },
      builder: (context, state) {
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
                          hintText: "Full Name",
                          controller: nameController,
                          validator: (value) =>
                              validateNameField(value?.trim()),
                          obscureText: false,
                        ),
                        SizedBox(height: 31.h),
                        TextFormFieldWidget(
                          iconLink: Assets.assetsImagesUser,
                          hintText: "Email",
                          controller: emailController,
                          validator: (value) =>
                              validateEmailField(value?.trim()),
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
                          hintText: "Confirm Password",
                          controller: confirmPasswordController,
                          validator: (value) => validateConfirmPasswordField(
                            value?.trim(),
                            passwordController.text.trim(),
                          ),
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
                                    text: "Register",
                                    onPressed: () {},
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      " button, you agree\nto the public offer",
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
                          isLoading: state is RegisterLoading,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<RegisterCubit>().register(
                                name: nameController.text.trim(),
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                                avatarURL:
                                    'https://api.lorem.space/image/face?w=640&h=480&r=867',
                              );
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
      },
    );
  }
}
