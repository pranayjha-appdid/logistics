
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logistics/data/models/response/location_model.dart';
import 'package:logistics/views/screens/DashBoard/Location_Selection/search_location.dart';

import '../../../../controllers/drop_location_controller.dart';
import '../../../../services/input_decoration.dart';
import '../../../../services/route_helper.dart';
import '../../../base/common_button.dart';

class DropDetails extends StatefulWidget {
  const DropDetails({super.key});

  @override
  State<DropDetails> createState() => _DropDetailsState();
}

class _DropDetailsState extends State<DropDetails> {
  Widget _address({
    required int index,
    required LocationFormControllers location,
    required VoidCallback onRemove,
    required bool canRemove,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
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
                        Icon(Icons.delete_outline,
                            size: 16, color: Colors.white),
                        SizedBox(width: 4),
                        Text("Delete",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                      ],
                    ),
                  ),
                )
            ],
          ),
          const SizedBox(height: 15),
          TextField(
            controller: location.address,
            decoration: CustomDecoration.inputDecoration(
              label: 'Location',
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
          TextField(
            controller: location.buildingName,
            decoration: CustomDecoration.inputDecoration(
              label: 'Building Name',
              borderRadius: 8,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: location.floor,
                  decoration: CustomDecoration.inputDecoration(
                    label: 'Floor No',
                    borderRadius: 8,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: location.flatNo,
                  decoration: CustomDecoration.inputDecoration(
                    label: 'House Number',
                    borderRadius: 8,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ],
      ),
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
          child: GetBuilder<DropLocationController>(
            builder: (controller) => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.locations.length + 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    children: [
                      TextFormField(
                        initialValue: "Kunal Pawar",
                        keyboardType: TextInputType.text,
                        decoration: CustomDecoration.inputDecoration(
                          hint: 'Receiver Name',
                          borderRadius: 8,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: CustomDecoration.inputDecoration(
                          label: 'Mobile Number',
                          hint: 'Enter your mobile number',
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  );
                } else if (index == controller.locations.length + 1) {
                  return Column(
                    children: [
                      if (controller.locations.length < controller.maxAddress)
                        GestureDetector(
                          onTap: controller.addAddress,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xffEBF2F3),
                              border:
                                  Border.all(color: const Color(0xffffffff)),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.add, size: 13),
                                const SizedBox(width: 5),
                                Text(
                                  "Add more drop location",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                          color: Colors.black, fontSize: 14),
                                )
                              ],
                            ),
                          ),
                        ),
                      const SizedBox(height: 20),
                    ],
                  );
                } else {
                  final location = controller.locations[index - 1];
                  return _address(
                    index: index - 1,
                    location: location,
                    onRemove: () => controller.removeAddress(index - 1),
                    canRemove: controller.locations.length > 1,
                  );
                }
              },
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
              onTap: () {
                List<LocationModel> data =
                    Get.find<DropLocationController>().getLocationModels();
                for (var loc in data) {
                  print(
                      "Address: ${loc.address}, Building: ${loc.buildingName}, Floor: ${loc.floor}, Flat: ${loc.flatno}");
                }
              },
              color: const Color(0xff09596F),
              child:
                  const Text("SUBMIT", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
