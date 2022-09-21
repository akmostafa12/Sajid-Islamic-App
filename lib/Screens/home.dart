import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:mo/Screens/quran.dart';
import 'package:mo/Services/prayerTimes.dart';
import 'package:mo/Widgets/drawer.dart';
import '../Model/prayerModel.dart';
import '../main.dart';
import 'Sebha.dart';

class Home extends StatefulWidget {
  final String? name;
  final String? country;
  final String? city;

  const Home({
    Key? key,
    this.name,
    this.country,
    this.city,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Position? position;
  var lat;
  var long;
  final time = DateFormat('hh:mm');

  Future<Position> getPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> getTimes() async {
    position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) => value);
    lat = position!.latitude;
    long = position!.longitude;
    setState(() {});
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    getTimes();
    getPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color,
        appBar: AppBar(
          iconTheme: IconThemeData(color: fontColor),
          backgroundColor: color,
          title: Text(
            'تطبيق ساجد',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: fontColor),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: fontColor,
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: (context),
                  builder: (context) => StatefulBuilder(
                      builder: (BuildContext context, StateSetter sett) {
                    return Container(
                      height: 100,
                      width: 100,
                      color: color,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              sett(() {
                                setState(() {
                                  color = Colors.white;
                                  fontColor = Colors.black;
                                });
                              });
                            },
                            child: Container(
                              width: 25,
                              height: 25,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          GestureDetector(
                            onTap: () {
                              sett(() {
                                setState(() {
                                  color = Colors.black;
                                  fontColor = Colors.white;
                                });
                              });
                            },
                            child: Container(
                              width: 25,
                              height: 25,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          GestureDetector(
                            onTap: () {
                              sett(() {
                                setState(() {
                                  color = Colors.blue;
                                  fontColor = Colors.white;
                                });
                              });
                            },
                            child: Container(
                              width: 25,
                              height: 25,
                              color: Colors.blue,
                            ),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          GestureDetector(
                            onTap: () {
                              sett(() {
                                setState(() {
                                  color = const Color(0xff003C34);
                                  fontColor = Colors.white;
                                });
                              });
                            },
                            child: Container(
                              width: 25,
                              height: 25,
                              color: Colors.green,
                            ),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          Text(
                            ':  لون التطبيق',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 23,
                                color: fontColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  }),
                );
              },
            )
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      height: 100,
                      child: Stack(
                        children: [
                          Card(
                            color: Colors.transparent,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(': الوقت الان',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: fontColor)),
                                  Text(time.format(DateTime.now()),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: fontColor)),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              top: 23,
                              left: 2,
                              child: Image.asset(
                                'assets/images/sajid.png',
                                color: fontColor,
                                width: 130,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Divider(height: 30, color: fontColor),
                const SizedBox(
                  height: 20,
                ),
                FutureBuilder<Model>(
                    future: PrayerTimes().getTimes(lat, long),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        Model time = snapshot.data!;
                        return Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            CircleAvatar(
                                                radius: 25,
                                                backgroundColor: Colors.grey,
                                                child: Text('الظهر',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: fontColor))),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text('${time.dhur}',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: fontColor)),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          children: [
                                            CircleAvatar(
                                                radius: 25,
                                                backgroundColor: Colors.grey,
                                                child: Text('العصر',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: fontColor))),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text('${time.asr}',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: fontColor)),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          children: [
                                            CircleAvatar(
                                                radius: 25,
                                                backgroundColor: Colors.grey,
                                                child: Text('المغرب',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: fontColor))),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text('${time.maghrib}',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: fontColor)),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          children: [
                                            CircleAvatar(
                                                radius: 25,
                                                backgroundColor: Colors.grey,
                                                child: Text('العشاء',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: fontColor))),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text('${time.isha}',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: fontColor)),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          children: [
                                            CircleAvatar(
                                                radius: 25,
                                                backgroundColor: Colors.grey,
                                                child: Text('الفجر',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: fontColor))),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text('${time.fajr}',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: fontColor)),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          children: [
                                            CircleAvatar(
                                                radius: 25,
                                                backgroundColor: Colors.grey,
                                                child: Text('الشروق',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: fontColor))),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text('${time.sunRise}',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: fontColor)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Text('المواقيت حسب موقعك',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: fontColor)),
                              Divider(height: 30, color: fontColor),
                            ],
                          ),
                        );
                      }
                      return Column(
                        children: [
                          Text('لا يوجد اتصال ب لانترنت',
                              style: TextStyle(
                                color: fontColor,
                                fontSize: 20,
                              )),
                          Divider(height: 30, color: fontColor),
                          const SizedBox(height: 50)
                        ],
                      );
                    }),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Sebha(
                                    title: 'الاستغفار',
                                    name: 'استغفر الله العظيم')),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: SizedBox(
                          width: double.infinity,
                          height: 100,
                          child: Stack(
                            children: [
                              Card(
                                color: Colors.transparent,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text('الاستغفار',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: fontColor)),
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 34.3,
                                  left: 4,
                                  child: Image.asset(
                                    'assets/images/sajid.png',
                                    color: fontColor,
                                    width: 67,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Sebha(
                                    title: 'التسبيح', name: 'سبحان الله')),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: SizedBox(
                          width: double.infinity,
                          height: 100,
                          child: Stack(
                            children: [
                              Card(
                                color: Colors.transparent,
                                child: Center(
                                  child: Text('التسبيح',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: fontColor)),
                                ),
                              ),
                              Positioned(
                                  top: 34.3,
                                  left: 4,
                                  child: Image.asset(
                                    'assets/images/sajid.png',
                                    color: fontColor,
                                    width: 67,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Sebha(
                                      title: 'اذكار بعد الصلاه',
                                      name: 'سبحان الله',
                                      function: true,
                                    )),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: SizedBox(
                          width: double.infinity,
                          height: 100,
                          child: Stack(
                            children: [
                              Card(
                                color: Colors.transparent,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: Text('اذكار بعد الصلاة',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: fontColor)),
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 34.3,
                                  left: 4,
                                  child: Image.asset(
                                    'assets/images/sajid.png',
                                    color: fontColor,
                                    width: 67,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Sebha(title: 'التكبير', name: 'الله أكبر')),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: SizedBox(
                          width: double.infinity,
                          height: 100,
                          child: Stack(
                            children: [
                              Card(
                                color: Colors.transparent,
                                child: Center(
                                  child: Text('التكبير',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: fontColor)),
                                ),
                              ),
                              Positioned(
                                  top: 34.3,
                                  left: 4,
                                  child: Image.asset(
                                    'assets/images/sajid.png',
                                    color: fontColor,
                                    width: 67,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Quran()),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: double.infinity,
                          height: 100,
                          child: Stack(
                            children: [
                              Card(
                                color: Colors.transparent,
                                child: Center(
                                  child: Text('القرأن الكريم',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: fontColor)),
                                ),
                              ),
                              Positioned(
                                  top: 12,
                                  left: 6,
                                  child: Image.asset(
                                    'assets/images/sajid.png',
                                    color: fontColor,
                                    width: 90,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text('لا تنسى الصلاة على النبى',
                    style: TextStyle(
                        color: fontColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 15,
                ),
                Text('Powered By Mostafa Amin',
                    style: TextStyle(
                        color: fontColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        drawer: const MDRAWER());
  }
}
