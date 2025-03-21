import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logistics/views/screens/DashBoard/Location_Selection/search_location.dart';

import '../../../../services/input_decoration.dart';
import '../../../../services/route_helper.dart';
import '../../../base/common_button.dart';

class DropDetails extends StatefulWidget {
  const DropDetails({super.key});

  @override
  State<DropDetails> createState() => _DropDetailsState();
}

class _DropDetailsState extends State<DropDetails> {
  List<int> dropLocations = [1];
  Widget _dropLocation(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dropLocations.length == 1
              ? "Drop Location"
              : "Drop Location No. $index",
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
        SizedBox(height: 20),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: CustomDecoration.inputDecoration(
                  label: 'Receiver Name: Kunal Pawar',
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
              SizedBox(height: 30),

              // Render dynamic drop locations
              Column(
                children:
                    dropLocations.map((index) => _dropLocation(index)).toList(),
              ),

              SizedBox(height: 10),

              GestureDetector(
                onTap: () {
                  setState(() {
                    dropLocations.add(dropLocations.length + 1);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xffEBF2F3),
                    border: Border.all(color: Color(0xffffffff)),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.add, size: 13),
                      SizedBox(width: 5),
                      Text(
                        "Add more drop location",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(color: Colors.black, fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
              // Container(
              //   padding: EdgeInsets.all(16),
              //   child: CustomButton(
              //     onTap: () {},
              //     color: const Color(0xff09596F),
              //     child:
              //     const Text("SUBMIT", style: TextStyle(color: Colors.white)),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(left: 16,right: 16,bottom: 16),
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
