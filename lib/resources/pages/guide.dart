import 'dart:developer';

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
    if (_counter >= 0) {
      _counter--;
      setState(() {});
    }
  }

  void setStatement() {
    switch (_counter) {
      case 0:
        _titleLabel = StringsFR.guideEtapePretable[0];
        _body = StringsFR.guideEtapePretable[1];
        break;
      case 1:
        _titleLabel = StringsFR.guideEtape1[0];
        _body = StringsFR.guideEtape1[1];
        break;
      case 2:
        _titleLabel = StringsFR.guideEtape2[0];
        _body = StringsFR.guideEtape2[1];
        break;
      case 3:
        _titleLabel = StringsFR.guideEtape3[0];
        _body = StringsFR.guideEtape3[1];
        break;
      case 4:
        _titleLabel = StringsFR.guideEtape4[0];
        _body = StringsFR.guideEtape4[1];
        break;
    }
    log(_counter.toString());
  }

  @override
  Widget build(BuildContext context) {
    setStatement();
    return Scaffold(
      appBar: AppBar(title: const Text(StringsFR.TitreGuide)),
      body: Center(
        child: Column(
          children: [
            Text(style: const TextStyle(fontSize: 20), _titleLabel),
            Text(_body),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () => {decrementCounter()},
                    icon: const Icon(Icons.skip_previous_rounded)),
                IconButton(
                    onPressed: () => {incrementCounter()},
                    icon: const Icon(Icons.skip_next_rounded))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
