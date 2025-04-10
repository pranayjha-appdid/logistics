import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logistics/services/route_helper.dart';
import 'package:logistics/services/theme.dart';
import 'package:logistics/views/screens/auth/register_user_page.dart';
import 'package:logistics/views/screens/onboarding_page/onboarding_page.dart';

import '../../../controllers/auth_controller.dart';
import '../DashBoard/dashboard.dart';

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
    Future.delayed(Duration(seconds: 3), () async {
      await Get.find<AuthController>().getBusinessSettings();

      if (Get.find<AuthController>().isLoggedIn()) {
        await Get.find<AuthController>().getUserProfileData().then((value) {
          if (value.isSuccess) {
            if (!Get.find<AuthController>().checkUserData()) {
              Navigator.pushReplacement(
                  context, getCustomRoute(child: RegisterUserPage(user: Get.find<AuthController>().userModel!)));
            } else {
              Navigator.pushReplacement(
                  context, getCustomRoute(child: Dashboard()));
            }
          }
        });
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          getCustomRoute(child: OnboardingPage()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Text(
          "Logo Here",
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
