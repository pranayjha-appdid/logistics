import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logistics/data/models/response/user_model.dart';
import 'package:logistics/services/extensions.dart';
import 'package:logistics/services/route_helper.dart';
import 'package:logistics/services/theme.dart';
import 'package:logistics/views/base/common_button.dart';
import '../../../controllers/auth_controller.dart';
import '../../../generated/assets.dart';
import '../../../services/input_decoration.dart';
import '../DashBoard/dashboard.dart';
import 'package:http/http.dart' as http;

class RegisterUserPage extends StatefulWidget {
  final UserModel? user;

  const RegisterUserPage({super.key, this.user});

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {


  @override
  void initState() {
    super.initState();
    final user = widget.user;

    if (user != null) {
      nameController.text = user.name ?? '';
      emailController.text = user.email ?? '';
      companyNameController.text = user.companyName ?? '';
      gstinNumberController.text = user.gstNumber ?? '';
      phoneController.text = user.phone ?? '';

      _isExpanded = (user.companyName?.isNotEmpty ?? false) ||
          (user.gstNumber?.isNotEmpty ?? false);
    } else {
      phoneController.text = Get.find<AuthController>().numberController.text;
    }
  }

  final _formKey = GlobalKey<FormState>();
  bool _isExpanded = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController gstinNumberController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();


  File? gstinCertificate;
  File? msmeCertificate;

  Future<void> pickPdfFile(Function(File) onPicked) async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result != null && result.files.single.path != null) {
      onPicked(File(result.files.single.path!));
    }
  }

  void onContinue() async {
    if (_formKey.currentState!.validate()) {
      final name = nameController.text.trim();
      final email = emailController.text.trim();
      // final address = addressController.text.trim();
      final company = companyNameController.text.trim();
      final gstno = gstinNumberController.text.trim();
      // final mobile = Get.find<AuthController>().numberController.text.trim();

      dynamic data = {
        "name": name,
        "email": email,
        "company_name": company,
        "gst_number": gstno,
        "gst_certificate": gstinCertificate != null
            ? MultipartFile(gstinCertificate,
                filename: gstinCertificate!.path.fileName)
            : null,
        'msme_certificate': msmeCertificate != null
            ? MultipartFile(msmeCertificate,
                filename: msmeCertificate!.path.fileName)
            : null,
      };
      log('$data');

      // final Map<String, String> fields = {
      //   "name": name,
      // };

      Get.find<AuthController>().registerUser(FormData(data)).then((value) async {
        if (value.isSuccess) {
          await Get.find<AuthController>().getUserProfileData().then((value){
            Navigator.push(
              context,
              getCustomRoute(child: Dashboard()),
            );
          });

        } else {
          Fluttertoast.showToast(msg: value.message);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
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
                    controller: nameController,
                    validator: (value) =>
                        value!.isEmpty ? 'Name is required' : null,
                    decoration: CustomDecoration.inputDecoration(
                      floating: true,
                      label: 'Name',
                      icon: Icon(Icons.person_outline,
                          size: 25, color: Colors.black),
                      hint: 'Enter Your Name',
                      hintStyle: TextStyle(color: Color(0xff8A8A8A)),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    // validator: (value) =>
                    //     value!.isEmpty ? 'Email is required' : null,
                    decoration: CustomDecoration.inputDecoration(
                      floating: true,
                      label: 'Email',
                      icon: Icon(Icons.email_outlined,
                          size: 25, color: Colors.black),
                      hint: 'Enter Your Email',
                      hintStyle: TextStyle(color: Color(0xff8A8A8A)),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: addressController,
                    // validator: (value) =>
                    //     value!.isEmpty ? 'Address is required' : null,
                    decoration: CustomDecoration.inputDecoration(
                      floating: true,
                      label: 'Address',
                      icon: Icon(Icons.location_on_outlined,
                          size: 25, color: Colors.black),
                      hint: 'Enter Your Address',
                      hintStyle: TextStyle(color: Color(0xff8A8A8A)),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: phoneController,
                    enabled: false,
                    decoration: CustomDecoration.inputDecoration(
                      floating: true,
                      label: 'Mobile Number',
                      icon: Icon(Icons.phone, size: 25, color: Colors.black),
                      hint: '+91 25652 232262',
                      hintStyle: TextStyle(color: Colors.black87),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: Container(
                      color: primaryColor,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Row(
                        children: [
                          Icon(Icons.add, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'Complete your additional information.',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                          Spacer(),
                          Icon(
                              _isExpanded
                                  ? Icons.arrow_upward
                                  : Icons.arrow_downward,
                              color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  if (_isExpanded) ...[
                    SizedBox(height: 20),
                    TextFormField(
                      controller: companyNameController,
                      // validator: (value) => _isExpanded && value!.isEmpty
                      //     ? 'Company name required'
                      //     : null,
                      decoration: CustomDecoration.inputDecoration(
                        floating: true,
                        label: 'Company Name',
                        icon:
                            Icon(Icons.business, size: 25, color: Colors.black),
                        hint: 'Company Name',
                        hintStyle: TextStyle(color: Color(0xff8A8A8A)),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: gstinNumberController,
                      // validator: (value) => _isExpanded && value!.isEmpty
                      //     ? 'GSTIN required'
                      //     : null,
                      decoration: CustomDecoration.inputDecoration(
                        floating: true,
                        label: 'GSTIN Number',
                        icon:
                            Icon(Icons.numbers, size: 25, color: Colors.black),
                        hint: '0000000000000000',
                        hintStyle: TextStyle(color: Color(0xff8A8A8A)),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => pickPdfFile((file) {
                        setState(() => gstinCertificate = file);
                      }),
                      child: AbsorbPointer(
                        child: TextFormField(
                          // validator: (_) =>
                          //     _isExpanded && gstinCertificate == null
                          //         ? 'GSTIN Certificate required'
                          //         : null,
                          decoration: CustomDecoration.inputDecoration(
                            floating: true,
                            label: 'GSTIN Certificate',
                            icon: Icon(Icons.file_copy_outlined,
                                size: 25, color: Colors.black),
                            hint: gstinCertificate != null
                                ? gstinCertificate!.path.split('/').last
                                : 'Choose File',
                            suffix: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Text("Select File",
                                      style: TextStyle(color: Colors.blue)),
                                ),
                              ],
                            ),
                            hintStyle: TextStyle(color: Color(0xff8A8A8A)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => pickPdfFile((file) {
                        setState(() => msmeCertificate = file);
                      }),
                      child: AbsorbPointer(
                        child: TextFormField(
                          // validator: (_) =>
                          //     _isExpanded && msmeCertificate == null
                          //         ? 'MSME Certificate required'
                          //         : null,
                          decoration: CustomDecoration.inputDecoration(
                            floating: true,
                            label: 'MSME Certificate',
                            icon: Icon(Icons.file_copy_outlined,
                                size: 25, color: Colors.black),
                            hint: msmeCertificate != null
                                ? msmeCertificate!.path.split('/').last
                                : 'Choose File',
                            suffix: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Text("Select File",
                                      style: TextStyle(color: Colors.blue)),
                                ),
                              ],
                            ),
                            hintStyle: TextStyle(color: Color(0xff8A8A8A)),
                          ),
                        ),
                      ),
                    ),
                  ],
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                      onTap: onContinue,
                      title: "Continue",
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
