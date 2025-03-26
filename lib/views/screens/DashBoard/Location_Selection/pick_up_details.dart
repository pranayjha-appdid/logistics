import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logistics/services/route_helper.dart';
import 'package:logistics/views/base/common_button.dart';
import 'package:logistics/views/screens/DashBoard/Location_Selection/search_location.dart';
import '../../../../controllers/drop_location_controller.dart';
import '../../../../services/input_decoration.dart';

class PickUpDetailsPage extends StatefulWidget {
  const PickUpDetailsPage({super.key});

  @override
  State<PickUpDetailsPage> createState() => _PickUpDetailsPageState();
}

class _PickUpDetailsPageState extends State<PickUpDetailsPage> {
  DateTime? selectedDate;

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
      extendBody: true,
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
          "Pick up Details",
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: CustomDecoration.inputDecoration(
                  label: 'Sender Name: Kunal Patil',
                  borderRadius: 8,
                ),
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedDate == null
                            ? "Select Date"
                            : "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Icon(
                        Icons.calendar_today,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Pickup Location",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: Colors.black, fontSize: 18),
              ),
              SizedBox(height: 15),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: CustomDecoration.inputDecoration(
                    label: 'Location',
                    borderRadius: 8,
                    suffix: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context, getCustomRoute(child: SearchLocation()));
                        },
                        icon: Icon(Icons.location_on_outlined))),
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: CustomDecoration.inputDecoration(
                  label: 'The Mock Tower',
                  borderRadius: 8,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: CustomDecoration.inputDecoration(
                        label: 'Floor No',
                        borderRadius: 8,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: CustomDecoration.inputDecoration(
                        label: 'House Number',
                        borderRadius: 8,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: CustomButton(
              onTap: () {},
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
