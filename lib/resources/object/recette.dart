class Recette {
  double _volume = 0;
  double _degre = 0;
  double _moyenne = 0;

  double malt = 0;
  double brassage = 0;
  double rincage = 0;
  double houblonAmer = 0;
  double houblonArome = 0;
  double levure = 0;

  double mcu = 0;
  double ebc = 0;
  double srm = 0;

  String hexColor = "000000";

  Recette(double volume, double degre, double moyenne) {
    _volume = volume;
    _degre = degre;
    _moyenne = moyenne;

    malt = (_volume * _degre) / 20;
    rincage = malt * 2.8;
    rincage = (_volume * 1.25) - (brassage * 0.7);
    houblonAmer = _volume * 3;
    houblonArome = _volume;
    levure = _volume / 2;

    mcu = 4.23 * _moyenne * malt / _volume;
    srm = 0.508 * _moyenne;

    hexColor = Recette.srmToRGB(srm);
  }

  double getMalt() {
    return malt;
  }

  double getBrassage() {
    return brassage;
  }

  double getRincage() {
    return rincage;
  }

  double getHoublonAmer() {
    return houblonAmer;
  }

  double getHoublonArome() {
    return houblonArome;
  }

  double getLevure() {
    return levure;
  }

  double getMCU() {
    return mcu;
  }

  double getEBC() {
    return ebc;
  }

  double getSRM() {
    return srm;
  }
  
  String getHEX(){
    return hexColor;
  }

  double getVolume() {
    return _volume;
  }

  double getDegre() {
    return _degre;
  }

  double getMoyenne() {
    return _moyenne;
  }

  static String srmToRGB(double srm) {
// Returns an RGB value based on SRM
    double r = 0;
    double g = 0;
    double b = 0;
    if (srm >= 0 && srm <= 1) {
      r = 240;
      g = 239;
      b = 181;
    } else if (srm > 1 && srm <= 2) {
      r = 233;
      g = 215;
      b = 108;
    } else if (srm > 2) {
// Set red decimal
      if (srm < 70.6843) {
        r = 243.8327 - (6.4040 * srm) + (0.0453 * srm * srm);
      } else {
        r = 17.5014;
      }
// Set green decimal
      if (srm < 35.0674) {
        g = 230.929 - 12.484 * srm + 0.178 * srm * srm;
      } else {
        g = 12.0382;
      }
// Set blue decimal
      if (srm < 4) {
        b = -54 * srm + 216;
      } else if (srm >= 4 && srm < 7) {
        b = 0;
      } else if (srm >= 7 && srm < 9) {
        b = 13 * srm - 91;
      } else if (srm >= 9 && srm < 13) {
        b = 2 * srm + 8;
      } else if (srm >= 13 && srm < 17) {
        b = -1.5 * srm + 53.5;
      } else if (srm >= 17 && srm < 22) {
        b = 0.6 * srm + 17.8;
      } else if (srm >= 22 && srm < 27) {
        b = -2.2 * srm + 79.4;
      } else if (srm >= 27 && srm < 34) {
        b = -0.4285 * srm + 31.5714;
      } else {
        b = 17;
      }
    }
    int red = r.toInt();
    int green = g.toInt();
    int blue = b.toInt();
    String rr = red.toRadixString(16);
//red.toHexString(red);
    String gg = green.toRadixString(16);
    String bb = blue.toRadixString(16);
    String rgb = "#";
    if (rr.length < 2) {
      rr = "0" + rr;
    } else if (gg.length < 2) {
      gg = "0" + gg;
    } else if (bb.length < 2) {
      bb = "0" + bb;
    }
    rgb = rgb + rr + gg + bb;
    return rgb;
  }
}
