import 'package:beer_maker/resources/stringsfr.dart';
import 'package:flutter/material.dart';

class Guide extends StatefulWidget {
  const Guide({super.key});

  @override
  State<Guide> createState() => GuideState();
}

class GuideState extends State<Guide> {
  String _titleLabel = "";
  String _body = "";

  int _counter = 0;

  void incrementCounter() {
    if (_counter < 7) {
      _counter++;
      setState(() {});
    }
  }

  void decrementCounter() {
    if (_counter > 0) {
      _counter--;
      setState(() {});
    }
  }

  void setStatement() {
    _titleLabel = StringsFR.guidSteps[_counter][0];
    _body = StringsFR.guidSteps[_counter][1];
  }

  @override
  Widget build(BuildContext context) {
    setStatement();
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringsFR.titleGuid),
      ),
      body: Center(
        child: Column(
          children: [
            Text(style: const TextStyle(fontSize: 20), _titleLabel),
            Text(_body),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.skip_previous_rounded),
              label: StringsFR.previousStep),
          BottomNavigationBarItem(
              icon: Icon(Icons.skip_next),
              label: StringsFR.nextStep)
        ],
        onTap: (value) {
          if (value == 0) {
            decrementCounter();

          } else {
            incrementCounter();
          }
        },
      ),
    );
  }
}
