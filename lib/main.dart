import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'Screens/home.dart';

void main() {
  runApp(const MyApp());
}

int fontSize = 24;
Color fontColor = Colors.white;
Color color = const Color(0xff003C34);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                systemNavigationBarColor: Colors.transparent),
            centerTitle: true,
            elevation: 0,
            titleTextStyle:
                TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        home: AnimatedSplashScreen(
          duration: 3000,
          splash: Image.asset('assets/images/sajid.png', color: Colors.white),
          nextScreen: const Home(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: const Color(0xff003C34),
        ));
  }
}
