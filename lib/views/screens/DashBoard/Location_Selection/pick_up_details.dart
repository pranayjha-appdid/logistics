import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logistics/services/route_helper.dart';
import 'package:logistics/views/base/common_button.dart';
import 'package:logistics/views/screens/DashBoard/Location_Selection/search_location.dart';
import '../../../../services/input_decoration.dart';

class PickUpDetailsPage extends StatefulWidget {
  const PickUpDetailsPage({super.key});

  @override
  State<PickUpDetailsPage> createState() => _PickUpDetailsPageState();
}

class _PickUpDetailsPageState extends State<PickUpDetailsPage> {
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
