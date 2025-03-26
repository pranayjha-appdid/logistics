import 'package:flutter/material.dart';
import 'package:logistics/services/constants.dart';
import 'package:logistics/views/base/common_button.dart';
import 'package:timelines_plus/timelines_plus.dart';

class TrackingDetails extends StatefulWidget {
  const TrackingDetails({super.key});

  @override
  State<TrackingDetails> createState() => _TrackingDetailsState();
}

class _TrackingDetailsState extends State<TrackingDetails> {
  final List<Map<String, dynamic>> trackingSteps = [
    {
      "title": "Order Placed",
      "subtitle": "Your order has been successfully placed.",
      "date": "Mar 25, 2025",
      "time": "10:00 AM",
      "completed": true,
    },
    {
      "title": "Order Processed",
      "subtitle": "Your order is being prepared for shipment.",
      "date": "Mar 26, 2025",
      "time": "08:30 AM",
      "completed": true,
    },
    {
      "title": "Shipped",
      "subtitle": "Your order has been shipped.",
      "date": "Mar 27, 2025",
      "time": "12:00 PM",
      "completed": true,
    },
    {
      "title": "Out for Delivery",
      "subtitle": "Your package is on its way.",
      "date": "",
      "time": "",
      "completed": false,
    },
    {
      "title": "Delivered",
      "subtitle": "Your package has been delivered.",
      "date": "",
      "time": "",
      "completed": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, size: 30),
          color: Colors.black,
        ),
        title: Text(
          "Tracking Details",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "ID #51564656022",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "Delivery Address:",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Text(
                  "Worli Shivaji Nagar, Worli Mumbai, Maharashtra 400030",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontSize: 13),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Image.network(
                    AppConstants.imagemap,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Tracking",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(fontSize: 20),
                ),
                const SizedBox(height: 10),
                Timeline.tileBuilder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  builder: TimelineTileBuilder.connected(
                    connectionDirection: ConnectionDirection.before,
                    nodePositionBuilder: (context, index) {
                      return 0.3;
                    },
                    oppositeContentsBuilder: (context, index) {
                      final step = trackingSteps[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, bottom: 24.0, top: 30, right: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (step["completed"]) ...[
                              const SizedBox(height: 5),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${step["time"]}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${step["date"]}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(
                                            fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      );
                    },
                    itemCount: trackingSteps.length,
                    indicatorBuilder: (context, index) {
                      final step = trackingSteps[index];
                      return DotIndicator(
                        size: 20.0,
                        color: step["completed"] ? Colors.green : Colors.grey,
                        child: step["completed"]
                            ? const Icon(Icons.check,
                                color: Colors.white, size: 12)
                            : null,
                      );
                    },
                    connectorBuilder: (_, index, type) {
                      return SolidLineConnector(
                        color: trackingSteps[index]["completed"]
                            ? Colors.green
                            : Colors.grey.shade400,
                      );
                    },
                    contentsBuilder: (context, index) {
                      final step = trackingSteps[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, bottom: 24.0, top: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              step["title"],
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.copyWith(fontSize: 16),
                            ),
                            Text(
                              step["subtitle"],
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(fontSize: 13),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                CustomButton(
                  onTap: () {},
                  title: "Live Tracking",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
