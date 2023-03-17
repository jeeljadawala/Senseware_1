//
// import 'package:flutter/material.dart';
// import 'languagepage.dart';
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   Locale _locale = Locale('en');
//
//   void _changeLanguage(Locale locale) {
//     setState(() {
//       _locale = locale;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       localizationsDelegates: [
//         AppLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//       ],
//       supportedLocales: [
//         const Locale('en'),
//         const Locale('es'),
//       ],
//       locale: _locale,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(AppLocalizations.of(context).title),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 AppLocalizations.of(context).hello,
//                 style: Theme.of(context).textTheme.headline4,
//               ),
//               SizedBox(height: 20),
//               TextButton(
//                 onPressed: () => _changeLanguage(Locale('en')),
//                 child: Text('English'),
//               ),
//               TextButton(
//                 onPressed: () => _changeLanguage(Locale('es')),
//                 child: Text('Español'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:easy_localization/easy_localization.dart';
// //
// // class LanguageMainScreen extends StatefulWidget {
// //   const LanguageMainScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   _LanguageMainScreenState createState() => _LanguageMainScreenState();
// // }
// //
// // class _LanguageMainScreenState extends State<LanguageMainScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //           Text("on"),
// //             GestureDetector(
// //               onTap: () async {
// //                 context.locale = Locale('en', 'US');
// //               },
// //               child: Container(
// //                 height: 40,
// //                 width: 190,
// //                 color: Colors.blue,
// //                 child: Text("Switch to EN - US"),
// //               ),
// //             ),
// //             GestureDetector(
// //               onTap: () async {
// //                 context.locale = Locale('en', 'FR');
// //               },
// //               child: Container(
// //                 height: 40,
// //                 width: 190,
// //                 color: Colors.red,
// //                 child: Text("Switch to EN - FR"),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }