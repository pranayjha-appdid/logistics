import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logistics/services/theme.dart';
import 'package:logistics/views/base/common_button.dart';
import 'package:logistics/views/screens/auth/otp_verification_page.dart';

import '../../../services/input_decoration.dart';
import '../../../services/route_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What’s your \n phone number?",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 25),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: CustomDecoration.inputDecoration(
                  floating: true,
                  label: 'Mobile Number',
                  icon: Icon(
                    Icons.phone_in_talk_outlined,
                    size: 19,
                    color: Color(0xFF130F26),
                  ),
                  hint: 'Enter your mobile number',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
              ),
              SizedBox(height: 25),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text:
                      'By tapping next you\'re creating an account and you agree to the ',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontWeight: FontWeight.normal),
                  children: [
                    TextSpan(
                      text: 'Terms & conditons',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.normal,
                            color: primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    TextSpan(
                      text: ' and acknowledge ',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    TextSpan(
                      text: 'Privacy policy',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.normal,
                            color: primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              CustomButton(
                onTap: () {
                  if (_phoneController.text.length == 10) {
                    Navigator.push(
                      context,
                      getCustomRoute(child: OtpVerificationPage()),
                    );
                  } else {
                    Fluttertoast.showToast(
                        msg: "Enter Correct Mobile Number",
                        toastLength: Toast.LENGTH_SHORT,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        fontSize: 16.0);
                  }
                },
                title: "Next",
                // child: Text(
                //   "Next",
                //   style: TextStyle(color: Colors.white, fontSize: 14),
                // ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
