import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics/controllers/location_controller.dart';

import '../../../../../services/route_helper.dart';
import '../../Location_Selection/drop_details.dart';
import '../../Location_Selection/pick_up_details.dart';

class ReviewPackersAndMovers extends StatefulWidget {
  const ReviewPackersAndMovers({super.key});

  @override
  State<ReviewPackersAndMovers> createState() => _ReviewPackersAndMoversState();
}

class _ReviewPackersAndMoversState extends State<ReviewPackersAndMovers> {
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

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Material(
          //   elevation: 4,
          //   borderRadius: BorderRadius.circular(16),
          //   child: Container(
          //     padding: const EdgeInsets.only(
          //         left: 8.0, right: 4.0, top: 8.0, bottom: 16.0),
          //     decoration: BoxDecoration(
          //       border: Border.all(color: Colors.grey.shade300),
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(16),
          //     ),
          //     child: GetBuilder<LocationController>(
          //       builder: (controller) {
          //         final allLocations = [
          //           ...controller.pickupLocations.map((e) => {
          //             "address": e.address.text.trim(),
          //             "building_name":e.buildingName.text.trim(),
          //             "floor":e.floor.text.toString(),
          //             "flatno":e.flatNo.text.toString(),
          //             "isPickUp": true,
          //           }),
          //           ...controller.dropLocations.map((e) => {
          //             "address": e.address.text.trim(),
          //             "building_name":e.buildingName.text.trim(),
          //             "floor":e.floor.text.toString(),
          //             "flatno":e.flatNo.text.toString(),
          //             "isPickUp": false,
          //           }),
          //         ];
          //         print(allLocations);
          //
          //         return ListView.builder(
          //           shrinkWrap: true,
          //           physics: const NeverScrollableScrollPhysics(),
          //           itemCount: allLocations.length,
          //           itemBuilder: (context, index) {
          //             bool isFirst = index == 0;
          //             bool isLast = index == allLocations.length - 1;
          //             var step = allLocations[index];
          //
          //             return Row(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Column(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     Container(
          //                       margin: const EdgeInsets.only(top: 4),
          //                       width: isFirst || isLast ? 40 : 20,
          //                       height: isFirst || isLast ? 40 : 20,
          //                       decoration: BoxDecoration(
          //                         shape: BoxShape.circle,
          //                         color: step["isPickUp"] ==true
          //                             ? const Color(0xFF00C060)
          //                             : const Color(0xFFEB0404),
          //                       ),
          //                       child: Icon(
          //                         isFirst || isLast
          //                             ? Icons.location_on
          //                             : Icons.circle,
          //                         color: Colors.white,
          //                         size: isFirst || isLast ? 20 : 10,
          //                       ),
          //                     ),
          //                     if (!isLast)
          //                       SizedBox(
          //                         width: 40,
          //                         height: 45,
          //                         child: DottedBorder(
          //                           strokeWidth: 2,
          //                           dashPattern: const [5, 5],
          //                           color: Colors.grey,
          //                           customPath: (size) {
          //                             return Path()
          //                               ..moveTo(size.width / 2, 4)
          //                               ..lineTo(size.width / 2, 50);
          //                           },
          //                           child: const SizedBox.shrink(),
          //                         ),
          //                       )
          //                   ],
          //                 ),
          //                 const SizedBox(width: 14),
          //                 Expanded(
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Padding(
          //                         padding:
          //                         EdgeInsets.only(top: isFirst ? 10.0 : 0),
          //                         child: Row(
          //                           children: [
          //                             RichText(
          //                               text: TextSpan(
          //                                 style: const TextStyle(
          //                                     color: Colors.black),
          //                                 children: [
          //                                   TextSpan(
          //                                     text: step["isPickUp"] != null
          //                                         ? "Pickup ${index + 1}    "
          //                                         : "Drop off ${index + 1}    ",
          //                                     style: const TextStyle(
          //                                       fontWeight: FontWeight.bold,
          //                                     ),
          //                                   ),
          //                                   const TextSpan(
          //                                     text:
          //
          //                                     'Kunal Pawar . +91 89455 53123 ',
          //                                   ),
          //                                 ],
          //                               ),
          //                             ),
          //                             SizedBox(height: 5),
          //                           ],
          //                         ),
          //                       ),
          //                       const SizedBox(height: 5),
          //                       Text(
          //                         step["address"].toString(),
          //                         overflow: TextOverflow.ellipsis,
          //                         style: Theme.of(context)
          //                             .textTheme
          //                             .displayLarge
          //                             ?.copyWith(
          //                             fontSize: 13,
          //                             color: const Color(0xff494949)),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ],
          //             );
          //           },
          //         );
          //       },
          //     ),
          //   ),
          // ),
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
                                        0xFF00C060) // Pickup color (green)
                                        : const Color(
                                        0xFFEB0404), // Drop-off color (red)
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
                                      controller.dropLocations.length > 1
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
                                          ..lineTo(size.width / 2, 50);
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                    EdgeInsets.only(top: isFirst ? 10.0 : 0),
                                    child: Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            style: const TextStyle(
                                                color: Colors.black),
                                            children: [
                                              TextSpan(
                                                  text: step["isPickUp"] == true
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
                                                      color:
                                                      Color(0xff787878),
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontSize: 13)),
                                              TextSpan(
                                                  text: step["isPickUp"] == true
                                                      ? "${Get.find<LocationController>().sendername.text}.   ${Get.find<LocationController>().sendermobileno.text}"
                                                      : "${Get.find<LocationController>().receivername.text}.   ${Get.find<LocationController>().receivermobileno.text}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium
                                                      ?.copyWith(
                                                      color:
                                                      Color(0xff787878),
                                                      fontWeight:
                                                      FontWeight.bold,
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
                                    step["isPickUp"] == true
                                        ? controller.pickaddressList.length > 0
                                        ? step["address"].toString()
                                        : "Select pick up locations  "
                                        : controller.dropaddressList.length > 0
                                        ? step["address"].toString()
                                        : "Select drop off locations  ",
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(
                                      fontSize: 14,
                                      color: const Color(0xff494949),
                                    ),
                                  ),
                                  if(index!=allLocations.length-1)
                                    Divider(
                                      color:Color(0xffE4E4E4) ,
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

          const SizedBox(height: 20),
          Text(
            "Schedule Bookings",
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(fontSize: 15),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () => _selectDate(context),
            child: Container(
              width: double.infinity,
              padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.calendar_month_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
                  const SizedBox(width: 25),
                  Text(
                    selectedDate == null
                        ? "Select Date"
                        : "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
