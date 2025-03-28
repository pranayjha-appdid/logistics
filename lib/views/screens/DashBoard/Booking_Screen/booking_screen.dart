import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:logistics/services/route_helper.dart';
import 'package:logistics/views/screens/DashBoard/Packer_And_Movers_Bookings/booking_details.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {


  final List<Map<String, dynamic>> allLocations = [
    {
      "id": "123456789",
      "vehicleNo": "MH07AE7545",
      "submit": true,
      "bookingDate": "21 March 2025",
      "deliveryDate": "11 March 2025",
      "locations": [
        {
          "address": "12 Baker Street, Marylebone, London, UK, NW1 6XE, Near Regent’s Park and The Sherlock Holmes Museum",
          "isPickUp": true,
        },
        {
          "address": "22 Park Avenue, Manhattan, New York, NY 10016, USA, Near Grand Central Terminal and Empire State Building",
          "isPickUp": false,
        }
      ]
    },
    {
      "id": "223344556",
      "vehicleNo": "DL08XY1122",
      "submit": false,
      "bookingDate": "15 March 2025",
      "deliveryDate": "25 March 2025",
      "locations": [
        {
          "address": "56 Downtown Road, Financial District, Los Angeles, CA 90015, USA, Opposite City Hall and The Staples Center",
          "isPickUp": true,
        },
        {
          "address": "78 Greenway Blvd, South Beach, Miami, FL 33139, USA, Near Ocean Drive and Miami Beach Boardwalk",
          "isPickUp": true,
        },
        {
          "address": "90 Riverside Drive, Lincoln Park, Chicago, IL 60601, USA, Overlooking Lake Michigan and Millennium Park",
          "isPickUp": false,
        }
      ]
    },
    {
      "id": "334455667",
      "vehicleNo": "KA05MN9988",
      "submit": true,
      "bookingDate": "10 April 2025",
      "deliveryDate": "20 April 2025",
      "locations": [
        {
          "address": "34 Kings Cross, London, UK, Near St. Pancras International",
          "isPickUp": true,
        },
        {
          "address": "56 Main Street, Brooklyn, NY, USA, Near Brooklyn Bridge",
          "isPickUp": false,
        }
      ]
    },
    {
      "id": "445566778",
      "vehicleNo": "TN09PQ5678",
      "submit": false,
      "bookingDate": "5 May 2025",
      "deliveryDate": "15 May 2025",
      "locations": [
        {
          "address": "12 Harbour Drive, Sydney, Australia, Near Sydney Opera House",
          "isPickUp": true,
        },
        {
          "address": "90 High Street, Melbourne, Australia, Near Federation Square",
          "isPickUp": false,
        }
      ]
    },
    {
      "id": "556677889",
      "vehicleNo": "RJ14LM4433",
      "submit": true,
      "bookingDate": "1 June 2025",
      "deliveryDate": "11 June 2025",
      "locations": [
        {
          "address": "123 Sunset Boulevard, Hollywood, CA, USA, Near Hollywood Walk of Fame",
          "isPickUp": true,
        },
        {
          "address": "789 Ocean Drive, Miami Beach, FL, USA, Near South Beach",
          "isPickUp": false,
        }
      ]
    },
    {
      "id": "667788990",
      "vehicleNo": "GJ18KL9876",
      "submit": false,
      "bookingDate": "7 July 2025",
      "deliveryDate": "17 July 2025",
      "locations": [
        {
          "address": "34 Central Avenue, Toronto, Canada, Near CN Tower",
          "isPickUp": true,
        },
        {
          "address": "22 Stanley Park Drive, Vancouver, Canada, Overlooking Pacific Ocean",
          "isPickUp": false,
        }
      ]
    },
    {
      "id": "778899001",
      "vehicleNo": "WB20YZ4321",
      "submit": true,
      "bookingDate": "10 August 2025",
      "deliveryDate": "20 August 2025",
      "locations": [
        {
          "address": "44 Champs-Élysées, Paris, France, Near Arc de Triomphe",
          "isPickUp": true,
        },
        {
          "address": "88 Rue de Rivoli, Paris, France, Near Louvre Museum",
          "isPickUp": false,
        }
      ]
    },
    {
      "id": "889900112",
      "vehicleNo": "UP30CD5678",
      "submit": false,
      "bookingDate": "5 September 2025",
      "deliveryDate": "15 September 2025",
      "locations": [
        {
          "address": "18 Tower Bridge Road, London, UK, Overlooking River Thames",
          "isPickUp": true,
        },
        {
          "address": "20 Abbey Road, London, UK, Near The Beatles' Studio",
          "isPickUp": false,
        }
      ]
    },
    {
      "id": "990011223",
      "vehicleNo": "MP07AB7890",
      "submit": true,
      "bookingDate": "3 October 2025",
      "deliveryDate": "13 October 2025",
      "locations": [
        {
          "address": "200 Fifth Avenue, New York, USA, Near Flatiron Building",
          "isPickUp": true,
        },
        {
          "address": "100 Madison Square, New York, USA, Near Madison Square Garden",
          "isPickUp": false,
        }
      ]
    },
    {
      "id": "101112334",
      "vehicleNo": "HR10GH9012",
      "submit": false,
      "bookingDate": "8 November 2025",
      "deliveryDate": "18 November 2025",
      "locations": [
        {
          "address": "101 Eighth Avenue, Manhattan, New York, USA, Near Chelsea Market",
          "isPickUp": true,
        },
        {
          "address": "303 Rodeo Drive, Beverly Hills, CA, USA, Near Luxury Shopping Street",
          "isPickUp": false,
        }
      ]
    },
    {
      "id": "111223345",
      "vehicleNo": "KL11EF3456",
      "submit": true,
      "bookingDate": "12 December 2025",
      "deliveryDate": "22 December 2025",
      "locations": [
        {
          "address": "17 Nathan Road, Kowloon, Hong Kong, Near Victoria Harbour",
          "isPickUp": true,
        },
        {
          "address": "99 Orchard Road, Singapore, Near Marina Bay Sands",
          "isPickUp": false,
        }
      ]
    },
    {
      "id": "121334456",
      "vehicleNo": "CG12JK6789",
      "submit": false,
      "bookingDate": "15 January 2026",
      "deliveryDate": "25 January 2026",
      "locations": [
        {
          "address": "14 La Rambla, Barcelona, Spain, Near Gothic Quarter",
          "isPickUp": true,
        },
        {
          "address": "25 Gran Via, Madrid, Spain, Near Puerta del Sol",
          "isPickUp": false,
        }
      ]
    },
    {
      "id": "131445567",
      "vehicleNo": "PB13OP8901",
      "submit": true,
      "bookingDate": "18 February 2026",
      "deliveryDate": "28 February 2026",
      "locations": [
        {
          "address": "66 Ginza Street, Tokyo, Japan, Near Tokyo Tower",
          "isPickUp": true,
        },
        {
          "address": "77 Shibuya Crossing, Tokyo, Japan, Near Hachiko Statue",
          "isPickUp": false,
        }
      ]
    },
    {
      "id": "141556678",
      "vehicleNo": "AS14UV2345",
      "submit": false,
      "bookingDate": "22 March 2026",
      "deliveryDate": "1 April 2026",
      "locations": [
        {
          "address": "23 Times Square, New York, USA, Near Broadway Theaters",
          "isPickUp": true,
        },
        {
          "address": "50 Wall Street, New York, USA, Near NY Stock Exchange",
          "isPickUp": false,
        }
      ]
    }
  ];


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
            itemCount: allLocations.length,
            itemBuilder: (context, index) {
              var booking = allLocations[index];

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
                                "ID: ${booking["id"]}",
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
                                  color: booking["submit"]
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
                                        booking["submit"] ? "Submitted" : "Cancelled",
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
                          booking["vehicleNo"],
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
                          itemCount: booking["locations"].length,
                          itemBuilder: (context, locIndex) {
                            var location = booking["locations"][locIndex];
                            bool isFirst = locIndex == 0;
                            bool isLast =
                                locIndex == booking["locations"].length - 1;

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
                                        color: location["isPickUp"]
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
                                      location["address"].toString(),
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
                              "${booking["bookingDate"]}",
                              style: const TextStyle(
                                  fontSize: 12, color: Color(0xff646363)),
                            ),
                            Expanded(
                              child: Text(
                                "Est. Delivery: ${booking["deliveryDate"]}",
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
