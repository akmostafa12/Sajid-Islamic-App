import 'package:flutter/material.dart';
import 'package:mo/Widgets/drawer.dart';

import '../main.dart';

class Sebha extends StatefulWidget {
  Sebha({Key? key, required this.title, this.name, this.function})
      : super(key: key);
  String? title;
  String? name;
  bool? function;

  @override
  _SebhaState createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int seb7a = 0;

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
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('${widget.name}',
              style: TextStyle(
                fontSize: fontSize.toDouble(),
                color: fontColor,
                fontWeight: FontWeight.bold,
              )),
          Text(
            '$seb7a',
            style: TextStyle(
                fontSize: fontSize.toDouble(),
                fontWeight: FontWeight.bold,
                color: fontColor),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            FloatingActionButton(
                child: Icon(
                  Icons.restore,
                  color: fontColor,
                ),
                backgroundColor: Colors.white54,
                onPressed: () {
                  setState(() {
                    seb7a = 0;
                  });
                }),
            const SizedBox(width: 10),
            FloatingActionButton(
                child: Icon(Icons.add, color: fontColor),
                backgroundColor: Colors.white54,
                onPressed: () {
                  setState(() {
                    seb7a++;
                    if (widget.function == true) {
                      if (seb7a > 33) {
                        widget.name = 'استغفر الله العظيم';
                      }
                      if (seb7a > 66) {
                        widget.name = 'الله اكبر';
                      }
                      if (seb7a == 99) {
                        seb7a = 0;
                        widget.name = 'سبحان الله';
                      }
                    }
                  });
                }),
          ]),
        ]),
      ),
      drawer: Theme(
          data:
              Theme.of(context).copyWith(canvasColor: const Color(0xff003C34)),
          child: const MDRAWER()),
    );
  }
}
