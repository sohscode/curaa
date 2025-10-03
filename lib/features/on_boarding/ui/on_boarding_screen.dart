import 'package:curaa/core/helpers/extension.dart';
import 'package:curaa/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Cc.png',
              width: 1000.w,
              height: 250.h,
              fit: BoxFit.contain,
            ),
            const Gap(5),
            Text(
              "Let's get started!",
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            const Gap(10),

            Text(
              'Login to enjoy the features we\'ve provided, and stay healthy!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colorScheme.onSurface,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            Gap(110),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    context.pushReplacementNamed(Routes.login);
                  },
                  child: Container(
                    width: 300.w,
                    height: 70.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(
                        color: colorScheme.surface,
                        width: 3.w,
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.surface,
                      ),
                    ),
                  ),
                ),
                const Gap(10),
                GestureDetector(
                  onTap: () {
                    context.pushReplacementNamed(Routes.signUp);
                  },
                  child: Container(
                    width: 300.w,
                    height: 70.sp,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(
                        color: colorScheme.primary,
                        width: 3.w,
                      ),
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
