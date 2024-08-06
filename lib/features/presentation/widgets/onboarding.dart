import 'package:coffe_shop/features/presentation/widgets/home.dart';
import 'package:coffe_shop/features/presentation/widgets/persisten_bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingWidgets extends StatefulWidget {
  const OnboardingWidgets({super.key});

  @override
  State<OnboardingWidgets> createState() => _OnboardingWidgetsState();
}

class _OnboardingWidgetsState extends State<OnboardingWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          SizedBox.expand(
            child: Image.asset(
              "assets/onboarding.jpeg",
              fit: BoxFit.cover,
            ),
          ),
          // Semi-transparent overlay
          Container(
            color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
          ),
          // Text at the bottom
           Positioned(
            bottom: 30, // Adjust the value as needed
            left: 0,
            right: 0,
            child: Container(
              margin:  EdgeInsets.symmetric(horizontal: 20.w ,vertical: 10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Text(
                    "Fall in Love with Coffee in Blissful Delight!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.sp, // Adjust font size as needed
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h), // Space between the texts
                   Text(
                    "Welcome to our cozy coffee corner, where every cup is delighful for you ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.sp, // Adjust font size as needed
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   SizedBox(height: 20.h), // Space between the texts
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFFC67C4E),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15.h,),
                    child:  InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>  PersistenBottomNavBar(),
                          ),
                        );
                      },
                      child: Text("Get Started",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
