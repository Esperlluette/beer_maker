// ignore_for_file: unnecessary_this


class Beer {
  late double volume;
  late double degre;
  late double moyenne;
  late double malt;
  late double rincage;
  late double brassage;
  late double houblonAmer;
  late double houblonArome;
  late double levure;
  late double mcu;
  late double srm;
  late String hexcolor;
  late String nom;
  late String description;
  late String privacy;

  get getVolume => this.volume;

  set setVolume(volume) => this.volume = volume;

  get getDegre => this.degre;

  set setDegre(degre) => this.degre = degre;

  get getMoyenne => this.moyenne;

  set setMoyenne(moyenne) => this.moyenne = moyenne;

  get getMalt => this.malt;

  set setMalt(malt) => this.malt = malt;

  get getRincage => this.rincage;

  set setRincage(rincage) => this.rincage = rincage;

  get getBrassage => this.brassage;

  set setBrassage(brassage) => this.brassage = brassage;

  get getHoublonAmer => this.houblonAmer;

  set setHoublonAmer(houblonAmer) => this.houblonAmer = houblonAmer;

  get getHoublonArome => this.houblonArome;

  set setHoublonArome(houblonArome) => this.houblonArome = houblonArome;

  get getLevure => this.levure;

  set setLevure(levure) => this.levure = levure;

  get getMcu => this.mcu;

  set setMcu(mcu) => this.mcu = mcu;

  get getSrm => this.srm;

  set setSrm(srm) => this.srm = srm;

  get getHexcolor => this.hexcolor;

  set setHexcolor(hexcolor) => this.hexcolor = hexcolor;

  get getNom => this.nom;

  set setNom(nom) => this.nom = nom;

  get getDescription => this.description;

  set setDescription(description) => this.description = description;

  get getPrivacy => this.privacy;

  set setPrivacy(privacy) => this.privacy = privacy;
  Beer({
    required this.volume,
    required this.degre,
    required this.moyenne,
    required this.malt,
    required this.rincage,
    required this.brassage,
    required this.houblonAmer,
    required this.houblonArome,
    required this.levure,
    required this.mcu,
    required this.srm,
    required this.hexcolor,
    required this.nom,
    required this.description,
    required this.privacy,
  });
}
