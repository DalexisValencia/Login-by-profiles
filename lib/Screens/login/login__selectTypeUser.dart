import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fourth_test_app/Screens/login/typeService/selectTypeUser__card.dart';

class SelectedTypeLogin extends StatefulWidget {
  final stateAnimation;
  SelectedTypeLogin({
    this.stateAnimation,
  });
  @override
  _SelectedTypeLoginState createState() => _SelectedTypeLoginState();
}

class _SelectedTypeLoginState extends State<SelectedTypeLogin> {
  bool widgetOwnAnimation = false;
  int active;
  @override
  void initState() {
    super.initState();
    setState(() {
      widgetOwnAnimation = widget.stateAnimation;
    });
    Timer(
        Duration(
          milliseconds: 500,
        ), () {
      startAnimation();
    });
  }

  startAnimation() {
    setState(() {
      widgetOwnAnimation = true;
    });
  }

  setActiveButton(number) {
    setState(() {
      active = number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOutQuart,
      duration: Duration(milliseconds: 500),
      transform: Matrix4.translationValues(
        widgetOwnAnimation ? 0 : -MediaQuery.of(context).size.width,
        0,
        0,
      ),
      width: MediaQuery.of(context).size.width,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 15),
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: Axis.horizontal,
          children: <Widget>[
            RaisedButton(
              elevation: 0,
              padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
              color: Theme.of(context).primaryColorDark,
              // splashColor: active == 1 ? Theme.of(context).primaryColorDark : Theme.of(context).primaryColorLight,
              onPressed: () => active == 1 ? null : setActiveButton(1),
              child: TypeLogin(
                active: active == 1,
                text: 'PARENT',
                textColor: Color(0xFFF3B500),
                image: 'assets/icons/parent-icon.png',
              ),
            ),
            // SizedBox(height: 10),
            RaisedButton(
              elevation: 0,
              padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
              color: Theme.of(context).primaryColorDark,
              // splashColor: active == 2 ? Theme.of(context).primaryColorDark : Theme.of(context).primaryColorLight,
              onPressed: () => active == 2 ? null : setActiveButton(2),
              child: TypeLogin(
                active: active == 2,
                text: 'STUDENT',
                textColor: Color(0xFFFF9452),
                image: 'assets/icons/student-icon.png',
              ),
            ),
            SizedBox(height: 10),
            RaisedButton(
              elevation: 0,
              color: Theme.of(context).primaryColorDark,
              // splashColor: active == 3 ? Theme.of(context).primaryColorDark : Theme.of(context).primaryColorLight,
              onPressed: () => active == 3 ? null : setActiveButton(3),
              padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
              child: TypeLogin(
                active: active == 3,
                text: 'TEACHER',
                textColor: Color(0xFF0091A2),
                image: 'assets/icons/teacher-icon.png',
              ),
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
