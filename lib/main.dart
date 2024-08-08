import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'features/presentation/widgets/onboarding.dart';
import 'injection.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await Supabase.initialize(
      url: "https://ahlgcthldmsdkoxyelff.supabase.co",
      anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFobGdjdGhsZG1zZGtveHllbGZmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjI5NDI0NzcsImV4cCI6MjAzODUxODQ3N30.qakzOKhG-FVxOuksmq7HTE7YKek1vi07B71oghoDkDI"
  );
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

