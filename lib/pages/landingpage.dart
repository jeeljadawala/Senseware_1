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
  bool _left = false;
  bool _right = false;
  Color _iconColor = Colors.red;
  bool _highRisk=false;
  StreamSubscription<NoiseReading>? _noiseSubscription;
  late NoiseMeter _noiseMeter;

  @override
  void initState() {
    super.initState();
    _noiseMeter = new NoiseMeter(onError);

    //periodic color change to indicate direction
    Timer.periodic(Duration(seconds: _highRisk? 15:10), (timer) {
      setState(() {
        if (_left) {
          _left = false;
        }
        if (_right){
          _right = false;
        }
      }
      );
    });

  }

  @override
  void dispose() {
    _noiseSubscription?.cancel();
    super.dispose();
  }

  //once microphone starts receiving data
  void onData(NoiseReading noiseReading) {
    Random random = new Random();

    this.setState(() {
      if (!this._isRecording) {
        this._isRecording = true;
      }
    });

    //classify sound on the basis on decibel
    if (noiseReading.maxDecibel > 80 && noiseReading.maxDecibel < 85.0) {
      Vibration.vibrate(
          pattern: [700, 1000, 700, 1000, 700, 1000, 700, 1000, 700, 1000]); //vibrational pattern for low risk
      //toast message
      Fluttertoast.showToast(
          msg: "Low risk detected",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black87,
          fontSize: 20.0);

      //find direction of danger
      List<double> sampleValues = [];
      sampleValues.add(noiseReading.maxDecibel);
      int randomNumber = random.nextInt(5)+80;
      sampleValues.add(randomNumber.toDouble());
      int direction = calculateSoundDirection(sampleValues);
      print("----------------------" + noiseReading.toString());
      print("Random Number: "+randomNumber.toString());//simulated value
      print("Direction: "+direction.toString());
      if(direction==0)
        this._left = true;
      else
        this._right = true;
    }

    //vibrational pattern for medium risk
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
      //toast message
      Fluttertoast.showToast(
          msg: "Medium risk detected",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[100],
          textColor: Colors.white,
          fontSize: 20.0);
      //find direction of danger
      List<double> sampleValues = [];
      sampleValues.add(noiseReading.maxDecibel);
      int randomNumber = random.nextInt(10)+80;
      sampleValues.add(randomNumber.toDouble());
      int direction = calculateSoundDirection(sampleValues);
      print("----------------------" + noiseReading.toString());
      print("Random Number: "+randomNumber.toString());//simulated value
      print("Direction: "+direction.toString());
      if(direction==0)
        this._left = true;
      else
        this._right = true;
    }

    //vibrational pattern for high risk
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

      //toast message
      Fluttertoast.showToast(
          msg: "High risk detected",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[300],
          textColor: Colors.white,
          fontSize: 20.0);

      //find direction of danger
      List<double> sampleValues = [];
      sampleValues.add(noiseReading.maxDecibel);
      int randomNumber = random.nextInt(10)+90; //simulated value
      sampleValues.add(randomNumber.toDouble());
      int direction = calculateSoundDirection(sampleValues);
      print("----------------------" + noiseReading.toString());
      print("Random Number: "+randomNumber.toString());
      print("Direction: "+direction.toString());
      if(direction==0)
        this._left = true;
      else
        this._right = true;
    }
  }

  int calculateSoundDirection(List<double> soundSamples) {
    if(soundSamples[0] > soundSamples[1])
      return 0;
    else
      return 1;
  }

  void onError(Object error) {
    print(error.toString());
    _isRecording = false;
  }

  //microphone on
  void start() {
    askPermission();
    try {
      _noiseSubscription = _noiseMeter.noiseStream.listen(onData);
    } catch (err) {
      print(err);
    }
  }

  //microphone off
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
<<<<<<< Updated upstream
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
                  Row(children: [Icon(Icons.arrow_circle_left_outlined,color: _left ? _iconColor : Colors.grey,size: 70.0,),
                    SizedBox(width: 140.0,),
                    Icon(Icons.arrow_circle_right_outlined,color: _right ? _iconColor : Colors.grey,size: 70.0,)
                  ],),
                  Icon(Icons.arrow_circle_down_outlined,color: Colors.grey,size: 70.0,)

                ],
                ),

                                  ),
    ]  )
                              ),
    )
    )
=======
                                padding: const EdgeInsets.only(top: 120.0),
                                child: Center(
                                  child: SizedBox(
                                      width: 300,
                                      child: Column(children: [
                                        Container(
                                          child: IconButton(
                                            icon: _isRecording
                                                ? const Icon(Icons.stop_circle)
                                                : const Icon(
                                                    Icons.play_circle_fill),
                                            color: _isRecording
                                                ? Colors.red[400]
                                                : Colors.green[400],
                                            iconSize: 100,
                                            onPressed:
                                                _isRecording ? stop : start,
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.all(10),
                                          child: Column(
                                            children: [
                                              Container(
                                                child: Text(
                                                    _isRecording
                                                        ? "off".tr
                                                        : "on".tr,
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black38)),
                                                //margin: EdgeInsets.only(top: 10),
                                              ),
                                              SizedBox(height: 50,),
                                              Row(children: [Icon(Icons.arrow_circle_left_outlined,color: _left ? _iconColor : Colors.grey,size: 70.0,),
                                                SizedBox(width: 140.0,),
                                                Icon(Icons.arrow_circle_right_outlined,color: _right ? _iconColor : Colors.grey,size: 70.0,)
                                              ],),
                                            ],
                                          ),
                                        ),
                                      ])),
                                ))
>>>>>>> Stashed changes
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
