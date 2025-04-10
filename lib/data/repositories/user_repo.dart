import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/constants.dart';
import '../api/api_client.dart';

class UserRepo {
  final SharedPreferences sharedPreferences;
  final ApiClient apiClient;
  UserRepo({required this.sharedPreferences, required this.apiClient});

  Future<Response> login({required String phone}) async =>
      await apiClient.postData(AppConstants.loginUri, {'phone': phone});

  Future<Response> verifyOTP(dynamic data) async =>
      await apiClient.postData(AppConstants.verifyOtp, data);

  Future<Response> logout() async =>
      await apiClient.getData(AppConstants.logOutUri);

  Future<Response> registerUser(dynamic data) async =>
      await apiClient.postData(AppConstants.registerUri, data);

  Future<Response> getBusinessSettings() async =>
      await apiClient.getData(AppConstants.businessSettings);


  Future<Response> getSliders() async =>
      await apiClient.getData(AppConstants.banner);
}
