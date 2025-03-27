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
          "969 Ziemann Trail, West Kipview, New Hampshire - 51745, Dominica",
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
          Timeline.tileBuilder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            builder: TimelineTileBuilder.connected(
              connectionDirection: ConnectionDirection.before,
              nodePositionBuilder: (context, index) {
                return 0;
              },
              itemCount: locationDetails.length,
              indicatorBuilder: (context, index) {
                final step = locationDetails[index];
                bool isFirst = index == 0;
                bool isLast = index == locationDetails.length - 1;
                return DotIndicator(
                  size: (isFirst || isLast) ? 40.0 : 20.0,
                  color:
                      step["isPickUp"] ? Color(0xff00C060) : Color(0xffEB0404),
                  child: step["isPickUp"]
                      ? isFirst
                          ? Icon(Icons.location_on,
                              color: Colors.white,
                              size: (isFirst || isLast) ? 24.0 : 12.0)
                          : Icon(Icons.circle,
                              color: Colors.white,
                              size: (isFirst || isLast) ? 24.0 : 12.0)
                      :isLast
                      ? Icon(Icons.location_on,
                      color: Colors.white,
                      size: (isFirst || isLast) ? 24.0 : 12.0)
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
                  color: Colors.grey,
                );
              },
              contentsAlign: ContentsAlign.basic,
              contentsBuilder: (context, index) {
                final step = locationDetails[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: step["isPickUp"]
                                      ? "Pickup 1    "
                                      : "Drop off 1",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Kunal Pawar . +91 89455 53123 ',
                                ),
                              ],
                            ),
                          ),
                        ],
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
                            ?.copyWith(fontSize: 13, color: Color(0xff494949)),
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
                border: Border.all(color: Colors.black),
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
