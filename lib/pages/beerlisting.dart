import 'dart:developer';
import 'dart:io';

import 'package:beer_maker/main.dart';
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
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  late var beers;
  bool fetchBeers = false;
  late Widget _body;

  @override
  void initState() {
    super.initState();
    _body = const CircularProgressIndicator(
      strokeWidth: 10,
    );
  }

  Future<void> fetchBeersList() async {
    if (fetchBeers) return;
    final response = await http.get(Uri.parse(
        'https://s3-4013.nuage-peda.fr/beer_maker/public/api/beers?page=1'));

    if (response.statusCode == 200) {
      // lorsque je fetch la liste de bière je me retouve avec une liste qui contient une autre liste qui elle contient mes bières cf api beerMaker
      var tempbeers = convert.jsonDecode(response.body);
      fetchBeers = true;
      beers = tempbeers["hydra:member"];

      setState(() {
        _body = ListView.separated(
            padding: const EdgeInsets.all(10),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: beers.length,
            itemBuilder: (BuildContext context, int index) =>
                const Text('data'));
      });
    } else {
      log(StringsFR.fetchException);
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchBeersList();
    return Scaffold(
        appBar: AppBar(
          title: const Text(StringsFR.beerlist),
          backgroundColor: const Color(AppColor.appcolor),
        ),
        body:
            // Container(
            // height: 200,
            // width: 100,
            // padding: const EdgeInsets.all(10),
            // margin: const EdgeInsets.all(10),
            // child:
            //   Column(
            // children: [
            Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Liste des bières publiques ',
                style: TextStyle(
                    color: Color(AppColor.appcolor),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          BeerCardFactrory.factory(beers),
          const Spacer(
            flex: 10,
          )
          // Expanded(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Expanded(
          //           child: SizedBox(
          //         child: _body,
          //       ))
          //     ],
          //   ),
          //   //   ],
          //   // ),
          // )
        ]));
    // )
    // );
  }

  void printBeers() {
    log(beers.length.toString());
    for (var beer in beers) {
      log(beer.toString());
    }
  }

  Future<void> _refresh() async {
    return Future<void>.delayed(const Duration(seconds: 3));
  }
}
