import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logistics/services/theme.dart';
import 'package:logistics/views/base/common_button.dart';
import 'package:logistics/views/screens/DashBoard/Home_Screen/Packers_And_Movers/review_packers_and_movers.dart';
import '../../../../../controllers/location_controller.dart';
import 'add_items.dart';
import 'booking_placed_page.dart';
import 'moving_details.dart';

class PackersAndMoverPage extends StatefulWidget {
  const PackersAndMoverPage({super.key});

  @override
  State<PackersAndMoverPage> createState() => _PackersAndMoverPageState();
}

class _PackersAndMoverPageState extends State<PackersAndMoverPage> {
  int activeStep = 0;

  final List<String> stepTitles = ['Moving Details', 'Add Items', 'Review'];

  @override
  void dispose() {
    Get.find<LocationController>().pickupLocations.clear();
    Get.find<LocationController>().dropLocations.clear();
    Get.find<LocationController>().sendermobileno.clear();
    Get.find<LocationController>().receivername.clear();
    Get.find<LocationController>().sendername.clear();
    Get.find<LocationController>().receivermobileno.clear();


    Get.find<LocationController>().pickupLocations.add(LocationFormControllers(type: "pickup"));
    Get.find<LocationController>().dropLocations.add(LocationFormControllers(type: "drop"));

    Get.find<LocationController>().update();
    super.dispose();
  }


  Widget getStepContent(int step) {
    switch (step) {
      case 0:
        return MovingDetails();
      case 1:
        return AddItems();
      case 2:
        return ReviewPackersAndMovers();
      default:
        return Center(
            child: Text("Completed!", style: TextStyle(fontSize: 20)));
    }
  }

  void nextStep() {
    if (activeStep < stepTitles.length - 1) {
      setState(() {
        activeStep++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BookingPlacedPage(ispakerandmover: true,)),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, size: 30),
          color: Colors.black,
        ),
        title: Text("Packers & Movers"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            EasyStepper(
              disableScroll: true,
              finishedStepTextColor: Colors.black,
              activeStep: activeStep,
              onStepReached: (index) {
                if (index <= activeStep) {
                  setState(() {
                    activeStep = index;
                  });
                }
              },
              lineStyle: LineStyle(
                lineLength: 90,
                lineType: LineType.dotted,
                defaultLineColor: Colors.grey,
                finishedLineColor: primaryColor,
              ),
              stepRadius: 20,
              activeStepBorderColor: primaryColor,
              activeStepBackgroundColor: Colors.white,
              activeStepTextColor: primaryColor,
              finishedStepBackgroundColor: Colors.transparent,
              finishedStepBorderColor: primaryColor,
              finishedStepBorderType: BorderType.normal,
              borderThickness: 3,
              showStepBorder: true,
              showLoadingAnimation: false,
              showTitle: true,
              titlesAreLargerThanSteps: true,
              steps: List.generate(
                stepTitles.length,
                (index) => EasyStep(
                  customStep: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.circle,
                          size: 24,
                          color: index <= activeStep
                              ? primaryColor
                              : Colors.grey),
                    ],
                  ),
                  title: stepTitles[index],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, bottom: 16.0, right: 16.0),
              child: getStepContent(activeStep),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: activeStep != 1
                ? CustomButton(
                    onTap: nextStep,
                    title:
                        activeStep == stepTitles.length - 1 ? 'Book ' : 'Next',
                  )
                : Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 600,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30))),
                                  child: Column(
                                    children: [
                                      Container(
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: primaryColor,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(25),
                                                  topRight:
                                                      Radius.circular(25))),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Selected Items",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall
                                                      ?.copyWith(
                                                          fontSize: 24,
                                                          color: Colors.white70,
                                                          fontWeight:
                                                              FontWeight.w100),
                                                ),
                                                CircleAvatar(
                                                    child: Icon(Icons.close))
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xff000000),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .center,
                                crossAxisAlignment: CrossAxisAlignment
                                    .start,
                                children: [
                                  Text(
                                    "4 Items added",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(
                                            color: Colors.grey[500],
                                            fontSize: 11),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "View All",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(Icons.arrow_upward,
                                          color: Colors.white, size: 10)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: nextStep,
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color:  primaryColor,
                              borderRadius: BorderRadius.circular(8),
                              border:
                                  Border.all(color:  primaryColor),
                            ),
                            alignment: Alignment.center,
                            child: Text("Confirm Items",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                        color: Colors.white, fontSize: 15)),
                          ),
                        ),
                      ),
                    ],
                  ),
          )
        ],
      ),
    );
  }
}
