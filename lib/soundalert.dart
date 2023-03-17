
import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:noise_meter/noise_meter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vibration/vibration.dart';

class SoundAlert extends StatefulWidget {
  @override
  _SoundAlertState createState() => new _SoundAlertState();
}

class _SoundAlertState extends State<SoundAlert> {
  Future askPermission() async {
    // print('In Microphone permission method');
    await Permission.microphone.request();
  }

  bool _isRecording = false;
  StreamSubscription<NoiseReading>? _noiseSubscription;
  late NoiseMeter _noiseMeter;

  @override
  void initState() {
    super.initState();
    _noiseMeter = new NoiseMeter(onError);

  }

  @override
  void dispose() {
    _noiseSubscription?.cancel();
    super.dispose();
  }

  void onData(NoiseReading noiseReading) {
    Random random = new Random();

    this.setState(() {
      if (!this._isRecording) {
        this._isRecording = true;
      }
    });
    print("----------------------" + noiseReading.toString());
    if (noiseReading.maxDecibel > 80 && noiseReading.maxDecibel < 92.0) {
      Vibration.vibrate(
          pattern: [700, 1000, 700, 1000, 700, 1000, 700, 1000, 700, 1000]);
      Fluttertoast.showToast(
          msg: "Low risk detected",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black87,
          fontSize: 20.0);
      List<double> sampleValues = [];
      sampleValues.add(noiseReading.maxDecibel);
      int randomNumber = random.nextInt(100);
      print("Random Number: "+randomNumber.toString());
      sampleValues.add(randomNumber.toDouble());
      double angle = calculateSoundDirectionAngle(sampleValues);
      print("---------Angle-------------" + noiseReading.toString());
      print(angle);
    }
    if (noiseReading.maxDecibel > 92 && noiseReading.maxDecibel < 100.0) {
      Vibration.vibrate(pattern: [
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200,
        200
      ]);
      Fluttertoast.showToast(
          msg: "Medium risk detected",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[300],
          textColor: Colors.white,
          fontSize: 20.0);
      List<double> sampleValues = [];
      sampleValues.add(noiseReading.maxDecibel);
      int randomNumber = random.nextInt(100);
      print("Random Number: "+randomNumber.toString());
      sampleValues.add(randomNumber.toDouble());
      double angle = calculateSoundDirectionAngle(sampleValues);
      print("----------------------" + noiseReading.toString());
      print(angle);
    }
    if (noiseReading.maxDecibel > 100.0) {
      Vibration.vibrate(pattern: [
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
        50,
      ]);
      Fluttertoast.showToast(
          msg: "High risk detected",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[300],
          textColor: Colors.white,
          fontSize: 20.0);
      List<double> sampleValues = [];
      sampleValues.add(noiseReading.maxDecibel);
      int randomNumber = random.nextInt(100);
      print("Random Number: "+randomNumber.toString());
      sampleValues.add(randomNumber.toDouble());
      double angle = calculateSoundDirectionAngle(sampleValues);
      print("----------------------" + noiseReading.toString());
      print(angle);
    }
  }

  double calculateSoundDirectionAngle(List<double> soundSamples) {
    // Convert audio data to frequency domain using FFT

    double micDistance = 0.1; // distance between the two microphones in meters
    double soundSpeed = 343; // speed of sound in meters per second
    double sampleRate = 44100; // sample rate in Hz
    double angleRadians = atan2(soundSamples[0].toDouble(), soundSamples[1].toDouble());
    double soundTimeDiff = angleRadians / (2 * pi) * (1 / sampleRate);
    double soundDistanceDiff = soundTimeDiff * soundSpeed;
    double soundAngle = atan2(soundDistanceDiff, micDistance)*180/pi;
    return soundAngle;
  }

  void onError(Object error) {
    print(error.toString());
    _isRecording = false;
  }

  void start() {
    askPermission();
    try {
      _noiseSubscription = _noiseMeter.noiseStream.listen(onData);
    } catch (err) {
      print(err);
    }
  }

  void stop() async {
    try {
      if (_noiseSubscription != null) {
        _noiseSubscription!.cancel();
        _noiseSubscription = null;
      }
      this.setState(() {
        this._isRecording = false;
      });
    } catch (err) {
      print('stopRecorder error: $err');
    }
  }

  List<Widget> getContent() => <Widget>[
    Container(
      padding: EdgeInsets.only(left: 80, right: 80, top: 150, bottom: 100),
      child: const Text(
        "Senseware",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 44.0,
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(left: 60,right: 70),
      child: IconButton(
        padding:
        const EdgeInsets.only(left: 60, right: 100, top: 60, bottom: 0),
        icon: _isRecording
            ? const Icon(Icons.stop_circle)
            : const Icon(Icons.play_circle_fill),
        color: _isRecording ? Colors.red[400] : Colors.green[400],
        iconSize: 150,
        onPressed:_isRecording ? stop : start,
      ),
    ),
    Container(
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          Container(
            padding: EdgeInsets.fromLTRB(80, 10, 70, 0),
            child: Text(_isRecording ? "OFF" : "ON",
                style: TextStyle(fontSize: 30, color: Colors.black38)),
            //margin: EdgeInsets.only(top: 10),
          ),
        ]))
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  //
  // @override
  // Widget build(BuildContext context) {
  //
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: Scaffold(
  //       //backgroundColor: Colors.grey[900],
  //       body: Container(
  //           child: Column(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: getContent())),
  //     ),
  //   );
  // } // Build
} // Class _SoundAlertState