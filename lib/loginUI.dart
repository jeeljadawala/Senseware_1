import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:senseware/main.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final _auth = FirebaseAuth.instance;

class _LoginScreenState extends State<LoginScreen> {
  String email="";
  String password="";
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    Color textcolor = Colors.deepOrange.shade800;
    return Scaffold(
resizeToAvoidBottomInset: false,
    body:  ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: LayoutBuilder(


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
              Positioned(bottom: MediaQuery.of(context).size.height * .4,
                  left: MediaQuery.of(context).size.width * 0.25,
                 //right: MediaQuery.of(context).size.width * 0.1,
                  //top: MediaQuery.of(context).size.width * 0.01,

                  width: MediaQuery.of(context).size.height/1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [ Align(alignment: Alignment.centerLeft,child: Text("Welcome Back!",
                        style: TextStyle(fontSize: 30
                        )),
                    ),SizedBox(height: MediaQuery.of(context).size.width/10,),

                      Row(
                        children: [
                          Image.asset(
                            "assets/login_page.png",
                            height: 200,
                            width: MediaQuery.of(context).size.height,
                            alignment: AlignmentDirectional.centerStart,
                          ),
                        ],
                      ),
SizedBox(height: MediaQuery.of(context).size.width * .2,),





                    ],
                  )),

              Positioned(bottom: MediaQuery.of(context).size.height * .1,
                  left: MediaQuery.of(context).size.width * 0.1,
                 //  right: MediaQuery.of(context).size.width * 0.15,
                  //top: MediaQuery.of(context).size.width * 0.01,

                  width: MediaQuery.of(context).size.height/2.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                          //
                          // Image.asset(
                          //   "assets/login_page.png",
                          //   height: 200,
                          //   width: MediaQuery.of(context).size.height,
                          // ),
                SizedBox(height: 10.0,),
 Center(
                                 child: TextFormField(

                                   cursorColor: Colors.black,

                                   autocorrect: true,
                                   keyboardType: TextInputType.emailAddress,
                                   onChanged: (value) {
                      email = value;
                                     //Do something with the user input.
                                   },
                                   // textAlign: TextAlign.center,
                                   decoration: InputDecoration(
                                     fillColor: Colors.white,
                                     filled: true,
                                     contentPadding:
                                     EdgeInsets.fromLTRB(20.0, 13.0, 20.0, 10.0),
                                     //  contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                                     // prefixIcon: Icon(
                                     //   Icons.email,
                                     //   color: Colors.grey,
                                     // ),
                                     // labelText: getTranslated(context, 'Name'),
                                     hintText: "Enter your email",
                                     hintStyle: const TextStyle(
                                         fontFamily: "OpenSans",
                                         color: Colors.grey,
                                         fontWeight: FontWeight.w700),
                                     errorBorder: OutlineInputBorder(
                                       //   borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                       borderSide: BorderSide(width: 1, color: Colors.white),
                                       borderRadius: BorderRadius.circular(100),
                                     ),
                                     border: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(100)),
                                     focusedBorder: OutlineInputBorder(
                                       borderSide: BorderSide(color: Colors.white),
                                       borderRadius: BorderRadius.circular(100),
                                     ),
                                     enabledBorder: UnderlineInputBorder(
                                       borderSide: BorderSide(color: Colors.transparent),
                                       borderRadius: BorderRadius.circular(100),
                                     ),
                                   ),
                                 ),
                               ),
               
                                     SizedBox(height: 10.0,),
               
                                     Container(
                                       width: MediaQuery.of(context).size.width,
                                       child: TextFormField(
                                         cursorColor: Colors.black,

                                         autocorrect: true,
                          obscureText: true,
                                         onChanged: (value) {
                                           password = value;
                                           //Do something with the user input.
                          },

                                         // textAlign: TextAlign.center,
                                         decoration: InputDecoration(
                                           fillColor: Colors.white,
                                           filled: true,
                                           contentPadding:
                            EdgeInsets.fromLTRB(20.0, 13.0, 10.0, 10.0),
                                           //  contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),

                                           // labelText: getTranslated(context, 'Name'),
                                           hintText: "Enter your password",
                                           hintStyle: const TextStyle(
                                               fontFamily: "OpenSans",
                                               color: Colors.grey,
                                fontWeight: FontWeight.w700),
                                           errorBorder: OutlineInputBorder(
                                             //   borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                             borderSide: BorderSide(width: 1, color: Colors.white),
                                             borderRadius: BorderRadius.circular(100),
                                           ),
                                           border: OutlineInputBorder(
                                               borderRadius: BorderRadius.circular(100)),
                                           focusedBorder: OutlineInputBorder(
                                             borderSide: BorderSide(color: Colors.white),
                                             borderRadius: BorderRadius.circular(100),
                                           ),
                                           enabledBorder: UnderlineInputBorder(
                                             borderSide: BorderSide(color: Colors.transparent),
                                             borderRadius: BorderRadius.circular(100),
                                           ),
                                         ),
                                       ),
                                     ),
                                     SizedBox(height: 20,),
                                     Align(alignment: Alignment.center,child:
                                     Column(

                                       children: [
                                         Row(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             Text("Forgot Password ?",
                                                 style: TextStyle(fontSize: 16,color: textcolor
                                                 )),
                                           ],
                                         ),
                                         SizedBox(height: MediaQuery.of(context).size.width/15,),
                                         Center(
                                           child: Row(
                                               mainAxisAlignment: MainAxisAlignment.center,
                                             children: [
                                               TextButton(
                                                   onPressed: () async {
                                                     setState(() {
                                                       showSpinner = true;
                                                     });
                                                     try {
                                    final user = await _auth.signInWithEmailAndPassword(
                                                           email: email, password: password);
                                                       if (user != null) {
                                                         Navigator.push(
                                                             context,
                                                             MaterialPageRoute(
                                                                 builder: (BuildContext context) => MyApp()));; }
                                                       print("user!=null");

                                                     } catch (e) {
                                                       print(e);
                                                     }
                                                     setState(() {
                                                       showSpinner = false;
                                                     });
                                                   },
                                                   child: Padding(
                                                   padding: const EdgeInsets.only(top: 7.0,bottom: 7.0,left: 80.0,right: 80.0),
                                                   child: Text("Sign In"),
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

                          SizedBox(height: 10,),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(alignment: Alignment.center,child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text("Don't have an account ? ",
                                          style: TextStyle(fontSize: 16,color: Colors.black54
                                          )),
                              Text("Sign Up",
                                  style: TextStyle(fontSize: 16,color: textcolor
                                  )),
                              ])
                            ],

                      ),
                      ),
                            ],
                          ),


                    ],
                      ),



                  ),


            ]
      ))
      ]
        )),
    )
    );
  }
}