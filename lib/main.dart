import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:senseware/pages/landingPage.dart';
import 'package:senseware/pages/splashScreen.dart';

import 'package:get/get.dart';
import 'pages/introduction_page.dart';
import 'localString.dart';


Future<void> main() async {

  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        translations: LocaleString(),
        locale: const Locale('en', 'US'),
        title: 'My Senseware',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
       // home: const HomePage()
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
