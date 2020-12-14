import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fourth_test_app/Screens/login/form/login__form.dart';
import 'package:fourth_test_app/Screens/login/login__header.dart';
import 'package:fourth_test_app/Screens/login/login__selectTypeUser.dart';

class SignUpScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool showPageChild = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      setState(() {
        showPageChild = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: showPageChild
          ? Stack(
              children: <Widget>[
                Positioned(
                  top: MediaQuery.of(context).size.width * 0.15,
                  child: Column(
                    children: <Widget>[
                      AnimatedOpacity(
                        curve: Curves.easeInOutQuart,
                        opacity: showPageChild ? 1 : 0,
                        duration: Duration(
                          milliseconds: 500,
                        ),
                        child: Header(),
                      ),
                      AnimatedOpacity(
                        curve: Curves.easeInOutQuart,
                        opacity: showPageChild ? 1 : 0,
                        duration: Duration(
                          milliseconds: 500,
                        ),
                        child: SelectedTypeLogin(
                          stateAnimation: false,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  // top: MediaQuery.of(context).size.width*0.65,
                  bottom: 0,
                  child: AnimatedOpacity(
                    curve: Curves.easeInOutQuart,
                    opacity: showPageChild ? 1 : 0,
                    duration: Duration(
                      milliseconds: 500,
                    ),
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: RegisterForm(
                        stateAnimation: false,
                      ),
                    ),
                  ),
                )
              ],
            )
          : Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).textSelectionColor,
                strokeWidth: 3,
              ),
            ),
    );
  }
}
