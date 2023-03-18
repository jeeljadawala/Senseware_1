import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:senseware/pages/landingpage.dart';
import 'package:senseware/shared_pref.dart';

import 'new.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPreference.init();
 // runApp(ProviderScope(child: LocalizationDemo()));


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Senseware',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage()
    );
  }
}
