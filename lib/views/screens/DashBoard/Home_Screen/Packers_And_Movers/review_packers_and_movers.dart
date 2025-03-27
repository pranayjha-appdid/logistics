import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';

class ReviewPackersAndMovers extends StatefulWidget {
  const ReviewPackersAndMovers({super.key});

  @override
  State<ReviewPackersAndMovers> createState() => _ReviewPackersAndMoversState();
}

class _ReviewPackersAndMoversState extends State<ReviewPackersAndMovers> {
  final List<Map<String, dynamic>> locationDetails = [
    {
      "address":
          "Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016",
      "isPickUp": true,
    },
    {
      "address":
          "Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016",
      "isPickUp": true,
    },
    {
      "address":
          "Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016",
      "isPickUp": true,
    },
    {
      "address":
          "Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016",
      "isPickUp": false,
    },
    {
      "address":
          "Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016",
      "isPickUp": false,
    },
    {
      "address":
          "Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016",
      "isPickUp": false,
    },
  ];

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
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: locationDetails.length,
                itemBuilder: (context, index) {
                  bool isFirst = index == 0;
                  bool isLast = index == locationDetails.length - 1;
                  var step = locationDetails[index];
                  return Row(
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
                              color: !step["isPickUp"]
                                  ? const Color(0xFFEB0404)
                                  : const Color(0xFF00C060),
                            ),
                            child: Icon(
                              isFirst || isLast
                                  ? Icons.location_on
                                  : Icons.circle,
                              color: Colors.white,
                              size: isFirst || isLast
                                  ? 20
                                  : 10, // Adjust icon size
                            ),
                          ),
                          // if (!isFirst && !isLast)
                          //   Padding(
                          //     padding: const EdgeInsets.only(left: 16.0, right: 16),
                          //     child: Container(
                          //       height: 10,
                          //       child: DottedBorder(
                          //         strokeWidth: 2,
                          //         dashPattern: const [5, 5],
                          //         color: Colors.grey,
                          //         customPath: (size) {
                          //           return Path()
                          //             ..moveTo(size.width / 2, 4)
                          //             ..lineTo(size.width / 2, 50);
                          //         },
                          //         child:
                          //             const SizedBox(width: 2), // Keeps it centered
                          //       ),
                          //     ),
                          //   ),
                          if (!isLast)
                            SizedBox(
                              width: 40,
                              height: 45, // Keep consistent spacing
                              child: DottedBorder(
                                strokeWidth: 2,
                                dashPattern: const [5, 5],
                                color: Colors.grey,
                                customPath: (size) {
                                  return Path()
                                    ..moveTo(size.width / 2, 4)
                                    ..lineTo(size.width / 2, 50);
                                },
                                child: const SizedBox
                                    .shrink(), // Keeps it centered
                              ),
                            )
                        ],
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: isFirst ? 10.0 : 0),
                              child: Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style:
                                          const TextStyle(color: Colors.black),
                                      children: [
                                        TextSpan(
                                          text: step["isPickUp"]
                                              ? "Pickup ${index + 1}    "
                                              : "Drop off ${index + 1}    ",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              'Kunal Pawar . +91 89455 53123 ',
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              step["address"],
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.copyWith(
                                      fontSize: 13, color: Color(0xff494949)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Schedule Bookings",
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(fontSize: 15),
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () => _selectDate(context),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  // pick up and drop timeline

                  Icon(
                    Icons.calendar_month_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
                  SizedBox(
                    width: 25,
                  ),
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
