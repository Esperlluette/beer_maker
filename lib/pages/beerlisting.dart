import 'dart:developer';

import 'package:beer_maker/resources/factory/beercardfactory.dart';
import 'package:beer_maker/resources/stringsfr.dart';
import 'package:beer_maker/resources/object/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class Beerlist extends StatefulWidget {
  const Beerlist({super.key});

  @override
  State<Beerlist> createState() => BeerlistState();
}

class BeerlistState extends State<Beerlist> {

  Future<Map<String, dynamic>> fetchBeersList() async{
    final response = await http.get(Uri.parse(
        'https://s3-4013.nuage-peda.fr/beer_maker/public/api/beers?page=1'));

    if (response.statusCode == 200){
      log(response.body.toString());
     return convert.jsonDecode(response.body);
    }else {
      throw Exception(StringsFR.fetchException);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringsFR.beerlist),
        backgroundColor: const Color(AppColor.appcolor),
      ),
      body: BeerCardFactrory.factory(fetchBeersList().then((value) => Iterable<dynamic>)),
    );
  }
}
