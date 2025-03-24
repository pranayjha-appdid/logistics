import 'package:flutter/material.dart';
import 'package:logistics/views/base/common_button.dart';
import 'package:logistics/views/screens/DashBoard/Home_Screen/home_screen.dart';
import 'package:logistics/views/screens/DashBoard/dashboard.dart';
import 'moving_details.dart';

class StepperExample extends StatefulWidget {
  @override
  _StepperExampleState createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  int _currentStep = 0;

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
          Expanded(
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.white,
                colorScheme: Theme.of(context).colorScheme.copyWith(
                      secondary: Colors.white,
                      primary: Theme.of(context).primaryColor,
                    ),
              ),
              child: Stepper(
                currentStep: _currentStep,
                type: StepperType.horizontal,
                onStepTapped: (step) {
                  if (step < _currentStep) {
                    setState(() => _currentStep = step);
                  }
                },
                controlsBuilder: (context, details) {
                  // Remove default next/back button
                  return SizedBox.shrink();
                },
                steps: getStep(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: CustomButton(
                onTap: () {
                  if (_currentStep < 2) {
                    setState(() {
                      _currentStep += 1;
                    });
                  } else {
                    // Navigate to another screen when last step is done
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Dashboard(), // Replace with your next screen
                      ),
                    );
                  }
                },
                title: _currentStep < 2 ? "Next" : "Continue",
              ),
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
