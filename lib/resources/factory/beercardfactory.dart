import 'dart:developer';

import 'package:beer_maker/resources/stringsfr.dart';
import 'package:flutter/material.dart';

class BeerCardFactrory {
  static Column factory(beers) {
    if (beers != null) {
      log(beers.toString());
      Column col = Column(
        children: [
          for (var beer in beers) ...{
            GestureDetector(
              onTap: null,
                child: SizedBox(
              width: 300,
              height: 50,
              child: Text(beer["nom"].toString()),
            ))
          }
        ],
      );
      return col;
    } else {
      return Column(
        children: const [Text(StringsFR.fetchException)],
      );
    }
  }
}
