import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logistics/services/route_helper.dart';
import 'package:logistics/services/theme.dart';
import 'package:logistics/views/base/common_button.dart';

import '../../../generated/assets.dart';
import '../../../services/input_decoration.dart';
import '../DashBoard/dashboard.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({super.key});

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  bool _isExpanded = false; // Tracks if the container is expanded or not

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: SvgPicture.asset(Assets.imagesRegisterusersvg)),
                SizedBox(height: 25),
                Text(
                  "Let's Get to Know\n You Better",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontWeight: FontWeight.normal, fontSize: 30),
                ),
                SizedBox(height: 15),
                Text(
                  "Share your preferences, and we’ll ensure quick and easy deliveries.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 14),
                ),
                SizedBox(height: 25),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: CustomDecoration.inputDecoration(
                      floating: true,
                      label: 'Name',
                      icon: Icon(
                        Icons.person_outline,
                        size: 25,
                        color: Color(0xff000000),
                      ),
                      hint: 'Enter Your Name',
                      hintStyle: TextStyle(color: Color(0xff8A8A8A))),
                ),
                SizedBox(height: 20),

                TextFormField(
                  decoration: CustomDecoration.inputDecoration(
                      floating: true,
                      label: 'Email(Optional)',
                      icon: Icon(
                        Icons.email_outlined,
                        size: 25,
                        color: Color(0xff000000),
                      ),
                      hint: 'Enter Your Email',
                      hintStyle: TextStyle(color: Color(0xff8A8A8A))),
                ),
                SizedBox(height: 20),

                TextFormField(
                  decoration: CustomDecoration.inputDecoration(
                      floating: true,
                      label: 'Address',
                      icon: Icon(
                        Icons.location_on_outlined,
                        size: 25,
                        color: Color(0xff000000),
                      ),
                      hint: 'Enter Your Address',
                      hintStyle: TextStyle(color: Color(0xff8A8A8A))),
                ),
                SizedBox(height: 20),

                TextFormField(
                  style:
                      TextStyle(color: Colors.black), // set text color to black
                  controller: TextEditingController(text: '+91 25652 232262'),
                  enabled: false,
                  decoration: CustomDecoration.inputDecoration(
                      floating: true,
                      label: 'Mobile Number',
                      icon: Icon(
                        Icons.phone,
                        size: 25,
                        color: Color(0xff000000),
                      ),
                      hint: '+91 25652 232262 ',
                      hintStyle: TextStyle(color: Colors.black87)),
                ),
                SizedBox(
                  height: 20,
                ),

                // Custom Container to replace ExpansionTile
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Container(
                    color: primaryColor, // Set container color to orange
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white, // Set the icon color to white
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Complete your additional information.',
                          style: TextStyle(
                            color: Colors.white, // Set the text color to white
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          _isExpanded
                              ? Icons.arrow_upward
                              : Icons.arrow_downward,
                          color: Colors.white, // Set the icon color to white
                        ),
                      ],
                    ),
                  ),
                ),

                // If expanded, show additional fields
                if (_isExpanded) ...[
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: CustomDecoration.inputDecoration(
                        floating: true,
                        label: 'Company Name',
                        icon: Icon(
                          Icons.business,
                          size: 25,
                          color: Color(0xff000000),
                        ),
                        hint: 'Company Name',
                        hintStyle: TextStyle(color: Color(0xff8A8A8A))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: CustomDecoration.inputDecoration(
                        floating: true,
                        label: 'GSTIN Number',
                        icon: Icon(
                          Icons.numbers,
                          size: 25,
                          color: Color(0xff000000),
                        ),
                        hint: '0000000000000000',
                        hintStyle: TextStyle(color: Color(0xff8A8A8A))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: CustomDecoration.inputDecoration(
                        floating: true,
                        label: 'GSTIN Certificate',
                        icon: Icon(
                          Icons.file_copy_outlined,
                          size: 25,
                          color: Color(0xff000000),
                        ),
                        hint: 'Choose File',
                        suffix: Row(
                          mainAxisSize: MainAxisSize
                              .min, // Ensure that the row doesn't take too much space
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Text("Select File",
                                  style: TextStyle(color: Colors.blue)),
                            ),
                          ],
                        ),
                        hintStyle: TextStyle(color: Color(0xff8A8A8A))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: CustomDecoration.inputDecoration(
                        floating: true,
                        label: 'MSME Certificate',
                        icon: Icon(
                          Icons.file_copy_outlined,
                          size: 25,
                          color: Color(0xff000000),
                        ),
                        hint: 'Choose File',
                        suffix: Row(
                          mainAxisSize: MainAxisSize
                              .min, // Ensure that the row doesn't take too much space
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Text("Select File",
                                  style: TextStyle(color: Colors.blue)),
                            ),
                          ],
                        ),
                        hintStyle: TextStyle(color: Color(0xff8A8A8A))),
                  ),

                  // Add more fields here as necessary
                ],

                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                    onTap: () {
                      Navigator.pushReplacement(
                          context, getCustomRoute(child: Dashboard()));
                    },
                    title: "Continue",
                    // child: Text(
                    //   "Continue",
                    //   style: TextStyle(color: Colors.white, fontSize: 14),
                    // ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
