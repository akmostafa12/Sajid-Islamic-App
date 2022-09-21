import 'package:flutter/material.dart';
import 'package:mo/Screens/home.dart';
import 'package:mo/Screens/quran.dart';
import 'package:mo/Screens/Sebha.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../main.dart';

class MDRAWER extends StatefulWidget {
  const MDRAWER({Key? key}) : super(key: key);

  @override
  _MDRAWERState createState() => _MDRAWERState();
}

class _MDRAWERState extends State<MDRAWER> {
  String facebook = 'https://www.facebook.com/mostafa.amin.08';
  String instgram = 'https://www.instagram.com/mostafa_amin881/';
  String youtube = 'https://www.youtube.com/channel/UC2KDRd6vwDyLiZ7zNvUo8aw';

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: color),
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, right: 10),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => const Home()),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: Text(
                        'الصفحه الرئيسيه',
                        style: TextStyle(
                            fontSize: fontSize.toDouble(),
                            color: fontColor,
                            fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(height: 30, color: fontColor),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Sebha(title: 'التسبيح', name: 'سبحان الله')),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: Text(
                        'التسبيح',
                        style: TextStyle(
                            fontSize: fontSize.toDouble(),
                            color: fontColor,
                            fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(height: 30, color: fontColor),
                  GestureDetector(
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
                      child: Text(
                        'الاستغفار',
                        style: TextStyle(
                            fontSize: fontSize.toDouble(),
                            color: fontColor,
                            fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(height: 30, color: fontColor),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Sebha(title: 'التكبير', name: 'الله أكبر')),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: Text(
                        'التكبير',
                        style: TextStyle(
                            fontSize: fontSize.toDouble(),
                            color: fontColor,
                            fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(height: 30, color: fontColor),
                  GestureDetector(
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
                      child: Text('اذكار بعد الصلاه',
                          style: TextStyle(
                              fontSize: fontSize.toDouble(),
                              color: fontColor,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.end)),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(height: 30, color: fontColor),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Quran()),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: Text(
                        'القرأن الكريم',
                        style: TextStyle(
                            fontSize: fontSize.toDouble(),
                            color: fontColor,
                            fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(height: 30, color: fontColor),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () async {
                            await launchUrlString(facebook,
                                mode: LaunchMode.externalApplication,
                                webViewConfiguration:
                                    const WebViewConfiguration(
                                  enableJavaScript: true,
                                ));
                          },
                          icon: Icon(
                            Icons.facebook,
                            size: 32,
                            color: fontColor,
                          )),
                      IconButton(
                          onPressed: () async {
                            await launchUrlString(instgram,
                                mode: LaunchMode.externalApplication,
                                webViewConfiguration:
                                    const WebViewConfiguration(
                                  enableJavaScript: true,
                                ));
                          },
                          icon: Image.asset('assets/images/instgram.ico',
                              color: fontColor)),
                      IconButton(
                          onPressed: () async {
                            await launchUrlString(youtube,
                                mode: LaunchMode.externalApplication,
                                webViewConfiguration:
                                    const WebViewConfiguration(
                                  enableJavaScript: true,
                                ));
                          },
                          icon: Image.asset('assets/images/youtube.png',
                              color: fontColor)),
                      const Spacer(
                        flex: 1,
                      ),
                      Text(
                        ': تابعنا على',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 23,
                            color: fontColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
