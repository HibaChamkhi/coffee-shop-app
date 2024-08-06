import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/presentation/widgets/onboarding.dart';


void main() {
  runApp(ScreenUtilInit(
    designSize: const Size(428, 810),
    builder: (BuildContext context, Widget? child) {
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingWidgets(),
    );
  }
}

