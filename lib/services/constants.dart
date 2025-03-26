import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class PriceConverter {
  static convert(price) {
    return '₹ ${double.parse('$price').toStringAsFixed(2)}';
  }

  static convertRound(price) {
    return '₹ ${double.parse('$price').toInt()}';
  }

  static convertToNumberFormat(num price) {
    final format = NumberFormat("#,##,##,##0.00", "en_IN");
    return '₹ ${format.format(price)}';
  }
}

void showCustomToast(msg, {color}) {
  Fluttertoast.showToast(
    msg: "$msg",
    backgroundColor: color,
    timeInSecForIosWeb: 1,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    webPosition: "center",
    webBgColor: "linear-gradient(to right, #dc1c13, #dc1c13)",
  );
}

String getStringFromList(List<dynamic>? data) {
  String str = data.toString();
  return data.toString().substring(1, str.length - 1);
}

class AppConstants {
  String get getBaseUrl => baseUrl;
  set setBaseUrl(String url) => baseUrl = url;

  //TODO: Change Base Url
  static String baseUrl = 'https://www.base-url.in/';
  // static String baseUrl = 'http://192.168.1.5:9000/'; ///USE FOR LOCAL
  //TODO: Change Base Url
  static String appName = 'App Name';

  static const String agoraAppId = 'c87b710048c049f59570bd1895b7e561';

  static const String loginUri = 'api/v1/user/login';
  static const String profileUri = 'api/v1/user/profile';
  static const String extras = 'api/v1/extra';

  // Shared Key
  static const String token = 'user_app_token';
  static const String userId = 'user_app_id';
  static const String razorpayKey = 'razorpay_key';
  static const String recentOrders = 'recent_orders';
  static const String isUser = 'is_user';


  static const String imagemap="https://s3-alpha-sig.figma.com/img/8414/f553/d63d5bbb1407c481ba3903df9c12c80b?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=hLUCpnYfVhw0UKdfWXi7axsterL6CZSbnxOuDg8Y7KuMVrjeHIk5ewCTN3XwyfA8SKvF8kS4Mj57UNy76GjJ93tY862svBpk59lhI0todsXQnPAWB854UTbucM-4sROiW1IG6XOM0L7Rt3TQ9zgr8qDj94oZmFaGLgj6BAtJWeFBklawRFv7o7FSaD3TydqXe~BqcFc2yb3BEXg3w4ZSqoqWVFJ7ttVH0SUEwK-2fYlDbY4Yg~OsKhWYXGYzd3tHB5prOzARC1mo1-4UCQBky8-mlvQTi0s~NNrxff4oyxhUpUXrkpp15dYovGdpmKh4e2kxCI2E7~L6UQO9X3gQsA__";
}
