import 'package:daily_kart/providers/home_provider.dart';
import 'package:daily_kart/providers/location.dart';
import 'package:daily_kart/screens/register/login.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:daily_kart/providers/auth.dart';

import 'screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

Map<int, Color> color = const {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MaterialColor colorCustomM = MaterialColor(0XFF8cc63f, color);
    // MaterialColor colorCustomS = MaterialColor(0xFFffffff, color);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (_) => Location(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Daily Kart',
        theme: ThemeData(
          primarySwatch: colorCustomM,
        ),
        home:  Home(),
      ),
    );
  }
}
