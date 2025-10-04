import 'package:curaa/core/helpers/extension.dart';
import 'package:curaa/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../core/widgets/custom_button/custom_button.dart';
import '../../../core/widgets/text_form_filed_widget/text_form_filed_widget.dart';
import '../../register/ui/sign_up_screen.dart';
import '../logic/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.w),
          child: BlocProvider(
              create: (context) => LoginCubit(),
              child: BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginLoadingState) {
                    CircularProgressIndicator();
                  }
                  if (state is LoginSuccessState) {
                    context.pushReplacementNamed(Routes.buttonNav);
                  }
                  if (state is LoginErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Something went wrong....",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                          backgroundColor: Colors.red,
                        ));
                  }
                },
                builder: (context, state) {
                  return SingleChildScrollView(
                    child: Form(
                      key: context
                          .read<LoginCubit>()
                          .formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Welcome Back, Again',
                                style: TextStyle(
                                  fontSize: 27.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Image.asset(
                                'assets/images/Gemini_Generated_Image_j63zb5j63zb5j63z.png',
                                width: 60.w,
                                height: 40.h,
                              ),
                            ],
                          ),
                          Gap(50),
                          CustomTextFormFiled(
                            text: 'Enter your Email',
                            validator: (value) {
                              if (value?.trim() == null || value!.trim().isEmpty) {
                                return "email is required";
                              }
                            },
                            controller: context
                                .read<LoginCubit>()
                                .emailController,
                          ),
                          Gap(30),
                          CustomTextFormFiled(
                            text: 'Enter your Password',
                            validator: (value) {
                              if (value?.trim() == null || value!.trim().isEmpty) {
                                return "password is required";
                              }
                            },
                            controller: context
                                .read<LoginCubit>()
                                .passwordController,
                          ),
                          const Gap(10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Forget your password?',
                                style: TextStyle(
                                  color: Theme
                                      .of(context)
                                      .primaryColor,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          Gap(20),
                          CustomButton(
                            text: 'Login',
                            onTap: () {
                              if (context.read<LoginCubit>().formKey.currentState!.validate()) {
                                context.read<LoginCubit>().emitLogin(
                                  email: context
                                      .read<LoginCubit>()
                                      .emailController
                                      .text,
                                  password: context
                                      .read<LoginCubit>()
                                      .passwordController
                                      .text,
                                );
                              }
                            },
                            color: Theme
                                .of(context)
                                .colorScheme
                                .surface,
                            backgroundColor: Theme
                                .of(context)
                                .primaryColor,
                          ),

                          Gap(10),
                          Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Don’t have an account?',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                                const Gap(2),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                        const SignUpScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Theme
                                          .of(
                                        context,
                                      )
                                          .colorScheme
                                          .primary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gap(15),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                    color: Colors.grey, thickness: 1),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.h),
                                child: Text(
                                  'OR',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                    color: Colors.grey, thickness: 1),
                              ),
                            ],
                          ),
                          Gap(15),
                          CustomButton(
                            text: 'sign in With Google',
                            onTap: () {},
                            color: Theme
                                .of(context)
                                .colorScheme
                                .onSurface,
                            backgroundColor: Theme
                                .of(
                              context,
                            )
                                .colorScheme
                                .surface,
                          ),
                          Gap(15),
                          CustomButton(
                            text: 'sign in With Apple',
                            onTap: () {},
                            color: Theme
                                .of(context)
                                .colorScheme
                                .onSurface,
                            backgroundColor: Theme
                                .of(
                              context,
                            )
                                .colorScheme
                                .surface,
                          ),
                          Gap(15),
                          CustomButton(
                            text: 'sign in With Facebook',
                            onTap: () {},
                            color: Theme
                                .of(context)
                                .colorScheme
                                .onSurface,
                            backgroundColor: Theme
                                .of(
                              context,
                            )
                                .colorScheme
                                .surface,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ),
        ),
      ),
    );
  }
}
