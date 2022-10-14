import 'package:beer_maker/resources/object/appcolor.dart';
import 'package:beer_maker/resources/stringsfr.dart';
import 'package:beer_maker/extensions/color_extension.dart';
import 'package:beer_maker/resources/object/recette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Outils extends StatefulWidget {
  const Outils({super.key});

  @override
  State<Outils> createState() => _OutilsState();
}

class _OutilsState extends State<Outils> {
  final _formKey = GlobalKey<FormState>();

  TextInputFormatter formatter =
      FilteringTextInputFormatter.allow(RegExp(r'[1-9]'));

  double _volume = 0;
  double _degre = 0;
  double _moyenne = 0;

  Recette beer = Recette(0, 0, 0);

  bool setVisible = false;

  save() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(AppColor.appcolor),
          title: const Text(StringsFR.titleUtils),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(children: [
                      const Text(StringsFR.volume + StringsFR.volumeHidden),
                      TextFormField(
                          inputFormatters: [formatter],
                          validator: (valeur) {
                            if (valeur == null || valeur.isEmpty) {
                              return StringsFR.notice;
                            } else {
                              _volume = double.parse(valeur);
                            }
                            return null;
                          }),
                      const Text(StringsFR.degre),
                      TextFormField(
                          inputFormatters: [formatter],
                          validator: (valeur) {
                            if (valeur == null || valeur.isEmpty) {
                              return StringsFR.notice;
                            } else {
                              _degre = double.parse(valeur);
                            }
                            return null;
                          }),
                      const Text(StringsFR.moyenne),
                      TextFormField(
                          inputFormatters: [formatter],
                          validator: (valeur) {
                            if (valeur == null || valeur.isEmpty) {
                              return StringsFR.notice;
                            } else {
                              _moyenne = double.parse(valeur);
                            }
                            return null;
                          }),
                      ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Color(0xFFf05e47)),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (_degre == 0 || _moyenne == 0 || _volume == 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Erreur dans les saisies ")));
                            } else {
                              setVisible = true;
                              beer = Recette(_volume, _degre, _moyenne);

                              setState(() {});
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(StringsFR.processing)),
                              );
                            }
                          }
                        },
                        child: const Text(StringsFR.submit),
                      ),
                    ]),
                  ),
                  Visibility(
                    visible: setVisible,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(StringsFR.pVolume[0] +
                            _volume.floor().toString() +
                            StringsFR.pVolume[1]),
                        Text("${StringsFR.qMalt}${beer.getMalt().floor()} Kg"),
                        Text(
                            "${StringsFR.eauDeBrasse}${beer.getBrassage().floor()} L"),
                        Text(
                            "${StringsFR.eauDeRincage}${beer.getRincage().floor()} L"),
                        Text(
                            "${StringsFR.qHoublonAmer}${beer.getHoublonAmer().floor()} g"),
                        Text(
                            "${StringsFR.qHoublonArome}${beer.getHoublonArome().floor()} g"),
                        Text(
                            "${StringsFR.levures}${beer.getLevure().floor()} g")
                      ],
                    ),
                  )
                ],
              ),
              Visibility(
                  visible: setVisible,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(
                            StringsFR.titleColo,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      StringsFR.mcu + beer.getMCU().toString()),
                                  Text(StringsFR.ebc + _moyenne.toString()),
                                  Text(StringsFR.srm + beer.getSRM().toString())
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 150,
                              height: 50,
                              color: beer.getHEX().toColor(),
                              child: Text(beer.getHEX()),
                            )
                          ],
                        )
                      ])),
              Visibility(
                  visible: setVisible,
                  child: TextButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Color(0xFFf05e47)),
                        padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                            EdgeInsets.all(10))),
                    child: const Text(
                      "Enregistrer",
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ))
            ],
          ),
        ));
  }
}
