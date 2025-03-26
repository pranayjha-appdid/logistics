import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:logistics/views/base/common_button.dart';
import 'package:logistics/views/screens/DashBoard/Home_Screen/Packers_And_Movers/done.dart';
import 'package:logistics/views/screens/DashBoard/Home_Screen/home_screen.dart';
import 'package:logistics/views/screens/DashBoard/dashboard.dart';
import 'moving_details.dart';

class StepperExample extends StatefulWidget {
  @override
  _StepperExampleState createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  int activeStep = 0;

  final List<String> stepTitles = ['Moving Details', 'Add Items', 'Review'];

  Widget getStepContent(int step) {
    switch (step) {
      case 0:
        return MovingDetails();
      case 1:
        return Center(
            child: Text("Add Items to Move", style: TextStyle(fontSize: 20)));
      case 2:
        return Center(
            child: Text("Review & Confirm", style: TextStyle(fontSize: 20)));
      default:
        return Center(
            child: Text("Completed!", style: TextStyle(fontSize: 20)));
    }
  }

  int _currentStep = 0;

  void nextStep() {
    if (activeStep < stepTitles.length - 1) {
      setState(() {
        activeStep++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Done()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, size: 30),
          color: Colors.black,
        ),
        title: Text("Packers & Movers"),
      ),
      body: Column(
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
              finishedLineColor: Color(0xFF09596F),
            ),
            stepRadius: 20,
            activeStepBorderColor: Color(0xFF09596F),
            activeStepBackgroundColor: Colors.white,
            activeStepTextColor: Color(0xFF09596F),
            finishedStepBackgroundColor: Colors.transparent,
            finishedStepBorderColor: Color(0xFF09596F),
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
                            ? Color(0xFF09596F)
                            : Colors.grey),
                  ],
                ),
                title: stepTitles[index],
              ),
            ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: getStepContent(activeStep),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              onTap: nextStep,
              title: activeStep == stepTitles.length - 1 ? 'Done' : 'Next',
            ),
          )
        ],
      ),
    );
  }

  List<Step> getStep() => [
    Step(
      title: const Text(""),
      content: MovingDetails(),
      isActive: _currentStep >= 0,
    ),
    Step(
      title: const Text(''),
      content: Container(), // Add Items screen
      isActive: _currentStep >= 1,
    ),
    Step(
      title: const Text(''),
      content: Center(child: Text("Hello World")), // Review screen
      isActive: _currentStep >= 2,
    ),
  ];
}
