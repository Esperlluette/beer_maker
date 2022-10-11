import 'dart:developer';

import 'package:beer_maker/resources/stringsfr.dart';
import 'package:flutter/material.dart';

class Guide extends StatefulWidget {
  const Guide({super.key});

  @override
  State<Guide> createState() => GuideState();
}

class GuideState extends State<Guide> {
  // String _titleLabel = "";
  // String _body = "";

  final int _counter = 8;
  int _index = 0;

  // void incrementCounter() {
  //   if (_counter < 7) {
  //     _counter++;
  //     setState(() {});
  //   }
  // }

  // void decrementCounter() {
  //   if (_counter > 0) {
  //     _counter--;
  //     setState(() {});
  //   }
  // }

  // void setStatement() {
  //   _titleLabel = StringsFR.guidSteps[_counter][0];
  //   _body = StringsFR.guidSteps[_counter][1];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFf05e47),
        title: const Text(StringsFR.titleGuid),
      ),
      body: Center(
        child: buildStepper(),
      ),
    );
  }

  List<Step> stepBuilder() {
    List<Step> list = [];

    for (var i = 0; i < _counter; i++) {
      list.add(Step(
          title: Text(StringsFR.guidSteps[i][0]),
          content: Container(
            alignment: Alignment.centerLeft,
            child: Text(StringsFR.guidSteps[i][1]),
          )));
    }
    return list;
  }

  Widget buildStepper() {
    final steps = stepBuilder();
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
        if (_index < 7) {
          log(_index.toString());
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
      steps: steps,
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   setStatement();
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: const Color(0xFFf05e47),
  //       title: const Text(StringsFR.titleGuid),
  //     ),
  //     body: Center(
  //       child: Column(
  //         children: [
  //           Text(style: const TextStyle(fontSize: 20), _titleLabel),
  //           Text(_body),
  //         ],
  //       ),
  //     ),
  //     bottomNavigationBar: BottomNavigationBar(
  //       items: const [
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.skip_previous_rounded),
  //             label: StringsFR.previousStep),
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.skip_next),
  //             label: StringsFR.nextStep)
  //       ],
  //       onTap: (value) {
  //         if (value == 0) {
  //           decrementCounter();

  //         } else {
  //           incrementCounter();
  //         }
  //       },
  //     ),
  //   );
  // }
}
