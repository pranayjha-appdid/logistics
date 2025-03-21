import 'package:flutter/material.dart';
import 'package:logistics/services/route_helper.dart';

import '../Other_Screen/review_and_rating.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {

  Widget _MenuContentContainer(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 15),
        child: Row(
          children: [
            Icon(icon, size: 24),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: Colors.black, fontSize: 15),
              ),
            ),
            Icon(Icons.arrow_forward)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          width: size.width,
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              SizedBox(
                                width: size.width * 0.15,
                              ),
                              Text(
                                'Menu',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Color(0xff787878),
                        ),
                        _MenuContentContainer(
                            title: "My Profile",
                            icon: Icons.account_circle_outlined,
                            onTap: () {
                            }),
                        _MenuContentContainer(
                            title: "My Bookings",
                            icon: Icons.bookmark_outline,
                            onTap: () {}),
                        _MenuContentContainer(
                            title: "Packers and Movers",
                            icon: Icons.fire_truck_outlined,
                            onTap: () {}),
                        _MenuContentContainer(
                            title: "Review & Ratings",
                            icon: Icons.star_outline,
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(context, getCustomRoute(child: ReviewAndRating()));

                            }),
                        _MenuContentContainer(
                            title: "Term And Condition",
                            icon: Icons.description_outlined,
                            onTap: () {}),
                        _MenuContentContainer(
                            title: "Privacy policy",
                            icon: Icons.public,
                            onTap: () {}),
                        _MenuContentContainer(
                            title: "About Us",
                            icon: Icons.search_rounded,
                            onTap: () {}),
                        _MenuContentContainer(
                            title: "Support",
                            icon: Icons.book_outlined,
                            onTap: () {}),
                        _MenuContentContainer(
                            title: "Help & Support",
                            icon: Icons.help_outline,
                            onTap: () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.arrow_back,
                          color: Colors.red,
                          size: 24,
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Text(
                          "Log Out",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                color: Colors.red,
                                fontSize: 14,
                              ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    "Version Code: 1.0.0",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(color: Colors.black, fontSize: 11),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
