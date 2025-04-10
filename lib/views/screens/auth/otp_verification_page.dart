import 'dart:async';
import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logistics/services/theme.dart';
import 'package:logistics/views/screens/DashBoard/dashboard.dart';
import 'package:logistics/views/screens/auth/register_user_page.dart';
import 'package:pinput/pinput.dart';
import '../../../controllers/auth_controller.dart';
import '../../../generated/assets.dart';
import '../../../services/route_helper.dart';
import '../../base/common_button.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  bool _isResendOtpEnabled = false;
  int _resendOtpTimer = 30;
  Timer? _timer;
  bool _isTextVisible = true;

  @override
  void initState() {
    super.initState();
    _startResendOtpTimer();
  }

  void _startResendOtpTimer() {
    setState(() {
      _isResendOtpEnabled = false;
      _isTextVisible = true;
      _resendOtpTimer = 30;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_resendOtpTimer == 0) {
        setState(() {
          _isResendOtpEnabled = true;
          _isTextVisible = false;
        });
        timer.cancel();
      } else {
        setState(() {
          _resendOtpTimer--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: SvgPicture.asset(Assets.imagesOtpverficationlockicon)),
              SizedBox(height: 25),
              Text(
                "Verify Your Code",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 15),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'We have sent the verification to ',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 14),
                  children: [
                    TextSpan(
                      text: Get.find<AuthController>().numberController.text,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Change Phone Number?",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 13, color: Color(0xff009F0B)),
                ),
              ),
              SizedBox(height: 20),
              Pinput(
                controller: Get.find<AuthController>().otpController,
                length: 6,

                onCompleted: (pin) {
                  print('OTP entered: $pin');
                },
                onChanged: (pin) {
                  print('OTP is changing: $pin');
                },
                defaultPinTheme: PinTheme(
                  width: 45,
                  height: 60,
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff3B4652)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              if (_isTextVisible)
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        'Please wait for $_resendOtpTimer seconds to resend the OTP',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 14),
                    children: [
                      TextSpan(
                        text: '\nResend OTP',
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: _isResendOtpEnabled
                                      ? primaryColor
                                      : Colors.grey,
                                ),
                        recognizer: TapGestureRecognizer()
                          ..onTap =
                              _isResendOtpEnabled ? _startResendOtpTimer : null,
                      ),
                    ],
                  ),
                ),
              if (!_isTextVisible)
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: '\nResend OTP',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color:
                              _isResendOtpEnabled ? primaryColor : Colors.grey,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = _startResendOtpTimer,
                  ),
                ),
              SizedBox(height: 20),
              GetBuilder<AuthController>(
                builder: (auth) {
                  return CustomButton(
                    isLoading: auth.isLoading,
                    onTap: () {
                      if (auth.otpController.text.length == 6) {
                        dynamic data = {
                          'phone': auth.numberController.text,
                          'otp': auth.otpController.text,
                        };

                        auth.verifyOTP(data).then((value) {
                          if (value.isSuccess) {
                            log('${auth.userStatus}');

                            if (auth.userStatus == 'old'){
                              Navigator.pushAndRemoveUntil(
                                context,
                                getCustomRoute(child: Dashboard()),
                                    (route) => false,
                              );
                            }
                            else{
                              Navigator.pushAndRemoveUntil(
                                context,
                                getCustomRoute(child: RegisterUserPage()),
                                    (route) => false,
                              );
                            }

                          } else {
                            Fluttertoast.showToast(msg: value.message);
                          }
                        });
                      }
                    },
                    title: "Next",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
