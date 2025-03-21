import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logistics/services/route_helper.dart';
import '../../../../../generated/assets.dart';
import '../../Location_Selection/drop_details.dart';
import '../../Location_Selection/pick_up_details.dart';
import '../notification_screen.dart';

class TopSection extends StatefulWidget {
  const TopSection({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState>
      scaffoldKey; // Add scaffoldKey to the constructor

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {
  Widget LocationContainerWidget({
    required Color iconColor,
    required IconData icon,
    required String label,
    required String name,
    required String phone,
    required String address,
    required String actionIconPath,
  }) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: '$label ',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '$name . $phone',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Address
                  Text(
                    address,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            // Action icon (SVG or similar)
            CircleAvatar(
              backgroundColor: Color(0xffF4F4F4),
              child: SvgPicture.asset(
                actionIconPath,
                height: 24,
                width: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dotWidget() {
    return Column(
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          height: 2,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        color: Color(0xff09596F),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      widget.scaffoldKey.currentState?.openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context, getCustomRoute(child: NotificationScreen()));
                    },
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, getCustomRoute(child: PickUpDetailsPage()));

                },
                child: LocationContainerWidget(
                  iconColor: Color(0xff00C060),
                  icon: Icons.location_on,
                  label: "From",
                  name: "Kunal Pawar",
                  phone: "+91 89455 53123",
                  address: "Gopi Tank Marg, Mahim West, Shivaji Park...",
                  actionIconPath: Assets.locationsuffix1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: SizedBox(
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      dotWidget(),
                      dotWidget(),
                      dotWidget(),
                      dotWidget(),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, getCustomRoute(child: DropDetails()));
                },
                child: LocationContainerWidget(
                  iconColor: Color(0xffEB0404),
                  icon: Icons.location_on,
                  label: "To",
                  name: "Manoj Dalavi",
                  phone: "+91 89455 53123",
                  address:
                      "Worli Shivaji Nagar, Worli Mumbai, Maharashtra 400030",
                  actionIconPath:
                      Assets.locationsuffix2, // Replace with your actual path
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
