class Model {
  String? fajr;
  String? sunRise;
  String? dhur;
  String? asr;
  String? maghrib;
  String? isha;

  Model(
      {required this.fajr,
      required this.sunRise,
      required this.dhur,
      required this.asr,
      required this.maghrib,
      required this.isha});

  factory Model.fromJson(Map<String, dynamic> time) {
    return Model(
        fajr: time['Fajr'],
        sunRise: time['Sunrise'],
        dhur: time['Dhuhr'],
        asr: time['Asr'],
        maghrib: time['Maghrib'],
        isha: time['Isha']);
  }
}
