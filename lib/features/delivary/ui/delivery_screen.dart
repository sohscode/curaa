import 'package:curaa/core/helpers/extension.dart';
import 'package:curaa/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 1000,
              height: 500,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/Gemini_Generated_Image_pp2xoxpp2xoxpp2x.png',
                fit: BoxFit.contain,
              ),
            ),
            const Gap(2),
            const Text(
              'Your delivery is on the way',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const Gap(40),
            GestureDetector(
              onTap: () {
              context.pushNamed(Routes.buttonNav);
              },
              child: Container(
                width: 300,
                height: 70,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF30877C),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: const Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}