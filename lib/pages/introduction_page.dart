import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:senseware/pages/landingPage.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  // Set system UI overlay style and make the status bar transparent
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  final List<bool> _selections = <bool>[true, false];
  final List locale = [
    {'name': '0', 'locale': const Locale('en', 'US')},
    {'name': '1', 'locale': const Locale('fr', 'FR')}
  ];


  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    Size size = MediaQuery.of(context).size;
    print(size);

    const pageDecoration = PageDecoration(
      //  titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      // bodyTextStyle: bodyStyle,
      // bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: const Color(0xFFf5b1b1),
      // imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      // globalBackgroundColor: Colors.white,
      // allowImplicitScrolling: true,
      // autoScrollDuration: 3000,
      globalHeader: Align(
        alignment: Alignment.topRight,
      ),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 70,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
          ),
          child: Text(
            'ReadytoGo'.tr,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),
      pages: [
        PageViewModel(
          title: "",
          bodyWidget: Column(
            children: <Widget>[
              SizedBox(
                height: size.height - 80,
                width: size.width,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Align(
                                alignment: Alignment.topRight,
                                child: ToggleButtons(
                                  constraints: const BoxConstraints(
                                    minHeight: 30,
                                    minWidth: 40,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(18)),
                                  isSelected: _selections,
                                  onPressed: (int index) {},
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
                      margin: EdgeInsets.only(top: size.height * 0.23),
                      // height: size.height*0.66,

                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 30),
                            child: Text(
                              "Activate".tr,
                              style:
                                  TextStyle(fontSize: 20.0, color: Colors.red),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Center(
                                child: SizedBox(
                                    width: 300,
                                    child: Column(children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.redAccent,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: IconButton(
                                          icon: const Icon(
                                              Icons.play_circle_fill),
                                          color: Colors.green[400],
                                          iconSize: 100,
                                          onPressed: () {},
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Text("on".tr,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black38)),
                                              //margin: EdgeInsets.only(top: 10),
                                            ),
                                            SizedBox(
                                              height: 50,
                                            ),
                                            Row(
                                              children: const [
                                                Icon(
                                                  Icons
                                                      .arrow_circle_left_outlined,
                                                  color: Colors.grey,
                                                  size: 70.0,
                                                ),
                                                SizedBox(
                                                  width: 140.0,
                                                ),
                                                Icon(
                                                  Icons
                                                      .arrow_circle_right_outlined,
                                                  color: Colors.grey,
                                                  size: 70.0,
                                                )
                                              ],
                                            ),
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
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "",
          bodyWidget: Column(
            children: <Widget>[
              SizedBox(
                height: size.height - 80,
                width: size.width,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Language".tr,
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.redAccent),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.redAccent,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: ToggleButtons(
                                    constraints: const BoxConstraints(
                                      minHeight: 30,
                                      minWidth: 40,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(18)),
                                    isSelected: _selections,
                                    onPressed: (int index) {},
                                    children: const [Text('EN'), Text('FR')],
                                  ),
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
                      margin: EdgeInsets.only(top: size.height * 0.23),
                      //  height: 500,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(top: 70.0),
                              child: Center(
                                child: SizedBox(
                                    width: 300,
                                    child: Column(children: [
                                      Container(
                                        child: IconButton(
                                          icon: const Icon(
                                              Icons.play_circle_fill),
                                          color: Colors.green[400],
                                          iconSize: 100,
                                          onPressed: () {},
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Text("on".tr,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black38)),
                                              //margin: EdgeInsets.only(top: 10),
                                            ),
                                            SizedBox(
                                              height: 50,
                                            ),
                                            Row(
                                              children: const [
                                                Icon(
                                                  Icons
                                                      .arrow_circle_left_outlined,
                                                  color: Colors.grey,
                                                  size: 70.0,
                                                ),
                                                SizedBox(
                                                  width: 140.0,
                                                ),
                                                Icon(
                                                  Icons
                                                      .arrow_circle_right_outlined,
                                                  color: Colors.grey,
                                                  size: 70.0,
                                                )
                                              ],
                                            ),
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
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "",
          bodyWidget: Column(
            children: <Widget>[
              SizedBox(
                height: size.height - 80,
                width: size.width,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Align(
                                alignment: Alignment.topRight,
                                child: ToggleButtons(
                                  constraints: const BoxConstraints(
                                    minHeight: 30,
                                    minWidth: 40,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(18)),
                                  isSelected: _selections,
                                  onPressed: (int index) {},
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
                      margin: EdgeInsets.only(top: size.height * 0.23),
                      // height: 500,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      child: Column(
                        children: <Widget>[

                          Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: Center(
                                child: SizedBox(
                                    width: 300,
                                    child: Column(children: [
                                      Container(
                                        child: IconButton(
                                          icon: const Icon(
                                              Icons.play_circle_fill),
                                          color: Colors.green[400],
                                          iconSize: 100,
                                          onPressed: () {},
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(10),
                                        child: Column(children: [
                                          Container(
                                            child: Text("on".tr,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black38)),
                                            //margin: EdgeInsets.only(top: 10),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            "fromRight".tr,
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.redAccent),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.red,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Row(
                                              children: const [
                                                Icon(
                                                  Icons
                                                      .arrow_circle_left_outlined,
                                                  color: Colors.grey,
                                                  size: 70.0,
                                                ),
                                                SizedBox(
                                                  width: 135.0,
                                                ),
                                                Icon(
                                                  Icons
                                                      .arrow_circle_right_outlined,
                                                  color: Colors.red,
                                                  size: 70.0,
                                                )
                                              ],
                                            ),
                                          ),
                                        ]),
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
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "",
          bodyWidget: Column(
            children: <Widget>[
              SizedBox(
                height: size.height - 80,
                width: size.width,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Align(
                                alignment: Alignment.topRight,
                                child: ToggleButtons(
                                  constraints: const BoxConstraints(
                                    minHeight: 30,
                                    minWidth: 40,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(18)),
                                  isSelected: _selections,
                                  onPressed: (int index) {},
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
                      margin: EdgeInsets.only(top: size.height * 0.23),
                      // height: 500,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: Center(
                                child: SizedBox(
                                    width: 300,
                                    child: Column(children: [
                                      Container(
                                        child: IconButton(
                                          icon: const Icon(
                                              Icons.play_circle_fill),
                                          color: Colors.green[400],
                                          iconSize: 100,
                                          onPressed: () {},
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(10),
                                        child: Column(children: [
                                          Container(
                                            child: Text("on".tr,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black38)),
                                            //margin: EdgeInsets.only(top: 10),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            "fromLeft".tr,
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.redAccent),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.red,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Row(
                                              children: const [
                                                Icon(
                                                  Icons
                                                      .arrow_circle_left_outlined,
                                                  color: Colors.red,
                                                  size: 70.0,
                                                ),
                                                SizedBox(
                                                  width: 135.0,
                                                ),
                                                Icon(
                                                  Icons
                                                      .arrow_circle_right_outlined,
                                                  color: Colors.grey,
                                                  size: 70.0,
                                                )
                                              ],
                                            ),
                                          ),
                                        ]),
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
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "",
          bodyWidget: Column(
            children: <Widget>[
              SizedBox(
                height: size.height - 80,
                width: size.width,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Align(
                                alignment: Alignment.topRight,
                                child: ToggleButtons(
                                  constraints: const BoxConstraints(
                                    minHeight: 30,
                                    minWidth: 40,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(18)),
                                  isSelected: _selections,
                                  onPressed: (int index) {},
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
                      margin: EdgeInsets.only(top: size.height * 0.23),
                      // height: 500,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      child: Column(
                        children: <Widget>[

                          Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: Center(
                                child: SizedBox(
                                    width: 300,
                                    child: Column(children: [
                                      Container(
                                        child: IconButton(
                                          icon: const Icon(
                                              Icons.play_circle_fill),
                                          color: Colors.green[400],
                                          iconSize: 100,
                                          onPressed: () {},
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(10),
                                        child: Column(children: [
                                          Container(
                                            child: Text("on".tr,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black38)),
                                            //margin: EdgeInsets.only(top: 10),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            "fromBack".tr,
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.red),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.red,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Row(
                                              children: const [
                                                Icon(
                                                  Icons
                                                      .arrow_circle_left_outlined,
                                                  color: Colors.red,
                                                  size: 70.0,
                                                ),
                                                SizedBox(
                                                  width: 135.0,
                                                ),
                                                Icon(
                                                  Icons
                                                      .arrow_circle_right_outlined,
                                                  color: Colors.red,
                                                  size: 70.0,
                                                )
                                              ],
                                            ),
                                          ),
                                        ]),
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
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      skip: Text('skip'.tr,
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
      next: const Icon(Icons.arrow_forward, color: Colors.white),
      done: Text('done'.tr,
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.white,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
