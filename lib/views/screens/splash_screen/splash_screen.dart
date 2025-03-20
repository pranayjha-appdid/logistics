import 'package:flutter/material.dart';
import 'package:logistics/services/route_helper.dart';
import 'package:logistics/services/theme.dart';
import 'package:logistics/views/screens/onboarding_page/onboarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        getCustomRoute(child: OnboardingPage()),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xff09596F),
      body: Center(
        child: Text(
          "Logo Here",
          style:  Theme.of(context).textTheme.labelLarge!.copyWith(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
