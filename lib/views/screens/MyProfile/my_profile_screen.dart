import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../controllers/auth_controller.dart';
import '../../../generated/assets.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  String _dropDownValue = "";


  @override
  Widget build(BuildContext context) {
    final UserDetails=Get.find<AuthController>().userModel;


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(
            context,
          ),
          icon: Icon(Icons.arrow_back, size: 30),
          color: Colors.black,
        ),
        title: Text(
          "My Profile",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 12.0),
        //     child: Container(
        //       decoration: BoxDecoration(
        //         color: const Color(0xff09596F),
        //         borderRadius: BorderRadius.circular(10),
        //       ),
        //       padding: const EdgeInsets.symmetric(horizontal: 10),
        //       child: DropdownButton<String>(
        //         value: _dropDownValue.isEmpty ? null : _dropDownValue,
        //         hint: const Text(
        //           'Select',
        //           style: TextStyle(color: Colors.white),
        //         ),
        //         dropdownColor: const Color(0xff09596F),
        //         icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
        //         underline: const SizedBox(),
        //         items: ['English', 'Hindi'].map((String val) {
        //           return DropdownMenuItem<String>(
        //             value: val,
        //             child: Text(
        //               val,
        //               style: const TextStyle(color: Colors.white),
        //             ),
        //           );
        //         }).toList(),
        //         onChanged: (String? val) {
        //           setState(() {
        //             _dropDownValue = val!;
        //           });
        //         },
        //       ),
        //     ),
        //   ),
        // ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 120,
                      width: 120, // Important: width should match height for a perfect circle
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          Assets.imagesUser,
                          fit: BoxFit.cover, // cover works better in circular layout
                        ),
                      ),
                    ),
                    Positioned(
                      top: -0,
                      right: -5,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 20,
                        child: IconButton(
                          icon: const Icon(Icons.edit_off_outlined,
                              size: 20, color: Colors.white),
                          onPressed: () {
                            // Handle edit profile action
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: Text(
                  UserDetails!.name!,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 5),
              if(UserDetails.email!=null)
                Center(
                  child: Text(
                    UserDetails.email!,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),

              SizedBox(
                height: 10,
              ),
              const Divider(color: Colors.grey),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  "Contact Info",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 4,
                        offset: Offset(1, 1),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Mobile No ",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              UserDetails!.phone!,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                            ),
                          ),
                        ],
                      ),

                      if(UserDetails.email!=null)
                        TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Email Address",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 8.0, top: 8.0, bottom: 8.0),
                            child: Text(
                              UserDetails.email!,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),


              //   Text(
              //   "Address Info",
              //   style: Theme.of(context)
              //       .textTheme
              //       .displayLarge!
              //       .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
              // ),
              // const SizedBox(
              //   height: 5,
              // ),
              // Padding(
              //   padding: EdgeInsets.all(16.0),
              //   child: Text(
              //     "Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016",
              //     style: Theme.of(context)
              //         .textTheme
              //         .displayMedium!
              //         .copyWith(color: Colors.grey, fontSize: 15),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
