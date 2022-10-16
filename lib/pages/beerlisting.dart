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
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  Future<Map<String, dynamic>> fetchBeersList() async {
    final response = await http.get(Uri.parse(
        'https://s3-4013.nuage-peda.fr/beer_maker/public/api/beers?page=1'));

    if (response.statusCode == 200) {
      log(response.body[0].toString());
      return convert.jsonDecode(response.body);
    } else {
      throw Exception(StringsFR.fetchException);
    }
  }

  init() async{
    Map<String, dynamic> map = await fetchBeersList();
    return map;
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> map = init();
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
            RefreshIndicator(
                key: _refreshIndicatorKey,
                color: Colors.white,
                backgroundColor: Colors.blue,
                strokeWidth: 4.0,
                onRefresh: _refresh,
                child: ListView.builder(
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        log(fetchBeersList().toString());
                      },
                      title: Text('Item $index'),
                    );
                  },
                ))
        //   ],
        // ),
        );
    // )
    // );
  }

  Future<void> _refresh() async {
    return Future<void>.delayed(const Duration(seconds: 3));
  }
}
