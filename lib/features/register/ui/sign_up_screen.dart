import 'package:curaa/core/helpers/extension.dart';
import 'package:curaa/core/widgets/text_form_filed_widget/text_form_filed_widget.dart';
import 'package:curaa/features/login/ui/login_screen.dart';
import 'package:curaa/features/register/data/model/create_account_model.dart';
import 'package:curaa/features/register/logic/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../core/routing/routes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Account created successfully!",
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 1),
                ),
              );
              context.pushReplacementNamed(Routes.buttonNav);
            }
            if (state is RegisterErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.error ?? "Something went wrong....",
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: context.read<RegisterCubit>().formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(50),
                        CustomTextFormFiled(
                          validator: (value) {
                            if (value?.trim() == null || value!.isEmpty) {
                              return "This field is required";
                            }
                          },
                          text: "Enter your name",
                          controller: context
                              .read<RegisterCubit>()
                              .nameController,
                        ),
                        const Gap(20),
                        CustomTextFormFiled(
                          validator: (value) {
                            if (value?.trim() == null || value!.isEmpty) {
                              return "This field is required";
                            }
                          },
                          text: "Enter your Email",
                          controller: context
                              .read<RegisterCubit>()
                              .emailController,
                        ),
                        const Gap(20),
                        CustomTextFormFiled(
                          text: "Enter your Password",
                          validator: (value) {
                            if (value?.trim() == null || value!.isEmpty) {
                              return "This field is required";
                            }
                          },
                          controller: context
                              .read<RegisterCubit>()
                              .passwordController,
                        ),
                        const Gap(25),
                        CustomTextFormFiled(
                          text: "Enter your address",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field is required";
                            }
                          },
                          controller: context
                              .read<RegisterCubit>()
                              .addressController,
                        ),
                        const Gap(25),
                        CustomTextFormFiled(
                          text: "Enter your phone",
                          validator: (value) {
                            if (value?.trim() == null ||
                                value!.trim().isEmpty) {
                              return "This field is required";
                            }
                          },
                          controller: context
                              .read<RegisterCubit>()
                              .phoneController,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              'I agree to the mediocre Terms of Service and Privacy Policy',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                        const Gap(70),
                        state is RegisterLoadingState
                            ? Center(
                                child: CircularProgressIndicator.adaptive(),
                              )
                            : Center(
                                child: GestureDetector(
                                  onTap: () {
                                    if (context
                                        .read<RegisterCubit>()
                                        .formKey
                                        .currentState!
                                        .validate()) {
                                      context
                                          .read<RegisterCubit>()
                                          .emitRegister(
                                            user: CreateAccountModel(
                                              name: context
                                                  .read<RegisterCubit>()
                                                  .nameController
                                                  .text,
                                              email: context
                                                  .read<RegisterCubit>()
                                                  .emailController
                                                  .text,
                                              password: context
                                                  .read<RegisterCubit>()
                                                  .passwordController
                                                  .text,
                                              phone: context
                                                  .read<RegisterCubit>()
                                                  .phoneController
                                                  .text,
                                              address: context
                                                  .read<RegisterCubit>()
                                                  .addressController
                                                  .text,
                                            ),
                                          );
                                    }
                                  },
                                  child: Container(
                                    width: 300.w,
                                    height: 70.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 3.w,
                                      ),
                                    ),
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        const Gap(10),
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                ' have an account?',
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
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  ' Login',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
