import 'package:curaa/features/home/data/model/pharmacy_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key,required this.pharmacy});
final PharmacyModel pharmacy;
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
            image:  DecorationImage(
              image: Image.network(
                "${pharmacy.logo}",
              ).image,
              fit: BoxFit.cover,
            ),
          ),
        ),
         SizedBox(height: 6.h),
         Text(pharmacy.name ??""),
      ],
    );
  }
}
