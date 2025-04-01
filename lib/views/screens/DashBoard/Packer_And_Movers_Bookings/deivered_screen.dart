import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logistics/services/route_helper.dart';
import 'package:logistics/services/theme.dart';
import 'package:logistics/views/screens/DashBoard/Packer_And_Movers_Bookings/rating_dailogue.dart';
import 'package:logistics/views/screens/DashBoard/dashboard.dart';
import '../../../../generated/assets.dart';

class DeiveredScreen extends StatefulWidget {
  const DeiveredScreen({super.key});

  @override
  State<DeiveredScreen> createState() => _DeiveredScreenState();
}

class _DeiveredScreenState extends State<DeiveredScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        setState(() {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return RatingDialog(
                onTap: () {
                  Navigator.push(context, getCustomRoute(child: Dashboard()));
                },
              );
            },
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset(Assets.imagesDelivered)),
            Text(
              "Delivered !",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(color: primaryColor),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
