import 'dart:developer';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logistics/services/route_helper.dart';
import 'package:logistics/views/screens/DashBoard/Packer_And_Movers_Bookings/home_items_list.dart';
import 'package:logistics/views/screens/DashBoard/Packer_And_Movers_Bookings/tracking_details.dart';
import 'package:timelines_plus/timelines_plus.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({super.key});

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  final List<Map<String, dynamic>> trackingDetails = [
    {
      "pickOrDrop": "Pick up 1",
      "address":
          "969 Ziemann Trail, West Kipview, New Hampshire - 51745, Dominica",
      "date": "Mar 25, 2025",
      "time": "10:00 AM",
      "completed": true,
    },
    {
      "pickOrDrop": "Pick up 2",
      "address":
          "Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016",
      "date": "Mar 26, 2025",
      "time": "08:30 AM",
      "completed": true,
    },
    {
      "pickOrDrop": "Drop off 1",
      "address":
          "Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016",
      "date": "Mar 27, 2025",
      "time": "12:00 PM",
      "completed": true,
    },
    {
      "pickOrDrop": "Drop off 2",
      "address":
          "Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016",
      "date": "",
      "time": "",
      "completed": false,
    },
    {
      "pickOrDrop": "Drop off 3",
      "address":
          "Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016",
      "date": "",
      "time": "",
      "completed": false,
    },
  ];

  DateTime bookingDate = DateTime(2025, 3, 13, 17, 12);
  DateTime estimateDeliveryDate = DateTime(2025, 9, 13);

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('d MMMM yyyy hh:mm a');
    return formatter.format(date);
  }

  Widget _deliverycharges() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Pyable",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: Colors.black, fontSize: 14),
            ),
            Text(
              "₹ 45000.00",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: Colors.black, fontSize: 14),
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Trip Rate",
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontSize: 14,
                    color: Color(0xff868686),
                  ),
            ),
            Text(
              "₹ 45000",
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontSize: 14,
                    color: Color(0xff868686),
                  ),
            )
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Advance Paid",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: Colors.black, fontSize: 14),
            ),
            Text(
              "₹ 15000.00",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: Colors.black, fontSize: 14),
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Bank transfer",
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontSize: 14,
                    color: Color(0xff868686),
                  ),
            ),
            Text(
              "₹ 10000",
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontSize: 14,
                    color: Color(0xff868686),
                  ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Cash",
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontSize: 14,
                    color: Color(0xff868686),
                  ),
            ),
            Text(
              "₹ 5000",
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontSize: 14,
                    color: Color(0xff868686),
                  ),
            )
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Balance",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: Colors.black, fontSize: 14),
            ),
            Text(
              "₹ 30000.00",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: Colors.black, fontSize: 14),
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, size: 30),
          color: Colors.black,
        ),
        title: Text(
          "ID 12332322",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "MH 07 AE 2145",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Use the formatted booking date here
                  Text(
                    formatDate(bookingDate),
                    style: Theme.of(context)
                        .textTheme
                        ?.displaySmall
                        ?.copyWith(color: Color(0xff868686), fontSize: 15),
                  ),
                  Spacer(),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color(0xff168FFF),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 18,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Confirmed",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Timeline.tileBuilder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                builder: TimelineTileBuilder.connected(
                  connectionDirection: ConnectionDirection.before,
                  nodePositionBuilder: (context, index) {
                    return 0;
                  },
                  itemCount: trackingDetails.length,
                  indicatorBuilder: (context, index) {
                    final step = trackingDetails[index];
                    return DotIndicator(
                      size: 20.0,
                      color: step["completed"] ? Color(0xffFFA538) : null,
                      child: step["completed"]
                          ? const Icon(Icons.check,
                              color: Colors.white, size: 12)
                          : Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black)),
                              child: const Icon(Icons.circle,
                                  color: Colors.black, size: 10),
                            ),
                    );
                  },
                  connectorBuilder: (_, index, type) {
                    return DashedLineConnector(
                      gap: 4.0,
                      color: trackingDetails[index]["completed"]
                          ? Color(0xffFFA538)
                          : Colors.black,
                    );
                  },
                  contentsBuilder: (context, index) {
                    final step = trackingDetails[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 25.0, top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                step["pickOrDrop"],
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.copyWith(
                                        fontSize: 13, color: Color(0xff7E7E7E)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              if (step["date"] != "" && step["time"] != "")
                                Container(
                                  color: Colors.green,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.0, horizontal: 5),
                                    child: Text(
                                      "${step["date"]} ${step["time"]}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                            ],
                          ),
                          Text(
                            step["address"],
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 13, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Est. Delivery Date:",
                    style: Theme.of(context)
                        .textTheme
                        ?.displayLarge
                        ?.copyWith(fontSize: 16),
                  ),
                  Spacer(),
                  Text(
                    DateFormat('dd/MM/yyyy').format(estimateDeliveryDate),
                    style: Theme.of(context)
                        .textTheme
                        ?.displaySmall
                        ?.copyWith(color: Color(0xff868686), fontSize: 15),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Container(
                    width: 85,
                    decoration: BoxDecoration(
                        color: Color(0xff019539),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        textAlign: TextAlign.center,
                        "On Time",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Home item list",
                    style: Theme.of(context)
                        .textTheme
                        ?.displayMedium
                        ?.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context, getCustomRoute(child: HomeItemsList()));
                    },
                    child: Text(
                      "View All",
                      style: Theme.of(context)
                          .textTheme
                          ?.displayMedium
                          ?.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff09596F)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Delivery Charges",
                style: Theme.of(context)
                    .textTheme
                    ?.displayMedium
                    ?.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              _deliverycharges(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xff000000),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Pay",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.push(
                        context, getCustomRoute(child: TrackingDetails()));
                  });
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xff09596F),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: const Color(0xff09596F)),
                  ),
                  alignment: Alignment.center,
                  child: Text("Track Order",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: Colors.white, fontSize: 18)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
