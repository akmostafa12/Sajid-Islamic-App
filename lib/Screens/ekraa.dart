import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mo/Widgets/drawer.dart';

import '../main.dart';

class Ekra2 extends StatefulWidget {
  String? title;
  String? soorah;
  double? fontSize;

  Ekra2({
    Key? key,
    required this.title,
    required this.soorah,
  }) : super(key: key);

  @override
  State<Ekra2> createState() => _Ekra2State();
}

class _Ekra2State extends State<Ekra2> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
          '${widget.title}',
          style: TextStyle(
              fontSize: fontSize.toDouble(),
              fontWeight: FontWeight.bold,
              color: fontColor),
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
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Spacer(
                              flex: 1,
                            ),
                            CircleAvatar(
                                radius: 15,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    sett(() {
                                      setState(() {
                                        if (fontSize == 15) {
                                          fontSize == 15;
                                        } else {
                                          fontSize--;
                                        }
                                      });
                                    });
                                  },
                                  child: const Icon(Icons.remove),
                                  backgroundColor: Colors.white54,
                                )),
                            const Spacer(
                              flex: 1,
                            ),
                            Text(
                              '$fontSize',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: fontColor,
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            CircleAvatar(
                                radius: 15,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    sett(() {
                                      setState(() {
                                        if (fontSize == 70) {
                                          fontSize == 70;
                                        } else {
                                          fontSize++;
                                        }
                                      });
                                    });
                                  },
                                  child: const Icon(Icons.add),
                                  backgroundColor: Colors.white54,
                                )),
                            const Spacer(
                              flex: 1,
                            ),
                            Text(
                              ':  حجم النص',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 23,
                                  color: fontColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Row(
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
                      ],
                    ),
                  );
                }),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Column(
              children: [
                Text(
                  'بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ ',
                  style: TextStyle(
                      fontSize: fontSize.toDouble(),
                      fontWeight: FontWeight.bold,
                      color: fontColor,
                      letterSpacing: 0.5),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${widget.soorah}',
                  style: TextStyle(
                      fontSize: fontSize.toDouble(),
                      fontWeight: FontWeight.bold,
                      color: fontColor,
                      letterSpacing: 0.5),
                  textAlign: TextAlign.center,
                ),
              ],
            )
          ],
        ),
      ),
      drawer: const MDRAWER(),
    );
  }
}
