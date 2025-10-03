import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          margin:  EdgeInsets.only(right: 12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            image: const DecorationImage(
              image: AssetImage(
                "assets/images/Gemini_Generated_Image_j63zb5j63zb5j63z.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
         SizedBox(height: 6.h),
        const Text("Panadol"),
      ],
    );
  }
}
