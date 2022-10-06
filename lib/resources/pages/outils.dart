import 'package:beer_maker/resources/stringsfr.dart';
import 'package:beer_maker/extensions/color_extension.dart';
import 'package:beer_maker/resources/utils/recette.dart';
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
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));

  double _volume = 0;
  double _degre = 0;
  double _moyenne = 0;

  double mcu = 0;
  double ebc = 0;
  double srm = 0;

  double qMalt = 0;
  double qEauBrassage = 0;
  double qEauRincage = 0;
  double qHoublonAmer = 0;
  double qHoublonArome = 0;
  double levure = 0;
  String hexColor = "000000";

  void calculs() {
    // (Volume de bière désiré en L * degré d’alcool recherché ) / 20 = Malt en k
    // Quantité de malt en kg * 2,8 = Quantité d’eau de brassage en
    // (Volume de bière désiré en L *1,25) - (Eau de brassage en L *0,7 ) = Eau de rinçage en L
    // MCU = [4,23 * Σ ( EBC(grain) * poidsEnKg (grain) ) ] / le volume de bière désiré en L
    // EBC = 2,9396 * (MCU^0,6859)
    // SRM = 0,508 * EBC
    // Houblon amérisant = Volume de bière à houblonner en L * 3g
    // Houblon aromatique = Volume de bière à houblonner en L * 1g
    // Volume de bière désiré en L / 2 = quantité de levure en g

    qMalt = (_volume * _degre) / 20;
    qEauBrassage = qMalt * 2.8;
    qEauRincage = (_volume * 1.25) - (qEauBrassage * 0.7);
    qHoublonAmer = _volume * 3;
    qHoublonArome = _volume;
    levure = _volume / 2;

    mcu = 4.23 * _moyenne * qMalt / _volume;
    srm = 0.508 * _moyenne;

    hexColor = Recette.srmToRGB(srm);

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFf05e47),
          title: const Text(StringsFR.titleUtils),
        ),
        body: Column(children: [
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
                      }),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        calculs();

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text(StringsFR.processing)),
                        );
                      }
                    },
                    child: const Text(StringsFR.submit),
                  ),
                ]),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(StringsFR.pVolume[0] +
                      _volume.floor().toString() +
                      StringsFR.pVolume[1]),
                  Text("${StringsFR.qMalt}$qMalt Kg"),
                  Text("${StringsFR.eauDeBrasse}${qEauBrassage.floor()} L"),
                  Text("${StringsFR.eauDeRincage}${qEauRincage.floor()} L"),
                  Text("${StringsFR.qHoublonAmer}${qHoublonAmer.floor()} g"),
                  Text("${StringsFR.qHoublonArome}${qHoublonArome.floor()} g"),
                  Text("${StringsFR.levures}${levure.floor()} g")
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  StringsFR.titleColo,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                        Text(StringsFR.mcu + mcu.floor().toString()),
                        Text(StringsFR.ebc + _moyenne.floor().toString()),
                        Text(StringsFR.srm + srm.floor().toString())
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 150,
                    height: 50,
                    color: hexColor.toColor(),
                    child: Text(hexColor),
                  )
                ],
              )
            ],
          )
        ]));
  }
}
