import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logistics/views/screens/DashBoard/Location_Selection/search_location.dart';

import '../../../../controllers/location_controller.dart';
import '../../../../services/input_decoration.dart';
import '../../../../services/route_helper.dart';
import '../../../base/common_button.dart';

class DropDetails extends StatefulWidget {
  const DropDetails({super.key});

  @override
  State<DropDetails> createState() => _DropDetailsState();
}

class _DropDetailsState extends State<DropDetails> {
  final formkey = GlobalKey<FormState>();
  List<LocationFormControllers> localdropLocations=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = Get.find<LocationController>();

    localdropLocations = controller.dropLocations.isNotEmpty
        ? List.from(controller.dropLocations)
        : [LocationFormControllers(type: "drop")];
  }



  void addDropLocation() {
    if (localdropLocations.length < 4) {
      setState(() {
        localdropLocations.add(LocationFormControllers(type: "drop"));
      });
    }
  }

  void removeDropLocation(int index) {
    if (localdropLocations.length > 1) {
      setState(() {
        localdropLocations.removeAt(index);
      });
    }
  }

  void submitDropLocations() {
    if (formkey.currentState!.validate()) {
      final controller = Get.find<LocationController>();
      controller.dropLocations
        ..clear()
        ..addAll(localdropLocations);

      controller.updatedropAddressList();
      Navigator.pop(context);
    }
  }


  Widget _address({
    required int index,
    required LocationFormControllers location,
    required VoidCallback onRemove,
    required bool canRemove,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Text('Drop Location ${index + 1}',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const Spacer(),
            if (canRemove)
              GestureDetector(
                onTap: onRemove,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xffCF0012),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.delete_outline, size: 16, color: Colors.white),
                      SizedBox(width: 4),
                      Text("Delete",
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                ),
              )
          ],
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: location.address,
          validator: (value) {
            if (value!.isEmpty) return "Please Select Location";
            return null;
          },
          decoration: CustomDecoration.inputDecoration(
            label: 'Location',
            labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade700,
            ),
            borderRadius: 8,
            suffix: IconButton(
              onPressed: () {
                Navigator.push(
                    context, getCustomRoute(child: const SearchLocation()));
              },
              icon: const Icon(Icons.location_on_outlined),
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: location.buildingName,
          validator: (value) {
            if (value!.isEmpty) return "Enter Building Name";
            return null;
          },
          decoration: CustomDecoration.inputDecoration(
            label: 'Building Name',
            labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade700,
            ),
            borderRadius: 8,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: location.floor,
                validator: (value) {
                  if (value!.isEmpty) return "Enter Floor Name";
                  return null;
                },
                decoration: CustomDecoration.inputDecoration(
                  label: 'Floor No',
                  labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade700,
                  ),
                  borderRadius: 8,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: location.flatNo,
                validator: (value) {
                  if (value!.isEmpty) return "Enter Flat Name";
                  return null;
                },
                decoration: CustomDecoration.inputDecoration(
                  label: 'Flat No',
                  labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade700,
                  ),
                  borderRadius: 8,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Dropping Details",
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) return "Enter Sender Name";
                    return null;
                  },
                  controller: Get.find<LocationController>().receivername,
                  decoration: CustomDecoration.inputDecoration(
                    label: 'Receiver Name',
                    labelStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade700,
                    ),
                    borderRadius: 8,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) return "Enter Mobile Number";
                    if (value!.length != 10)
                      return "Enter Correct Mobile Number";
                    return null;
                  },
                  controller: Get.find<LocationController>().receivermobileno,
                  decoration: CustomDecoration.inputDecoration(
                    label: 'Mobile Number',
                    labelStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade700,
                    ),
                    hint: 'Enter your mobile number',
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                // GetBuilder<LocationController>(
                //   builder: (controller) {
                //     return ListView.builder(
                //       shrinkWrap: true,
                //       physics: NeverScrollableScrollPhysics(),
                //       itemCount: localdropLocations.length + 1,
                //       itemBuilder: (context, index) {
                //         if (index == controller.dropLocations.length) {
                //           return controller.totalAddresses < 8 &&
                //                   controller.dropLocations.length < 4
                //               ? GestureDetector(
                //                   onTap: controller.addDropAddress,
                //                   child: Padding(
                //                     padding: const EdgeInsets.only(
                //                         left: 4.0, top: 8.0, right: 4.0),
                //                     child: Container(
                //                       padding: EdgeInsets.all(12),
                //                       decoration: BoxDecoration(
                //                           color: Color(0xffEBF2F3),
                //                           borderRadius:
                //                               BorderRadius.circular(4)),
                //                       child: Row(children: [
                //                         Icon(Icons.add),
                //                         SizedBox(width: 5),
                //                         Text("Add Drop Location")
                //                       ]),
                //                     ),
                //                   ),
                //                 )
                //               : SizedBox.shrink();
                //         } else {
                //           final location = controller.dropLocations[index];
                //           return Padding(
                //             padding: const EdgeInsets.only(
                //                 top: 8.0, left: 4.0, right: 4.0, bottom: 8.0),
                //             child: _address(
                //               index: index,
                //               location: location,
                //               onRemove: () =>
                //                   controller.removeDropAddress(index),
                //               canRemove: controller.dropLocations.length > 1,
                //             ),
                //           );
                //         }
                //       },
                //     );
                //   },
                // ),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: localdropLocations.length + 1,
              itemBuilder: (context, index) {
                if (index == localdropLocations.length) {
                  return
                      localdropLocations.length < 4
                      ? GestureDetector(
                    onTap: addDropLocation,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 4.0, top: 8.0, right: 4.0),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Color(0xffEBF2F3),
                            borderRadius:
                            BorderRadius.circular(4)),
                        child: Row(children: [
                          Icon(Icons.add),
                          SizedBox(width: 5),
                          Text("Add Drop Location")
                        ]),
                      ),
                    ),
                  )
                      : SizedBox.shrink();
                } else {
                  final location = localdropLocations[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 4.0, right: 4.0, bottom: 8.0),
                    child: _address(
                      index: index,
                      location: location,
                      onRemove: () => removeDropLocation(index),
                      canRemove: localdropLocations.length > 1,
                    ),
                  );
                }
              },
            ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: CustomButton(
              onTap: submitDropLocations,
              title: "SUBMIT",
            ),
          ),
        ],
      ),
    );
  }
}
