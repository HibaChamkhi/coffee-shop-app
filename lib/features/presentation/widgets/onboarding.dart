import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
              margin: const EdgeInsets.symmetric(horizontal: 20 ,vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Fall in Love with Coffee in Blissful Delight",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30, // Adjust font size as needed
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10), // Space between the texts
                  const Text(
                    "Welcome to our cozy coffee corner, where every cup is delighful for you ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12, // Adjust font size as needed
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20), // Space between the texts
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFFC67C4E),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15,),
                    child: const InkWell(
                      child: Text("Get Started",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
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
