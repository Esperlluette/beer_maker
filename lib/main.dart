import 'dart:async';

import 'package:beer_maker/resources/pages/guide.dart';
import 'package:beer_maker/resources/pages/outils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Game toy'),
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
        color: Colors.amber,
        child: FlutterLogo(size: MediaQuery.of(context).size.height));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beer Maker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Guide()))
                    },
                child: const Text("guide")),
            TextButton(
                onPressed: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Outils()))
                    },
                child: const Text("Outils"))
          ],
        ),
      ),
    );
  }
}
