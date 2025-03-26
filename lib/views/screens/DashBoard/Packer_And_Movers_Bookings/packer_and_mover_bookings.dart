import 'package:flutter/material.dart';
import '../../../../generated/assets.dart';

class PackerAndMoverBookings extends StatefulWidget {
  const PackerAndMoverBookings({super.key});

  @override
  State<PackerAndMoverBookings> createState() => _PackerAndMoverBookingsState();
}

class _PackerAndMoverBookingsState extends State<PackerAndMoverBookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, size: 30),
          color: Colors.black,
        ),
        title: Text("Packers & Movers"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 225,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFF4E5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: -10,
                        right: -10,
                        child: SizedBox(
                          width: 168,
                          height: 150,
                          child: Transform.flip(
                            flipX: true,
                            child: Opacity(
                              opacity: 0.54, // 60% opacity
                              child: Image.asset(
                                Assets.imagesTruckpackers,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: Container(
                          width: 120,
                          height: 35,
                          decoration: BoxDecoration(
                              color: Color(0xff163DFF),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10))),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.white,
                              ),
                              Text(
                                "Placed",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ],
                          )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Booking Info
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                children: [
                                  Text(
                                    "ID 12332322",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Container(
                                    width: 2.5,
                                    height: 20,
                                    color: Colors.yellow[500],
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    "11 March 2025",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "🚛 MH 07 AE 7545",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                            ),
                            Spacer(),

                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Row(
                                children: [
                                  _buildStep(
                                      true, Color(0xFFFDAA43)), // Active Step
                                  _buildLine(Color(0xFFFDAA43)),
                                  _buildStep(
                                      false, Colors.black), // Inactive Step
                                  _buildLine(Colors.black),
                                  _buildStep(
                                      false, Colors.black), // Inactive Step
                                ],
                              ),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("From",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                                color: Color(0xff868686),
                                                fontSize: 15)),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text("Kolhapur",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18)),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 1,
                                  height: 50,
                                  color: Colors.grey[500],
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("To",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                                color: Color(0xff868686),
                                                fontSize: 15)),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Goa",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18)),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  width: 120,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xffF39B04),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: Text("Track Order",
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall
                                              ?.copyWith(
                                                  fontSize: 15,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // Step Indicator
  Widget _buildStep(bool isActive, Color color) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: isActive
            ? Border.all(color: color, width: 3) // Active step border
            : null,
      ),
      child: isActive
          ? CircleAvatar(
              radius: 14,
              backgroundColor: Colors.white,
              child: Icon(Icons.circle, color: color, size: 18),
            )
          : Icon(Icons.circle, color: color, size: 18),
    );
  }

  // Connecting Line
  Widget _buildLine(Color color) {
    return Expanded(
      child: Container(
        height: 2,
        color: color,
      ),
    );
  }
}
