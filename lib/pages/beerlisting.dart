import 'package:beer_maker/resources/stringsfr.dart';
import 'package:beer_maker/resources/object/appcolor.dart';
import 'package:flutter/material.dart';

class Beerlist extends StatefulWidget {
  const Beerlist({super.key});

  @override
  State<Beerlist> createState() => BeerlistState();
}

class BeerlistState extends State<Beerlist> {
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringsFR.beerlist),
        backgroundColor: const Color(AppColor.appcolor),
      ),
    );
  }
}
