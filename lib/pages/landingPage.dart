import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:noise_meter/noise_meter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:senseware/pages/introduction_page.dart';
import 'package:vibration/vibration.dart';
import 'package:get/get.dart';
import 'package:senseware/directionDetection.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<bool> _selections = <bool>[true, false];
  final List locale = [
    {'name': '0', 'locale': const Locale('en', 'US')},
    {'name': '1', 'locale': const Locale('fr', 'FR')}
  ];

  var mic1 = TextEditingController();
  var mic2 = TextEditingController();

  final FakeMicrophone _fakeMicrophone = FakeMicrophone(0.0, 0.0);
  late DeviceManager _deviceManager;
  late DirectionDetection _directionDetection;

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  Future askPermission() async {
    // print('In Microphone permission method');
    await Permission.microphone.request();
  }

  bool _isRecording = false;
  bool _left = false;
  bool _right = false;
  Color _iconColor = Colors.red;
  bool _highRisk = false;
  StreamSubscription<NoiseReading>? _noiseSubscription;
  late NoiseMeter _noiseMeter;
  Timer? _iStop;
  Timer? _isStart;
  late int previousMillis;

  @override
  void initState() {
    super.initState();
    _deviceManager = DeviceManager(_fakeMicrophone);
    _directionDetection = DirectionDetection(_deviceManager);
    _noiseMeter = new NoiseMeter(onError);
    _iStop = Timer.periodic(Duration(seconds: 20), (timer) {
      setState(() {
        stop();
      });
    });
    Timer.periodic(Duration(seconds: _highRisk ? 15 : 10), (timer) {
      setState(() {
        if (_left) {
          _left = false;
        }
        if (_right) {
          _right = false;
        }
      });
    });
  }

  @override
  void dispose() {
    _noiseSubscription?.cancel();
    super.dispose();
  }

  Future<void> onData(NoiseReading noiseReading) async {
    Random random = new Random();

    this.setState(() {
      if (!this._isRecording) {
        this._isRecording = true;
      }
    });
    //print("----------------------" + noiseReading.toString());
    if (noiseReading.maxDecibel > 80 && noiseReading.maxDecibel < 85.0) {
      Vibration.vibrate(
          pattern: [700, 1000, 700, 1000, 700, 1000, 700, 1000, 700, 1000]);
      Fluttertoast.showToast(
          msg: "lowrisk".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFF9E9E9E),
          textColor: Colors.black87,
          fontSize: 20.0);
      _fakeMicrophone.setValues(
          double.parse(mic1.text), double.parse(mic2.text));
      int direction = await _directionDetection.computeDirection();
      if (direction == 0) {
        _left = true;
        _right = true;
      } else if (direction == 1) {
        _right = true;
      } else {
        _left = true;
      }
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
          msg: "medrisk".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFFFFCDD2),
          textColor: Colors.white,
          fontSize: 20.0);
      // List<double> sampleValues = [];
      // sampleValues.add(noiseReading.maxDecibel);
      // int randomNumber = random.nextInt(10)+80;
      // sampleValues.add(randomNumber.toDouble());
      // int direction = calculateSoundDirection(sampleValues);
      _fakeMicrophone.setValues(
          double.parse(mic1.text), double.parse(mic2.text));
      int direction = await _directionDetection.computeDirection();
      if (direction == 0) {
        _left = true;
        _right = true;
      } else if (direction == 1) {
        _right = true;
      } else {
        _left = true;
      }
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
          msg: "highrisk".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFFE57373),
          textColor: Colors.white,
          fontSize: 20.0);
      _fakeMicrophone.setValues(
          double.parse(mic1.text), double.parse(mic2.text));
      int direction = await _directionDetection.computeDirection();
            if (direction == 0) {
        _left = true;
        _right = true;
      } else if (direction == 1) {
        _right = true;
      } else {
        _left = true;
      }
    }
  }

  int calculateSoundDirection(List<double> soundSamples) {
    if (soundSamples[0] > soundSamples[1])
      return 0;
    else
      return 1;
  }

  void onError(Object error) {
    print(error.toString());
    _isRecording = false;
  }

  void start() async {
    askPermission();
    try {
      _noiseSubscription = _noiseMeter.noiseStream.listen(onData);
    } catch (e) {
      print(e);
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              // height: size.height - (0.115*size.height),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: IconButton(
                              onPressed: () {
                                // leading: const Icon(
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            IntroductionPage()));
                              },
                              icon: Icon(Icons.help),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: ToggleButtons(
                                constraints: const BoxConstraints(
                                  minHeight: 30,
                                  minWidth: 40,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(18)),
                                isSelected: _selections,
                                onPressed: (int index) {
                                  setState(() {
                                    // The button that is tapped is set to true, and the others to false.
                                    for (int i = 0;
                                        i < _selections.length;
                                        i++) {
                                      _selections[i] = i == index;
                                    }
                                  });
                                  updateLanguage(locale[index]['locale']);
                                },
                                children: const [Text('EN'), Text('FR')],
                              )),
                        ),
                        const Icon(
                          Icons.account_circle,
                          size: 60,
                        ),
                        Text(
                          'welcome'.tr,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.25),
                    height: size.height * 0.65,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: Column(
                      children: <Widget>[
                         Padding(
                            padding: const EdgeInsets.only(top: 90.0),
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
                                        onPressed: _isRecording ? stop : start,
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
                                          SizedBox(
                                            height: 50,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons
                                                    .arrow_circle_left_outlined,
                                                color: _isRecording
                                                    ? (_left
                                                        ? _iconColor
                                                        : Colors.green)
                                                    : Colors.grey,
                                                size: 70.0,
                                              ),
                                              SizedBox(
                                                width: 140.0,
                                              ),
                                              Icon(
                                                Icons
                                                    .arrow_circle_right_outlined,
                                                color: _isRecording
                                                    ? (_right
                                                        ? _iconColor
                                                        : Colors.green)
                                                    : Colors.grey,
                                                size: 70.0,
                                              )
                                            ],
                                          ),
                                          Container(
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: <Widget>[
                                                Expanded(
                                                  child: TextField(
                                                    controller: mic1,
                                                    decoration:
                                                        const InputDecoration(
                                                            labelText: 'Mic1',
                                                            hintText:
                                                                'Mic1 Decibels'),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <
                                                        TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(width: 50.0),
                                                Expanded(
                                                  child: TextField(
                                                    controller: mic2,
                                                    decoration:
                                                        const InputDecoration(
                                                            labelText: 'Mic2',
                                                            hintText:
                                                                'Mic2 Decibels'),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <
                                                        TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                  ),
                                                ),
                                              ])),
                                        ],
                                      ),
                                    ),
                                  ])),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ), //One
    );
  }
}
