import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:logistics/controllers/selectTruckTypeController.dart';
import 'package:logistics/views/screens/DashBoard/Home_Screen/Goods/select_truck_type_screen.dart';
import 'package:logistics/views/screens/DashBoard/Home_Screen/Packers_And_Movers/booking_placed_page.dart';

import '../../../../../controllers/location_controller.dart';
import '../../../../../services/route_helper.dart';
import '../../../../base/common_button.dart';
import '../../Location_Selection/drop_details.dart';
import '../../Location_Selection/pick_up_details.dart';

class GoodsReviewScreen extends StatefulWidget {
  const GoodsReviewScreen({super.key});

  @override
  State<GoodsReviewScreen> createState() => _GoodsReviewScreenState();
}

class _GoodsReviewScreenState extends State<GoodsReviewScreen> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffD9D9D9)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Icon(Icons.arrow_back_ios, size: 16),
                )),
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 4.0, top: 8.0, bottom: 16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: GetBuilder<LocationController>(
                    builder: (controller) {
                      final allLocations = [
                        ...controller.pickupLocations.map((e) => {
                              "address": e.address.text.trim(),
                              "building_name": e.buildingName.text.trim(),
                              "floor": e.floor.text.toString(),
                              "flatno": e.flatNo.text.toString(),
                              "isPickUp": true,
                            }),
                        ...controller.dropLocations.map((e) => {
                              "address": e.address.text.trim(),
                              "building_name": e.buildingName.text.trim(),
                              "floor": e.floor.text.toString(),
                              "flatno": e.flatNo.text.toString(),
                              "isPickUp": false,
                            }),
                      ];

                      int pickupCount = 0;
                      int dropCount = 0;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: allLocations.length,
                        itemBuilder: (context, index) {
                          bool isFirst = index == 0;
                          bool isLast = index == allLocations.length - 1;
                          var step = allLocations[index];

                          if (allLocations[index]["isPickUp"] == true) {
                            pickupCount++;
                          } else {
                            dropCount++;
                          }

                          return InkWell(
                            onTap: () {
                              if (step["isPickUp"] == true) {
                                Navigator.push(
                                  context,
                                  getCustomRoute(child: PickUpDetailsPage()),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  getCustomRoute(child: DropDetails()),
                                );
                              }
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 4),
                                      width: isFirst || isLast ? 40 : 20,
                                      height: isFirst || isLast ? 40 : 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: step["isPickUp"] == true
                                            ? const Color(
                                                0xFF00C060)
                                            : const Color(
                                                0xFFEB0404),
                                      ),
                                      child: Icon(
                                        isFirst || isLast
                                            ? Icons.location_on
                                            : Icons.circle,
                                        color: Colors.white,
                                        size: isFirst || isLast ? 20 : 10,
                                      ),
                                    ),
                                    if (!isLast)
                                      controller.pickupLocations.length > 1 ||
                                              controller.dropLocations.length >
                                                  1
                                          ? SizedBox(
                                              width: 40,
                                              height: 45,
                                              child: DottedBorder(
                                                strokeWidth: 2,
                                                dashPattern: const [5, 5],
                                                color: Colors.grey,
                                                customPath: (size) {
                                                  return Path()
                                                    ..moveTo(size.width / 2, 4)
                                                    ..lineTo(
                                                        size.width / 2, 50);
                                                },
                                                child: const SizedBox.shrink(),
                                              ),
                                            )
                                          : SizedBox(
                                              width: 40,
                                              height: 20,
                                            )
                                  ],
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: isFirst ? 10.0 : 0),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                style: const TextStyle(
                                                    color: Colors.black),
                                                children: [
                                                  TextSpan(
                                                      text: step["isPickUp"] ==
                                                              true
                                                          ? controller.pickaddressList
                                                                      .length >
                                                                  0
                                                              ? "Pickup $pickupCount    "
                                                              : "From"
                                                          : controller.dropaddressList
                                                                      .length >
                                                                  0
                                                              ? "Drop off $dropCount    "
                                                              : "To",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displayMedium
                                                          ?.copyWith(
                                                              color: Color(
                                                                  0xff787878),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 13)),
                                                  TextSpan(
                                                      text: step["isPickUp"] ==
                                                              true
                                                          ? "${Get.find<LocationController>().sendername.text}.   ${Get.find<LocationController>().sendermobileno.text}"
                                                          : "${Get.find<LocationController>().receivername.text}.   ${Get.find<LocationController>().receivermobileno.text}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displayMedium
                                                          ?.copyWith(
                                                              color: Color(
                                                                  0xff787878),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 11)),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        (step["address"] == null ||
                                            step["address"].toString().isEmpty)
                                            ? (step["isPickUp"] == true
                                            ? "Select pick up locations"
                                            : "Select drop off locations")
                                            : step["address"].toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(
                                              fontSize: 14,
                                              color: const Color(0xff494949),
                                            ),
                                      ),
                                      if (index != allLocations.length - 1)
                                        Divider(
                                          color: Color(0xffE4E4E4),
                                          thickness: 1,
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => _selectDate(context),

                child: Container(
                  width: double.infinity,
                  height: 50,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Date",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(color: Colors.grey, fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Text(
                          selectedDate == null
                              ? "Select Date"
                              : "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 50,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Truck",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(color: Colors.grey, fontSize: 16),
                    ),
                    SizedBox(width: 25,),
                    Expanded(
                      child: Text(
                        Get.find<SelectTruckTypeController>().selectedTruckName!,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                        style:
                        Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 50,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Goods Type",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(color: Colors.grey, fontSize: 16),
                    ),
                    SizedBox(width: 25,),
                    Expanded(
                      child: Text(
                        Get.find<SelectTruckTypeController>().selectedGoodsType!,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton(
                onTap: () {
                  Get.find<LocationController>().pickupLocations.clear();
                  Get.find<LocationController>().dropLocations.clear();
                  Get.find<LocationController>().sendermobileno.clear();
                  Get.find<LocationController>().receivername.clear();
                  Get.find<LocationController>().sendername.clear();
                  Get.find<LocationController>().receivermobileno.clear();
                  Get.find<LocationController>().pickupLocations.add(LocationFormControllers(type: "pickup"));
                  Get.find<LocationController>().dropLocations.add(LocationFormControllers(type: "drop"));
                  Get.find<SelectTruckTypeController>().selectedTruckName=null;
                  Get.find<SelectTruckTypeController>().selectedGoodsType=null;
                  Get.find<LocationController>().update();
                  Get.find<SelectTruckTypeController>().update();
                  Navigator.push(
                      context, getCustomRoute(child: BookingPlacedPage()));
                },
                title: 'Next',
              ))
        ],
      ),
    );
  }
}
