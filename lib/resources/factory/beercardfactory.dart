import 'dart:developer';

import 'package:beer_maker/resources/stringsfr.dart';
import 'package:flutter/material.dart';

class BeerCardFactrory {
  static Column factory(map) {
    if (map != null) {
      log(map.toString());
      Column col = Column(
        children: [
          for (var beer in map) ...{
            const Card(
              child: SizedBox(
                width: 300,
                height: 100,
                child: Text("data"),
              ),
            )
          }
        ],
      );
      return col;
    }else {
      return Column(
        children: const [
          Text(StringsFR.fetchException)
        ],
      );
    }
  }
}
