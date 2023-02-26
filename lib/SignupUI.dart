import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:senseware/main.dart';

import 'loginUI.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email = "";
  String password = "", password2 = "";
  bool showSpinner = false;

  Color textcolor = Colors.deepOrange.shade800;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
            builder: (context, constraints) => Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      // because it is beyond width
                      // left: -constraints.maxWidth * .4,
                      // right: constraints.maxWidth * .4,
                      // top: constraints.maxHeight * .1, // you may need to change value
                      // bottom: constraints.maxHeight * .7,

                      bottom: MediaQuery.of(context).size.height * .60,
                      left: -MediaQuery.of(context).size.width * 0.5,
                      //right: MediaQuery.of(context).size.width * 0.1,
                      //  top: MediaQuery.of(context).size.width * 0.01,
                      width: MediaQuery.of(context).size.height / 2,
                      child: SingleChildScrollView(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        child: Image.asset(
                          "assets/circles.png",
                          // width: constraints.maxWidth * 1.2, // because it is beyond width
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Container(
                      // bottom: MediaQuery.of(context).size.height * .1,
                      //left: -MediaQuery.of(context).size.width * 0.4,
                      //right: MediaQuery.of(context).size.width * 0.1,
                      // top: 0,

                      width: MediaQuery.of(context).size.height / 2.2,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(
                              height: 200.0,
                            ),
                            const Text(
                              'Create new account',
                              style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -2.0,
                                  color: Colors.black87,
                                  fontSize: 25.0),
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              'Let us help you meet up your safety',
                              style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  color: Colors.black54,
                                  fontSize: 15.0),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 25.0),
                              child: Center(
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20.0, 13.0, 20.0, 10.0),

                                    // labelText: getTranslated(context, 'Name'),
                                    hintText: 'Enter your full name',
                                    hintStyle: const TextStyle(
                                      fontFamily: "OpenSans",
                                      color: Colors.black38,
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      //   borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.white),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 25, right: 25, top: 20.0),
                              child: Center(
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20.0, 13.0, 20.0, 10.0),

                                    // labelText: getTranslated(context, 'Name'),
                                    hintText: 'Enter Contact Number',
                                    hintStyle: const TextStyle(
                                      fontFamily: "OpenSans",
                                      color: Colors.black38,
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      //   borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.white),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 25, right: 25, top: 20.0),
                              child: Center(
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) {
                                    email = value;
                                    //Do something with the user input.
                                  },
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20.0, 13.0, 20.0, 10.0),

                                    // labelText: getTranslated(context, 'Name'),
                                    hintText: 'Enter your email',
                                    hintStyle: const TextStyle(
                                      fontFamily: "OpenSans",
                                      color: Colors.black38,
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      //   borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.white),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 25, right: 25, top: 20.0),
                              child: Center(
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  obscureText: true,
                                  onChanged: (value) {
                                    password = value;
                                    //Do something with the user input.
                                  },
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20.0, 13.0, 20.0, 10.0),

                                    // labelText: getTranslated(context, 'Name'),
                                    hintText: 'Enter password',
                                    hintStyle: const TextStyle(
                                      fontFamily: "OpenSans",
                                      color: Colors.black38,
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      //   borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.white),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 20.0, bottom: 40),
                              child: Center(
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  obscureText: true,
                                  onChanged: (value) {
                                    password2 = value;
                                    //Do something with the user input.
                                  },
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20.0, 13.0, 20.0, 10.0),

                                    // labelText: getTranslated(context, 'Name'),
                                    hintText: 'Confirm password',
                                    hintStyle: const TextStyle(
                                      fontFamily: "OpenSans",
                                      color: Colors.black38,
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      //   borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.white),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                setState(() {
                                  showSpinner = true;
                                });
                                try {
                                  final newUser = await _auth
                                      .createUserWithEmailAndPassword(
                                          email: email, password: password);
                                  print(email);
                                  if (newUser != null &&
                                      password == password2 &&
                                      email != "" &&
                                      password != "") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                MyApp()));
                                    ;
                                  }
                                } catch (e) {
                                  print(e);
                                }
                                setState(() {
                                  showSpinner = false;
                                });
                              },
                              style: TextButton.styleFrom(
                                  //tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.deepOrange.shade800,
                                  textStyle: const TextStyle(
                                      fontSize: 24,
                                      fontStyle: FontStyle.normal)),
                              child: const Padding(
                                padding: EdgeInsets.only(
                                    top: 7.0,
                                    bottom: 7.0,
                                    left: 100.0,
                                    right: 100.0),
                                child: Text("Register"),
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Text("Already have an account ? ",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black54)),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          LoginScreen()));
                                              ;
                                            },
                                            child: Text("Sign In ",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: textcolor)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )));
  }
}
