import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:logistics/controllers/location_controller.dart';

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

  Widget LocationContainerWidget({
    required Color iconColor,
    required IconData icon,
    required String label,
    required String name,
    required String phone,
    required String address,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: '$label ',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '$name . $phone',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                address,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    for (var loc in Get.find<LocationController>().addressList) {
      print("Type: ${loc.type}, Address: ${loc.address}, Building: ${loc.buildingName}, Floor: ${loc.floor}, Flat: ${loc.flatno}");
    }
    print(Get.find<LocationController>().addressList);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, getCustomRoute(child: PickUpDetailsPage()));
                  },
                  child: LocationContainerWidget(
                    iconColor: const Color(0xff00C060),
                    icon: Icons.location_on,
                    label: "From",
                    name: "Kunal Pawar",
                    phone: "+91 89455 53123",
                    address: "Gopi Tank Marg, Mahim West, Shivaji Park...",
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, getCustomRoute(child: DropDetails()));
                  },
                  child: LocationContainerWidget(
                    iconColor: const Color(0xffEB0404),
                    icon: Icons.location_on,
                    label: "To",
                    name: "Manoj Dalavi",
                    phone: "+91 89455 53123",
                    address:
                        "Worli Shivaji Nagar, Worli Mumbai, Maharashtra 400030",
                  ),
                ),
              ],
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
                        ? const Color(0xff09596F)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xff09596F)),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Inter City",
                    style: TextStyle(
                      color: selectedOptionIndex == 0
                          ? Colors.white
                          : const Color(0xff09596F),
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
                        ? const Color(0xff09596F)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xff09596F)),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Out City",
                    style: TextStyle(
                      color: selectedOptionIndex == 1
                          ? Colors.white
                          : const Color(0xff09596F),
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
                  activeColor: const Color(0xff09596F),
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
                  activeColor: const Color(0xff09596F),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
