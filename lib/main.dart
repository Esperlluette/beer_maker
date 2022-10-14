import 'dart:async';

import 'package:beer_maker/pages/beerListing.dart';
import 'package:beer_maker/resources/object/appcolor.dart';
import 'package:beer_maker/pages/guide.dart';
import 'package:beer_maker/pages/outils.dart';
import 'package:beer_maker/resources/stringsfr.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringsFR.apptitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: StringsFR.apptitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(AppColor.appcolor),
        child: const Image(
          image: AssetImage('images/bmlogo.png'),
          height: 100,
          width: 100,
        ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final TextStyle _style = const TextStyle(
    color: Color(AppColor.appcolor),
    fontWeight: FontWeight.bold,
    fontFamily: 'RobotoMono',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                /**
                 * partie droite de l'écran
                 */
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Guide()))
                  },
                  child: Card(
                      child: Container(
                          alignment: Alignment.center,
                          width: 200,
                          height: 50,
                          child: Text(
                            StringsFR.guide,
                            style: _style,
                          ))),
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Outils()))
                  },
                  child: Card(
                      child: Container(
                          alignment: Alignment.center,
                          width: 200,
                          height: 50,
                          child: Text(
                            StringsFR.outils,
                            style: _style,
                          ))),
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Beerlist()))
                  },
                  child: Card(
                      child: Container(
                          alignment: Alignment.center,
                          width: 200,
                          height: 50,
                          child: Text(
                            StringsFR.beerlist,
                            style: _style,
                          ))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
