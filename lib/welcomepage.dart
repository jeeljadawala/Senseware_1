import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:senseware/introduction_page.dart';
import 'loginUI.dart';

class HalfImage extends StatelessWidget {
  const HalfImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext ctx) {
Color title = Colors.deepOrange.shade800;
    return Builder(
      builder: (context) {
        return Scaffold(


          body: LayoutBuilder(


              builder : (context, constraints) => Stack(

              children: [

                Positioned(

                  // because it is beyond width
                 //  left: -constraints.maxWidth * .4,
                 //  right: constraints.maxWidth * .4,
                 // // top: constraints.maxHeight * .1, // you may need to change value
                 // bottom: constraints.maxHeight * .7,

                  bottom: MediaQuery.of(context).size.height * .7,
                  left: -MediaQuery.of(context).size.width * 0.4,
                  right: MediaQuery.of(context).size.width * 0.4,
                //  top: MediaQuery.of(context).size.width * 0.01,

                  //width: MediaQuery.of(context).size.height/2,
                  child:Image.asset(
                        "assets/circles.png",
                        // width: constraints.maxWidth * 1.2, // because it is beyond width
                        fit: BoxFit.fitWidth,
                    alignment: AlignmentDirectional.topStart,





                  ),
                ),
/*
Positioned(bottom: MediaQuery.of(context).size.height * .65,
        //left: MediaQuery.of(context).size.width * 0.4,
        right: MediaQuery.of(context).size.width * 0.3,
          //top: MediaQuery.of(context).size.width * 0.01,

        width: MediaQuery.of(context).size.height/3,
        child: Column(
          children: [ Align(alignment: Alignment.centerLeft,child: Text("Welcome to",
              style: TextStyle(fontSize: 30
              )),
          ),SizedBox(height: MediaQuery.of(context).size.width/10,)
          ],
        )),

*/

                Positioned(
                    // bottom: MediaQuery.of(context).size.height * .3,
                    // //left: MediaQuery.of(context).size.width * 0.1,
                    // right: MediaQuery.of(context).size.width * 0.1,
                    // //top: MediaQuery.of(context).size.width * 0.01,

                    bottom: MediaQuery.of(context).size.height * .1,
                   left: MediaQuery.of(context).size.height * 0.125,
                     //right: MediaQuery.of(context).size.width * 0.1,
                    top: MediaQuery.of(context).size.width * 0.01,


                  width: MediaQuery.of(context).size.height/2,
                    child:

                          Column(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,

                            children:[
                              Row(
                                children: [
                                   Padding(
                                     padding: const EdgeInsets.all(4.0),
                                     child: Align(alignment: AlignmentDirectional.center,child: Text("SENSWARE ",
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
                                    children: [
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



Positioned(bottom: MediaQuery.of(context).size.height * .2,
          left: MediaQuery.of(context).size.width * 0.1,
         // right: MediaQuery.of(context).size.width * 0.2,
          //top: MediaQuery.of(context).size.width * 0.01,

          width: MediaQuery.of(context).size.height/1,
        child: Row(
          children: [
            TextButton(
              onPressed: () {
                print("pressed");
                Navigator.push(
                  ctx,
                  MaterialPageRoute(builder: (ctx) {
                    return const IntroductionPage();
                  }),
                );} ,


              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepOrange.shade800,
                  textStyle:
                  const TextStyle(fontSize: 24, fontStyle: FontStyle.normal)),
              child: const Padding(
                padding: EdgeInsets.only(top: 7.0,bottom: 7.0,left: 100.0,right: 100.0),
                child: Text("Get Started"),
              ),


            ),
          ],
        ),

),


                Positioned(
                  // because it is beyond width
                  // left: constraints.maxWidth * .4,
                  // right:-constraints.maxWidth * .4,
                  //
                  // top: constraints.maxHeight * .7, // you may need to change value
                  // //bottom: constraints.maxHeight * .7,
              top:MediaQuery.of(context).size.height * .7,
                  left: MediaQuery.of(context).size.width * 0.4,
                  right: -MediaQuery.of(context).size.width * 0.4,


                  // bottom: MediaQuery.of(context).size.height * .7,
                 //  left: MediaQuery.of(context).size.width * 0.4,
                 //  right: -MediaQuery.of(context).size.width * 0.4,
                 //    top: MediaQuery.of(context).size.height *.7,
                 // // width: MediaQuery.of(context).size.height/2,


                  child: Image.asset(
                    "assets/circles.png",
                    // width: constraints.maxWidth * 1.2, // because it is beyond width
                    fit: BoxFit.fitWidth,
                  ),
                ),

                ///* your rest widget with Positioned or [Align] widget
              ],

            ),
          ),
        );
      }
    );
  }
}