import 'dart:convert';
import 'dart:developer';

import 'package:get/instance_manager.dart';
import 'package:logistics/controllers/auth_controller.dart';
import 'package:logistics/controllers/homeservices_controller.dart';
import 'package:logistics/controllers/selectTruckTypeController.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/location_controller.dart';
import '../data/api/api_calls.dart';
import '../data/api/api_client.dart';
import '../data/repositories/auth_repo.dart';
import '../data/repositories/user_repo.dart';
import 'constants.dart';

class Init {
  // getBaseUrl() async {
  //   ApiCalls calls = ApiCalls();
  //   await calls
  //       .apiCallWithResponseGet(
  //           'https://fishcary.com/fishcary/api/link2.php?for=true')
  //       .then((value) {
  //     log(value.toString());
  //     AppConstants().setBaseUrl = jsonDecode(value)['link'];
  //     log(AppConstants().getBaseUrl, name: 'BASE');
  //   });
  // }

  initialize() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    Get.lazyPut<SharedPreferences>(() => sharedPreferences);

    try {
      Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl, sharedPreferences: Get.find()));
      Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
      Get.lazyPut(() => UserRepo(apiClient: Get.find(), sharedPreferences: Get.find()));


      Get.lazyPut(() => AuthController(userRepo: Get.find(), authRepo: Get.find()));
      Get.lazyPut(() => HomeServiceController(userRepo: Get.find(), authRepo: Get.find()));

      Get.lazyPut(() => LocationController());
      Get.lazyPut(() => SelectTruckTypeController());



    } catch (e) {
      log('---- ${e.toString()} ----', name: "ERROR AT initialize()");
    }
  }
}
