import 'package:ecommerce_project/Core/functions/validate_auth_fields.dart';
import 'package:ecommerce_project/Core/router/app_routes.dart';
import 'package:ecommerce_project/Core/utils/app_colors.dart';
import 'package:ecommerce_project/Core/utils/app_text_style.dart';
import 'package:ecommerce_project/Core/widgets/elevated_button_widget.dart';
import 'package:ecommerce_project/Core/widgets/social_media_row_body.dart';
import 'package:ecommerce_project/Core/widgets/text_button_widget.dart';
import 'package:ecommerce_project/Core/widgets/text_form_field_widget.dart';
import 'package:ecommerce_project/Core/widgets/underline_button_widget.dart';
import 'package:ecommerce_project/Features/auth/presentation/manager/login/cubit/login_cubit.dart';
import 'package:ecommerce_project/Features/auth/presentation/manager/login/cubit/login_state.dart';
import 'package:ecommerce_project/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }

        if (state is LoginSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Login successful')));
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
                            "Welcome\nBack!",
                            style: AppTextStyles.bold36.copyWith(
                              color: AppColors.onBackground,
                            ),
                          ),
                        ),
                        SizedBox(height: 36.h),
                        TextFormFieldWidget(
                          iconLink: Assets.assetsImagesUser,
                          hintText: "Username or Email",
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
                        SizedBox(height: 9.h),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButtonWidget(
                            text: '"Forgot Password?"',
                            onPressed: () {
                              context.go(AppRoutes.kAuthForgetPasswordView);
                            },
                          ),
                        ),
                        SizedBox(height: 52.h),
                        ElevatedButtonWidget(
                          label: 'Login',
                          isLoading: state is LoginLoading,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<LoginCubit>().login(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                            }
                          },
                        ),
                        SizedBox(height: 75.h),
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
                              "Create An Account ",
                              style: AppTextStyles.regular14_4.copyWith(
                                color: AppColors.strongGrey,
                              ),
                            ),
                            UnderlineButtonWidget(
                              label: "Sign Up",
                              onPressed: () {
                                context.go(AppRoutes.kAuthSignupView);
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
