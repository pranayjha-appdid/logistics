import 'dart:async';
import 'package:flutter/material.dart';
import 'package:logistics/services/route_helper.dart';
import 'package:logistics/views/base/common_button.dart';
import 'package:logistics/views/screens/DashBoard/dashboard.dart';

import '../../../../../generated/assets.dart';
import '../../Packer_And_Movers_Bookings/packer_and_mover_bookings.dart';

class BookingPlacedPage extends StatefulWidget {
  final bool? ispakerandmover; // Keep it nullable

  const BookingPlacedPage({Key? key, this.ispakerandmover}) : super(key: key);

  @override
  State<BookingPlacedPage> createState() => _BookingPlacedPageState();
}

class _BookingPlacedPageState extends State<BookingPlacedPage> {
  bool _showSuccess = true;
  late Timer _hideImageTimer;
  late Timer _countdownTimer;
  late Timer _navigationTimer;

  int _remainingTime = 15 * 60; // 15 minutes in seconds
  double _progress = 1.0; // Start full

  @override
  void initState() {
    super.initState();

    _hideImageTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _showSuccess = false;
      });

      _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_remainingTime > 0) {
          setState(() {
            _remainingTime--;
            _progress = _remainingTime / (15 * 60); // Update progress
          });
        } else {
          timer.cancel();
        }
      });
      _navigationTimer = Timer(const Duration(minutes: 15), () {
        if (mounted) {
          _navigateToNextScreen();
        }
      });
    });
  }

  void _navigateToNextScreen() {
    Navigator.pushReplacement(
      context,
      getCustomRoute(child: PackerAndMoverBookings()),
    );
  }

  @override
  void dispose() {
    _hideImageTimer.cancel();
    _countdownTimer.cancel();
    _navigationTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (_showSuccess)
                Image.asset(
                  Assets.imagesSucessGif,
                  width: 200,
                  height: 200,
                ),
              if (!_showSuccess)
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: CircularProgressIndicator(
                        value: _progress,
                        strokeWidth: 10,
                        backgroundColor: Colors.white, // Initial color
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xff09596F)), // Changes to white
                      ),
                    ),
                    Text(
                      "${(_remainingTime ~/ 60).toString().padLeft(2, '0')}:${(_remainingTime % 60).toString().padLeft(2, '0')}",
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              SizedBox(
                height: 25,
              ),
              Text(
                _showSuccess ? "Booking Placed!" : "Wait 15 Min",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Your booking has been placed. Our team will contact you soon.",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: 18.0, color: Colors.black87),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!_showSuccess)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton(
                onTap: () {
                  widget.ispakerandmover != null?
                  Navigator.push(
                      context, getCustomRoute(child: PackerAndMoverBookings())):
                  Navigator.pushAndRemoveUntil(
                    context,
                    getCustomRoute(
                        child: Dashboard(
                      initialIndex: 1,
                    )),
                    (route) => false,
                  );
                },
                title: "Okay",
              ),
            ),
        ],
      ),
    );
  }
}
