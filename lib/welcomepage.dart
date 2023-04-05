import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:senseware/pages/introduction_page.dart';
import 'loginUI.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext ctx) {
    Color title = Colors.deepOrange.shade800;
    return Builder(builder: (context) {
      return Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) => Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                // because it is beyond width
                //  left: -constraints.maxWidth * .4,
                //  right: constraints.maxWidth * .4,
                // // top: constraints.maxHeight * .1, // you may need to change value
                // bottom: constraints.maxHeight * .7,

                bottom: MediaQuery.of(context).size.height * .74,
                left: -MediaQuery.of(context).size.width * 0.5,
                right: MediaQuery.of(context).size.width * 0.4,
                //  top: MediaQuery.of(context).size.width * 0.01,

                //width: MediaQuery.of(context).size.height/2,
                child: Image.asset(
                  "assets/circles.png",
                  // width: constraints.maxWidth * 1.2, // because it is beyond width
                  fit: BoxFit.fitWidth,
                  alignment: AlignmentDirectional.topStart,
                ),
              ),
              Positioned(
                  bottom: MediaQuery.of(context).size.height * .6,
                  //left: MediaQuery.of(context).size.width * 0.4,
                  right: MediaQuery.of(context).size.width * 0.3,
                  //top: MediaQuery.of(context).size.width * 0.01,

                  width: MediaQuery.of(context).size.height / 3,
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 70,),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Welcome to,",
                              style: TextStyle(fontSize: 30)),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      )
                    ],
                  )),

/*
                Positioned(
                    // bottom: MediaQuery.of(context).size.height * .3,
                    // //left: MediaQuery.of(context).size.width * 0.1,
                    // right: MediaQuery.of(context).size.width * 0.1,
                    // //top: MediaQuery.of(context).size.width * 0.01,

                    bottom: MediaQuery.of(context).size.height * .1,
                 //  left: MediaQuery.of(context).size.height * 0.125,
                     //right: MediaQuery.of(context).size.width * 0.1,
                    top: MediaQuery.of(context).size.width * 0.01,


                  width: MediaQuery.of(context).size.height/3,
                    child:

                          Column(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                             mainAxisAlignment: MainAxisAlignment.center,

                            children:[
                              SizedBox(height: 20.0,),Align(alignment: AlignmentDirectional.centerStart,
                              child: Text("Welcome to ",
                                  style: TextStyle(fontSize: 30,color: Colors.black54
                                  )),
                            ),
                              Row(
                                children: [
                                   Padding(
                                     padding: const EdgeInsets.all(4.0),
                                     child: Align(alignment: AlignmentDirectional.center,child: Text("SENSEWARE ",
                                          style: TextStyle(fontSize: 40,color: title
                                          )),
                                      ),
                                   ),

                                ],
                              ),
                             Container(
                               child: Image.asset(
                                    "assets/logo.png",
                                      height: 150,
                                    width: MediaQuery.of(context).size.height,
                                 alignment: AlignmentDirectional.centerStart,
                                ),
                             ),


                                  Row(
                                    children: const [
                                      Align(alignment: AlignmentDirectional.center,child: Text("Feel the sound with us!",
                                          style: TextStyle(fontSize: 20
                                          )),
                                      ),
                                    ],
                                  ),


                              SizedBox(height:  MediaQuery.of(context).size.width/4,),

                            ],

                        ),

                ),

*/

              Positioned(
                bottom: MediaQuery.of(context).size.height * .2,
                left: MediaQuery.of(context).size.width * 0.08,
                // right: MediaQuery.of(context).size.width * 0.2,
                //top: MediaQuery.of(context).size.width * 0.01,

                width: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: Align(
                            alignment: AlignmentDirectional.center,
                            child: Text("SENSEWARE ",
                                style: TextStyle(fontSize: 40, color: title)),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Image.asset(
                        "assets/logo.png",
                        height: 150,
                        width: MediaQuery.of(context).size.height,
                        alignment: AlignmentDirectional.centerStart,
                      ),
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: Align(
                            alignment: AlignmentDirectional.center,
                            child: Text("Feel the sound with us!",
                                style: TextStyle(fontSize: 20)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      children: [
                        Container(
                          //alignment: AlignmentDirectional.topStart,
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextButton(
                            onPressed: () async {
                              try {
                                print("pressed");
                                Navigator.push(
                                    ctx,
                                    MaterialPageRoute(
                                        builder: (BuildContext ctx) =>
                                            LoginScreen()));
                                ;
                              } catch (e) {
                                print(e);
                              }
                            },
                            style: TextButton.styleFrom(
                                //                       tapTargetSize: MaterialTapTargetSize.shrinkWrap,

                                foregroundColor: Colors.white,
                                backgroundColor: Colors.deepOrange.shade800,
                                textStyle: const TextStyle(
                                    fontSize: 24, fontStyle: FontStyle.normal)),
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  top: 7.0,
                                  bottom: 7.0,
                                  left: 80.0,
                                  right: 70.0),
                              child: Text("Get Started"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //             Positioned(
              //
              //           top:MediaQuery.of(context).size.height * .7,
              //               left: MediaQuery.of(context).size.width * 0.4,
              //               right: -MediaQuery.of(context).size.width * 0.4,
              //
              //
              //
              //               child: Image.asset(
              //                 "assets/circles.png",
              //                 // width: constraints.maxWidth * 1.2, // because it is beyond width
              //                 fit: BoxFit.fitWidth,
              //               ),
              //
              // ),

              ///* your rest widget with Positioned or [Align] widget
            ],
          ),
        ),
      );
    });
  }
}
