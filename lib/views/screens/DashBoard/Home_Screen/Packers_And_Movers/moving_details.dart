import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:logistics/controllers/location_controller.dart';
import 'package:logistics/services/theme.dart';

import '../../../../../generated/assets.dart';
import '../../../../../services/route_helper.dart';
import '../../Location_Selection/drop_details.dart';
import '../../Location_Selection/pick_up_details.dart';

class MovingDetails extends StatefulWidget {
  const MovingDetails({super.key});

  @override
  State<MovingDetails> createState() => _MovingDetailsState();
}

class _MovingDetailsState extends State<MovingDetails> {
  int selectedOptionIndex = 0;
  bool isPickupLiftAvailable = false;
  bool isDropLiftAvailable = false;

  @override
  Widget build(BuildContext context) {
    for (var loc in Get.find<LocationController>().pickaddressList) {
      print(
          "Type: ${loc.type}, Address: ${loc.address}, Building: ${loc.buildingName}, Floor: ${loc.floor}, Flat: ${loc.flatno}");
    }

    for (var loc in Get.find<LocationController>().dropaddressList) {
      print(
          "Type: ${loc.type}, Address: ${loc.address}, Building: ${loc.buildingName}, Floor: ${loc.floor}, Flat: ${loc.flatno}");
    }

    print(Get.find<LocationController>().pickaddressList);
    print(Get.find<LocationController>().dropaddressList);
    print(Get.find<LocationController>().totalAddresses);

    return Column(
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
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOptionIndex = 0;
                  });
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: selectedOptionIndex == 0
                        ? primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: primaryColor),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Inter City",
                    style: TextStyle(
                      color: selectedOptionIndex == 0
                          ? Colors.white
                          : primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOptionIndex = 1;
                  });
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: selectedOptionIndex == 1
                        ? primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: primaryColor),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Out City",
                    style: TextStyle(
                      color: selectedOptionIndex == 1
                          ? Colors.white
                          : primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          "Service Lift Working",
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: const Color(0xff252525),
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
        ),
        const SizedBox(height: 5),
        const Divider(),
        Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xffD9D9D9)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Service lift available at pickup",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: const Color(0xff2A2F30),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                Switch(
                  value: isPickupLiftAvailable,
                  onChanged: (value) {
                    setState(() {
                      isPickupLiftAvailable = value;
                    });
                  },
                  activeColor: primaryColor,
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xffD9D9D9)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Service lift available at drop",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: const Color(0xff2A2F30),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                Switch(
                  value: isDropLiftAvailable,
                  onChanged: (value) {
                    setState(() {
                      isDropLiftAvailable = value;
                    });
                  },
                  activeColor: primaryColor,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
