import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logistics/views/screens/auth/register_user_page.dart';
import 'package:pinput/pinput.dart'; // Import pinput package

import '../../../generated/assets.dart';
import '../../../services/route_helper.dart';
import '../../base/common_button.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final TextEditingController _otpController = TextEditingController();
  bool _isResendOtpEnabled = false;
  int _resendOtpTimer = 30;
  Timer? _timer;
  bool _isTextVisible = true;

  @override
  void initState() {
    super.initState();
    _startResendOtpTimer(); // Start the countdown when screen loads
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
              Center(child: SvgPicture.asset(Assets.imagesOtpverficationlockicon)),
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
                      text: '+91 9876543210',
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
                controller: _otpController,
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
              // "Please wait for..." Text Visibility Control
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
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: _isResendOtpEnabled
                                  ? Color(0xff09596F) // Resend button enabled
                                  : Colors
                                      .grey, // Change color to gray while waiting
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = _isResendOtpEnabled
                              ? _startResendOtpTimer
                              : null, // Only allow resend after 30 seconds
                      ),
                    ],
                  ),
                ),
              // If the "Please wait for..." text is hidden, just show the "Resend OTP" button
              if (!_isTextVisible)
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: '\nResend OTP',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: _isResendOtpEnabled
                              ? Color(0xff09596F) // Resend button enabled
                              : Colors
                                  .grey, // Change color to gray while waiting
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = _startResendOtpTimer, // Restart the timer
                  ),
                ),
              SizedBox(height: 20),
              CustomButton(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    getCustomRoute(child: RegisterUserPage()),
                    (route) => false,
                  );
                },
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
