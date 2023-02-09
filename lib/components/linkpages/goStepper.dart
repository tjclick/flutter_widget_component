import 'package:flutter/material.dart';

class goStepper extends StatelessWidget {
  const goStepper({super.key});

  static const String _title = 'Stepper';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: goStepperWidget(),
        ),
      ),
    );
  }
}

class goStepperWidget extends StatefulWidget {
  const goStepperWidget({super.key});

  @override
  State<goStepperWidget> createState() => _goStepperWidgetState();
}

class _goStepperWidgetState extends State<goStepperWidget> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index <= 0) {
          setState(() {
            _index += 1;
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: <Step>[
        Step(
          title: const Text('Step 1 title'),
          content: Container(
              alignment: Alignment.centerLeft,
              child: const Text('Content for Step 1')),
        ),
        const Step(
          title: Text('Step 2 title'),
          content: Text('Content for Step 2'),
        ),
      ],
    );
  }
}
