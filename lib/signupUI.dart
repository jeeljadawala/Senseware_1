import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HalfImage extends StatelessWidget {
  const HalfImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: LayoutBuilder(


          builder : (context, constraints) => Stack(

          children: [
            Positioned(
              // because it is beyond width
              left: -constraints.maxWidth * .4,
              right: constraints.maxWidth * .4,

             // top: constraints.maxHeight * .1, // you may need to change value
              bottom: constraints.maxHeight * .7,
              child: Image.asset(
                "assets/circles.png",
                // width: constraints.maxWidth * 1.2, // because it is beyond width
                fit: BoxFit.fitWidth,

              ),
            ),

            Positioned(
              // because it is beyond width
              left: constraints.maxWidth * .4,
              right:-constraints.maxWidth * .4,

              top: constraints.maxHeight * .7, // you may need to change value
              //bottom: constraints.maxHeight * .7,
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