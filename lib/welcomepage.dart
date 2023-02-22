import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:senseware/introduction_page.dart';

class HalfImage extends StatelessWidget {
  const HalfImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
Color title = Colors.deepOrange.shade800;
    return Scaffold(


      body: LayoutBuilder(


          builder : (context, constraints) => Stack(

          children: [
            Positioned(
              // because it is beyond width
              // left: -constraints.maxWidth * .4,
              // right: constraints.maxWidth * .4,
              // top: constraints.maxHeight * .1, // you may need to change value
             // bottom: constraints.maxHeight * .7,

              bottom: MediaQuery.of(context).size.height * .75,
              left: -MediaQuery.of(context).size.width * 0.4,
              //right: MediaQuery.of(context).size.width * 0.1,
            //  top: MediaQuery.of(context).size.width * 0.01,
              width: MediaQuery.of(context).size.height/2,
              child:Image.asset(
                    "assets/circles.png",
                    // width: constraints.maxWidth * 1.2, // because it is beyond width
                    fit: BoxFit.fitWidth,





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
                bottom: MediaQuery.of(context).size.height * .3,
                //left: MediaQuery.of(context).size.width * 0.4,
                right: MediaQuery.of(context).size.width * 0.2,
                //top: MediaQuery.of(context).size.width * 0.01,

                width: MediaQuery.of(context).size.height/1.9,
                child: Column(
                  children:[

                    Row(
                      children: [SizedBox(width: MediaQuery.of(context).size.height/5.5),
                        Align(alignment: Alignment.centerRight,child: Text("SENSEWARE",
                            style: TextStyle(fontSize: 40,color: title
                            )),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 120.0,right: 10.0),
                      child: Image.asset(
                        "assets/logo.png",
                          height: 150,
                        width: MediaQuery.of(context).size.height,
                      ),
                    ),
                    Row(
                      children: [SizedBox(width: MediaQuery.of(context).size.height/5),
                        Align(alignment: Alignment.centerRight,child: Text("Feel the sound with us!",
                            style: TextStyle(fontSize: 20
                            )),
                        ),
                      ],
                    ),
                    SizedBox(height:  MediaQuery.of(context).size.width/4,),

                  ],
                )
            ),



Positioned(bottom: MediaQuery.of(context).size.height * .13,
      left: MediaQuery.of(context).size.width * 0.1,
     // right: MediaQuery.of(context).size.width * 0.2,
      //top: MediaQuery.of(context).size.width * 0.01,

      width: MediaQuery.of(context).size.height/1,
    child: Row(
      children: [
        TextButton(
          onPressed: () { Navigator.push(
    context,
    MaterialPageRoute(
    builder: (BuildContext context) =>IntroductionPage()));; } ,
          child: Padding(
            padding: const EdgeInsets.only(top: 7.0,bottom: 7.0,left: 100.0,right: 100.0),
            child: Text("Get Started"),
          ),
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepOrange.shade800,
              textStyle:
              const TextStyle(fontSize: 24, fontStyle: FontStyle.normal)),

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

             // bottom: MediaQuery.of(context).size.height * .7,
              //left: -MediaQuery.of(context).size.width * 0.4,
              right: -MediaQuery.of(context).size.width * 0.4,
                top: MediaQuery.of(context).size.height *.75,
              width: MediaQuery.of(context).size.height/2,


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
}