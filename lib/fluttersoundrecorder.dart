// import 'dart:async';
// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_sound/flutter_sound.dart';
//
// class SoundDirectionAlert extends StatefulWidget {
//   @override
//   _SoundDirectionAlertState createState() => _SoundDirectionAlertState();
// }
//
// class _SoundDirectionAlertState extends State<SoundDirectionAlert> {
//   StreamSubscription? _recorderSubscription;
//   FlutterSoundRecorder? _recorder;
//   double _direction = 0;
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _initRecorder();
//   // }
//
//   // void _initRecorder() async {
//   //   _recorder = await FlutterSoundRecorder().openRecorder();
//   //   await _recorder!.startRecorder(toFile: "");
//   //   _recorderSubscription = _recorder!.listen((event) {
//   //     if (event.currentPosition == 0) return;
//   //     _analyzeSound(event);
//   //   });
//   // }
//
//
//   void _analyzeSound(List<double> event) {
//     List<double> soundData = event;
//     double sum = 0;
//     double maxVal = -1;
//     int maxIndex = -1;
//     for (int i = 0; i < soundData.length; i++) {
//       sum += soundData[i];
//       if (soundData[i] > maxVal) {
//         maxVal = soundData[i];
//         maxIndex = i;
//       }
//     }
//     double avg = sum / soundData.length;
//     double ratio = maxVal / avg;
//     if (ratio > 2) {
//       _setDirection(maxIndex, soundData.length);
//     }
//   }
//
//   void _setDirection(int index, int length) {
//     double angle = (index / length) * 3.14;
//     setState(() {
//       _direction = angle;
//     });
//   }
//
//   @override
//   void dispose() {
//     _recorderSubscription?.cancel();
//     _recorder?.closeRecorder();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Transform.rotate(
//           angle: _direction,
//           child: Icon(Icons.volume_up, size: 100),
//         ),
//       ),
//     );
//   }
// }
