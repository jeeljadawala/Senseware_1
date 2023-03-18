import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:noise_meter/noise_meter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vibration/vibration.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

void popupSettings() {}

class _HomePageState extends State<HomePage> {

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
    if (noiseReading.maxDecibel > 80 && noiseReading.maxDecibel < 85.0) {
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
    if (noiseReading.maxDecibel > 85 && noiseReading.maxDecibel < 90.0) {
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
    if (noiseReading.maxDecibel > 90.0) {
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



















  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFf5b1b1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        // leading: const Icon(
        //   Icons.menu,
        //   color: Colors.black,
        // ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 20.0),
        //     child: IconButton(
        //       icon: const Icon(Icons.settings, color: Colors.black),
        //       onPressed: () {
        //         showDialog(
        //             context: context,
        //             builder: (BuildContext context) => AlertDialog(
        //                   title: const Text('Settings'),
        //                   content: Stack(
        //                     clipBehavior: Clip.none,
        //                     children: <Widget>[
        //                       Positioned(
        //                         right: -40.0,
        //                         top: -40.0,
        //                         child: InkResponse(
        //                           onTap: () {
        //                             Navigator.of(context).pop();
        //                           },
        //                           child: const CircleAvatar(
        //                             backgroundColor: Colors.red,
        //                             child: Icon(Icons.close),
        //                           ),
        //                         ),
        //                       ),
        //                       Column(
        //                         children: <Widget>[
        //                           Text('Language'),
        //                           DropdownButton(
        //                               items: items, onChanged: onChanged)
        //                         ],
        //                       )
        //                     ],
        //                   ),
        //                   actions: [
        //                     TextButton(
        //                         onPressed: () => {Navigator.of(context).pop()},
        //                         child: const Text('Done'))
        //                   ],
        //                 ));
        //       },
        //     ),
        //   )
        // ],
      ),
      body: Column(
        children: [
          // Upper Hero Widget
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: size.height - 80,
                  child: Stack(
                    children: <Widget>[
                      const HeroWidget(),
                      Container(
                        margin: EdgeInsets.only(top: size.height * 0.23),
                        // height: 500,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25))),
                        child: Column(
                          children: <Widget>[
                            // Center(
                            //   child: Column(
                            //     children: <Widget>[
                            //       Row(
                            //         children: const <Widget>[
                            //           Text('Vibration Mode'),
                            //           Text('3')
                            //         ],
                            //       ),
                            //       Row(
                            //         children: const <Widget>[
                            //           Text('Vibration Intensity'),
                            //           Text('10')
                            //         ],
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(top: 120.0),
                              child: Center(
                                child: SizedBox(
                                  width: 300,
                                  child: Column(
                                    children: [ Container(

                                      child: IconButton(

                                        icon: _isRecording
                                            ? const Icon(Icons.stop_circle)
                                            : const Icon(Icons.play_circle_fill),
                                        color: _isRecording ? Colors.red[400] : Colors.green[400],
                                        iconSize: 100,
                                        onPressed:_isRecording ? stop : start,
                                      ),
                                    ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(children: [
                  Container(
                    child: Text(_isRecording ? "OFF" : "ON",
                        style: TextStyle(fontSize: 30, color: Colors.black38)),
                    //margin: EdgeInsets.only(top: 10),
                  ),
                  Row(children: [Icon(Icons.arrow_circle_left_outlined,color: Colors.grey,size: 70.0,),
                    SizedBox(width: 140.0,),
                    Icon(Icons.arrow_circle_right_outlined,color: Colors.grey,size: 70.0,)
                  ],),
                  Icon(Icons.arrow_circle_down_outlined,color: Colors.grey,size: 70.0,)

                ],
                ),

                                  ),
    ]  )
                              ),
    )
    )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )

          // Lower Content Widget
        ],
      ), //One
    );
  }
}

class HeroWidget extends StatelessWidget {
  const HeroWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            Icon(
              Icons.account_circle,
              size: 100,
            ),
            Text(
              'Welcome, User',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
