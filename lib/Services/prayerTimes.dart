import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/prayerModel.dart';

class PrayerTimes {
  Future<Model> getTimes(var lat, var long) async {
    http.Response response = await http.get(Uri.parse(
        'http://api.aladhan.com/v1/calendar?latitude=$lat&longitude=$long&method=2&month=${DateTime.now().month}&year=${DateTime.now().year}'));
    Map<String, dynamic> list = jsonDecode(response.body);
    Map<String, dynamic> time = list['data'][0]['timings'];

    Model model = Model(
        fajr: time['Fajr'],
        sunRise: time['Sunrise'],
        dhur: time['Dhuhr'],
        asr: time['Asr'],
        maghrib: time['Maghrib'],
        isha: time['Isha']);
    return model;
  }
}
