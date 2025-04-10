// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:logistics/services/route_helper.dart';
// import 'package:logistics/services/theme.dart';
// import '../../../../../generated/assets.dart';
// import '../../Location_Selection/drop_details.dart';
// import '../../Location_Selection/pick_up_details.dart';
// // import '../notification_screen.dart';
//
// class TopSection extends StatefulWidget {
//   const TopSection({super.key, required this.scaffoldKey});
//   final GlobalKey<ScaffoldState>
//       scaffoldKey; // Add scaffoldKey to the constructor
//
//   @override
//   State<TopSection> createState() => _TopSectionState();
// }
//
// class _TopSectionState extends State<TopSection> {
//   Widget LocationContainerWidget({
//     required Color iconColor,
//     required IconData icon,
//     required String label,
//     required String name,
//     required String phone,
//     required String address,
//     required String actionIconPath,
//   }) {
//     return Material(
//       elevation: 4,
//       borderRadius: BorderRadius.circular(16),
//       child: Container(
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Row(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: iconColor,
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(
//                 icon,
//                 color: Colors.white,
//                 size: 20,
//               ),
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   RichText(
//                     text: TextSpan(
//                       style: const TextStyle(color: Colors.black),
//                       children: [
//                         TextSpan(
//                           text: '$label ',
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         TextSpan(
//                           text: '$name . $phone',
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     address,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(fontSize: 14),
//                   ),
//                 ],
//               ),
//             ),
//
//             const SizedBox(width: 8),
//
//             CircleAvatar(
//               backgroundColor: Color(0xffF4F4F4),
//               child: SvgPicture.asset(
//                 actionIconPath,
//                 height: 24,
//                 width: 24,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget dotWidget() {
//     return Column(
//       children: [
//         Container(
//           width: 6,
//           height: 6,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             shape: BoxShape.circle,
//           ),
//         ),
//         SizedBox(
//           height: 2,
//         ),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: MediaQuery.of(context).size.height * 0.40,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
//         color: primaryColor,
//       ),
//       child: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 16.0, right: 16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     onPressed: () {
//                       widget.scaffoldKey.currentState?.openDrawer();
//                     },
//                     icon: Icon(
//                       Icons.menu,
//                       color: Colors.white,
//                       size: 30,
//                     ),
//                   ),
//                     // IconButton(
//                     //   onPressed: () {
//                     //     Navigator.push(
//                     //         context, getCustomRoute(child: NotificationScreen()));
//                     //   },
//                     //   icon: Icon(
//                     //     Icons.notifications,
//                     //     color: Colors.white,
//                     //     size: 30,
//                     //   ),
//                     // ),
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context, getCustomRoute(child: PickUpDetailsPage()));
//                 },
//                 child: LocationContainerWidget(
//                   iconColor: Color(0xff00C060),
//                   icon: Icons.location_on,
//                   label: "From",
//                   name: "Kunal Pawar",
//                   phone: "+91 89455 53123",
//                   address: "Gopi Tank Marg, Mahim West, Shivaji Park...",
//                   actionIconPath: Assets.imagesLocationsuffix,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 25.0),
//                 child: SizedBox(
//                   height: 60,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       dotWidget(),
//                       dotWidget(),
//                       dotWidget(),
//                       dotWidget(),
//                     ],
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(context, getCustomRoute(child: DropDetails()));
//                 },
//                 child: LocationContainerWidget(
//                   iconColor: Color(0xffEB0404),
//                   icon: Icons.location_on,
//                   label: "To",
//                   name: "Manoj Dalavi",
//                   phone: "+91 89455 53123",
//                   address:
//                       "Worli Shivaji Nagar, Worli Mumbai, Maharashtra 400030",
//                   actionIconPath:
//                       Assets.imagesLocationsuffix2,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logistics/views/screens/DashBoard/Home_Screen/Components/custom_slider.dart';

import '../../../../../controllers/auth_controller.dart';
import '../../../../../generated/assets.dart';

class TopSection extends StatefulWidget {
  const TopSection({super.key});

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0,top: 16.0,bottom: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey.shade200,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        Assets.imagesUser2,
                        height: 100, // slightly smaller to fit nicely with padding
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),


                SizedBox(width: 15,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hii ${Get.find<AuthController>().userModel!.name!}",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      "Have a Good Day",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                        color: Color(0xff252525),
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 20,),
            CustomSliderWidget(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,top: 16.0,bottom: 8.0),
              child: Text(
                "Services We Offer",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
