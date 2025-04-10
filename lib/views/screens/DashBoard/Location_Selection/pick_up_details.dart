import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logistics/services/route_helper.dart';
import 'package:logistics/views/base/common_button.dart';
import 'package:logistics/views/screens/DashBoard/Location_Selection/search_location.dart';
import '../../../../controllers/location_controller.dart';
import '../../../../services/input_decoration.dart';

class PickUpDetailsPage extends StatefulWidget {
  const PickUpDetailsPage({super.key});

  @override
  State<PickUpDetailsPage> createState() => _PickUpDetailsPageState();
}

class _PickUpDetailsPageState extends State<PickUpDetailsPage> {
  final formkey = GlobalKey<FormState>();
  List<LocationFormControllers> localPickupLocations = [];

  @override
  void initState() {
    super.initState();
    final controller = Get.find<LocationController>();


    localPickupLocations = controller.pickupLocations.isNotEmpty
        ? List.from(controller.pickupLocations)
        : [LocationFormControllers(type: "pickup")];
  }

  void addPickupLocation() {
    if (localPickupLocations.length < 4) {
      setState(() {
        localPickupLocations.add(LocationFormControllers(type: "pickup"));
      });
    }
  }

  void removePickupLocation(int index) {
    if (localPickupLocations.length > 1) {
      setState(() {
        localPickupLocations.removeAt(index);
      });
    }
  }

  void submitPickupLocations() {
    if (formkey.currentState!.validate()) {
      final controller = Get.find<LocationController>();
      controller.pickupLocations
        ..clear()
        ..addAll(localPickupLocations);

      controller.updatepickupAddressList();
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
            Text('Pickup Location ${index + 1}',
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
                      borderRadius: BorderRadius.circular(4)),
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
        const SizedBox(height: 15),
        TextFormField(
          validator: (value) => value!.isEmpty ? "Select Location" : null,
          controller: location.address,
          decoration: CustomDecoration.inputDecoration(
            label: 'Location',
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
          validator: (value) => value!.isEmpty ? "Enter Building Name" : null,
          controller: location.buildingName,
          decoration: CustomDecoration.inputDecoration(label: 'Building Name'),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                validator: (value) =>
                    value!.isEmpty ? "Enter Floor Name" : null,
                controller: location.floor,
                decoration: CustomDecoration.inputDecoration(label: 'Floor No'),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                validator: (value) => value!.isEmpty ? "Enter Flat Name" : null,
                controller: location.flatNo,
                decoration: CustomDecoration.inputDecoration(label: "Flat No"),
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
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Pick up Details",
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(color: Colors.black, fontSize: 18)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? "Enter Sender Name" : null,
                  controller: Get.find<LocationController>().sendername,
                  decoration:
                      CustomDecoration.inputDecoration(label: 'Sender Name'),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) return "Enter Mobile Number";
                    if (value.length != 10)
                      return "Enter Correct Mobile Number";
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  controller: Get.find<LocationController>().sendermobileno,
                  decoration:
                      CustomDecoration.inputDecoration(label: 'Mobile Number'),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10)
                  ],
                ),
                const SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: localPickupLocations.length + 1,
                  itemBuilder: (context, index) {
                    if (index == localPickupLocations.length) {
                      return localPickupLocations.length < 4
                          ? GestureDetector(
                              onTap: addPickupLocation,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 4.0, top: 8.0, right: 4.0),
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: Color(0xffEBF2F3),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Row(children: [
                                    Icon(Icons.add),
                                    SizedBox(width: 5),
                                    Text("Add Pickup Location")
                                  ]),
                                ),
                              ),
                            )
                          : SizedBox.shrink();
                    } else {
                      final location = localPickupLocations[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 4.0, right: 4.0, bottom: 8.0),
                        child: _address(
                          index: index,
                          location: location,
                          onRemove: () => removePickupLocation(index),
                          canRemove: localPickupLocations.length > 1,
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
          Padding(
            padding: EdgeInsets.all(16),
            child: CustomButton(
              onTap: submitPickupLocations,
              title: "SUBMIT",
            ),
          )
        ],
      ),
    );
  }
}
