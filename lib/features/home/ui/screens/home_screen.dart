import 'package:curaa/features/home/ui/widgets/card_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/icon_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 64,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          "Find your desired health solution",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Gap(50),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(15),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search medicines, pharmacies, products...",
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  spacing: 5,
                  children: [
                    IconItem(icon: "assets/images/Doctor.png", title: 'Doctor',onTap: (){},),
                    IconItem(
                      icon: "assets/images/Pharmacy.png",
                      title: 'Pharmacy',
                      onTap: (){},
                    ),
                    IconItem(
                      icon: "assets/images/Ambulance.png",
                      title: 'Ambulance',
                      onTap: (){},
                    ),
                    IconItem(
                      icon: "assets/images/Hospital.png",
                      title: 'Hospital',
                      onTap: (){},
                    ),
                  ],
                ),
                Gap(20),
                Container(
                  width: 550,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/Screenshot 2025-10-02 at 5.55.11 PM.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Pharmacy',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Gap(15),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return CardItem();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
