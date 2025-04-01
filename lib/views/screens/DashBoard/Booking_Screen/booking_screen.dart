import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:logistics/services/route_helper.dart';
import 'package:logistics/views/screens/DashBoard/Packer_And_Movers_Bookings/booking_details.dart';

import '../../../../data/models/dummydata.dart';
import '../../../../data/models/response/booking_model.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {

  final List<Booking> allBookings = allLocationsJson
      .map((json) => Booking.fromJson(json))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text("My Bookings"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            itemCount: allBookings.length,
            itemBuilder: (context, index) {
              var booking = allBookings[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, getCustomRoute(child: BookingDetails()));
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffD9D9D9)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                "ID: ${booking.id}",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 15),
                              ),
                            ),
                            // Status Badge
                            Container(
                              width: 120,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: booking.submit
                                      ? const Color(0xff163DFF) // Submitted (blue)
                                      : const Color(0xffFF4654), // Pending (red)
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10))),
                              child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        booking.submit ? "Submitted" : "Cancelled",
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.white),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Vehicle Number
                      Container(
                        width: double.infinity,
                        color: const Color(0xffF6F6F6),
                        child: Text(
                          textAlign: TextAlign.center,
                          booking.vehicleNo,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 15),
                        ),
                      ),

                      // Locations List
                      Container(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 4.0, top: 8.0, bottom: 16.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: booking.locations.length,
                          itemBuilder: (context, locIndex) {
                            var location = booking.locations[locIndex];
                            bool isFirst = locIndex == 0;
                            bool isLast =
                                locIndex == booking.locations.length - 1;

                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Pickup/Drop-off Icon
                                    Container(
                                      margin: const EdgeInsets.only(top: 4),
                                      width: isFirst || isLast ? 40 : 20,
                                      height: isFirst || isLast ? 40 : 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: location.isPickUp
                                            ? const Color(0xFF00C060) // Pickup (green)
                                            : const Color(0xFFEB0404), // Drop-off (red)
                                      ),
                                      child: Icon(
                                        isFirst || isLast
                                            ? Icons.location_on
                                            : Icons.circle,
                                        color: Colors.white,
                                        size: isFirst || isLast ? 20 : 10,
                                      ),
                                    ),

                                    // Dotted Line (if not last item)
                                    if (!isLast)
                                      SizedBox(
                                        width: 40,
                                        height: 45,
                                        child: DottedBorder(
                                          strokeWidth: 2,
                                          dashPattern: const [5, 5],
                                          color: Colors.grey,
                                          customPath: (size) {
                                            return Path()
                                              ..moveTo(size.width / 2, 4)
                                              ..lineTo(size.width / 2, 50);
                                          },
                                          child: const SizedBox.shrink(),
                                        ),
                                      ),
                                  ],
                                ),
                                const SizedBox(width: 14),

                                // Address Text
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical:
                                        (isFirst || isLast) ? 8.0 : 0.0),
                                    child: Text(
                                      location.address.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(
                                        fontSize: 14,
                                        color: const Color(0xff494949),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),

                      const Divider(
                        height: 4,
                        thickness: 1,
                        color: Color(0xffF6F6F6),
                      ),

                      // Booking Date & Delivery Date
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${booking.bookingDate}",
                              style: const TextStyle(
                                  fontSize: 12, color: Color(0xff646363)),
                            ),
                            Expanded(
                              child: Text(
                                "Est. Delivery: ${booking.deliveryDate}",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
                                maxLines: 1,
                                style: const TextStyle(
                                    fontSize: 12, color: Color(0xff646363)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
          ),
        ));
  }
}
