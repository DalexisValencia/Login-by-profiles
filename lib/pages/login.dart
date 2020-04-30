import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fourth_test_app/widgets/input.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

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
    Timer(
      Duration(seconds: 2), (){
        setState(() {
          showPageChild = true;
        });
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: showPageChild ? Stack(
        children: <Widget>[
          Positioned(
            top: MediaQuery.of(context).size.width*0.15,
            child: Column(
              children: <Widget>[
                AnimatedOpacity(
                  curve: Curves.easeInOutQuart,
                  opacity: showPageChild ? 1 : 0,
                  duration: Duration(milliseconds: 500),
                  child: Header(),
                ),
                AnimatedOpacity(
                  curve: Curves.easeInOutQuart,
                  opacity: showPageChild ? 1 : 0,
                  duration: Duration(milliseconds: 500),
                  child: SelectedTypeLogin(stateAnimation: false)
                )
              ],
            )
          ),
          Positioned(
            // top: MediaQuery.of(context).size.width*0.65,
            bottom: 0,
            child: AnimatedOpacity(
              curve: Curves.easeInOutQuart,
              opacity: showPageChild ? 1 : 0,
              duration: Duration(milliseconds: 500),
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: RegisterForm(stateAnimation: false),
              ),
            )
          )
        ],
      )
      : 
      Center(
        child: CircularProgressIndicator(
          backgroundColor: Theme.of(context).textSelectionColor,
          strokeWidth: 3,
        )
      )
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                'Sign up',
                style: Theme.of(context).textTheme.headline.copyWith(
                  fontFamily: 'TodaySHOPRegular',
                  color: Theme.of(context).textSelectionColor
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.width*0.07),
              child: Text(
                "WHO YOU ARE?",
                style: Theme.of(context).textTheme.title.copyWith(
                  fontSize: 17,
                  fontFamily: 'TodaySHOPBold',
                  color: Theme.of(context).primaryColorLight
                ),
              ),
            )
          ],
        ),
    );  
  }
}

class SelectedTypeLogin extends StatefulWidget {
  final stateAnimation;
  SelectedTypeLogin({this.stateAnimation});
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
    Timer(Duration(milliseconds:4000), (){
      startAnimation();
    });
  }
  startAnimation() {
    setState(() {
      widgetOwnAnimation = true;
    });
  }

  setActiveButton(number){
     print(number);
    setState(() {
      active = number;
    });
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOutQuart,
      duration: Duration(
        milliseconds: 500
      ),
      transform: Matrix4.translationValues(widgetOwnAnimation ? 0 : - MediaQuery.of(context).size.width,0, 0),
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
              padding: EdgeInsets.fromLTRB(0,3,0,3),
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
              padding: EdgeInsets.fromLTRB(0,3,0,3),
              color: Theme.of(context).primaryColorDark,
              // splashColor: active == 2 ? Theme.of(context).primaryColorDark : Theme.of(context).primaryColorLight,
              onPressed: () => active == 2 ? null : setActiveButton(2),
              child: TypeLogin(
                active: active == 2,
                text: 'STUDENT',
                textColor: Color(0xFFFF9452),
                image: 'assets/icons/student-icon.png',
              )
            ),
            SizedBox(height: 10),
            RaisedButton(
              elevation: 0,
              color: Theme.of(context).primaryColorDark,
              // splashColor: active == 3 ? Theme.of(context).primaryColorDark : Theme.of(context).primaryColorLight,
              onPressed: () => active == 3 ? null : setActiveButton(3),
              padding: EdgeInsets.fromLTRB(0,3,0,3),
                child: TypeLogin(
                  active:  active == 3,
                  text: 'TEACHER',
                  textColor: Color(0xFF0091A2),
                  image: 'assets/icons/teacher-icon.png',
                ),
            ),
            SizedBox(height: 10)
          ],
        )
      )
    );
  }
}
class RegisterForm extends StatefulWidget {
  final bool stateAnimation;
  RegisterForm({this.stateAnimation});
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool stateAnimationForm = false;
  bool activeKeyboard = false;
  bool disabeledFinal = true;
  final registerformKey = GlobalKey<FormState>();
  TextEditingController username;
  TextEditingController usermail;
  TextEditingController userPass1;
  TextEditingController userPass2;

  FocusNode usernameFocus;
  FocusNode userEmailFocus;
  FocusNode userPass1Focus;
  FocusNode userPass2Focus;

  nextInput(nextFocus) {
    FocusScope.of(context).requestFocus(nextFocus);
  }
  @override
  void initState() {
    super.initState();
    username  = TextEditingController();
    usermail  = TextEditingController();
    userPass1 = TextEditingController();
    userPass2 = TextEditingController();

    usernameFocus = FocusNode();
    userEmailFocus = FocusNode();
    userPass1Focus = FocusNode();
    userPass2Focus = FocusNode();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          activeKeyboard = visible;
        });
      },
    );
    setState(() {
       stateAnimationForm = widget.stateAnimation;
    });
    Timer(Duration(milliseconds:4000), (){
      startEasyAnimation();
    });
  }

  startEasyAnimation(){
    setState(() {
      stateAnimationForm = true;
    });
  }

  finish() {
    FocusScope.of(context).requestFocus(new FocusNode());//Quitamos el foco
    validateForm();
    if(disabeledFinal == false){
      print("Todos los datos son correctos");
    }
  }

  validateForm() {// Valida los campos del formulario
    if (username.text == '' || username.text == null) {
       showSnackBar('Ingresa un usuario');
       return;
    }

    if(usermail.text == '' || usermail.text == null){
      showSnackBar('Ingresa un email');
      return;
    }

    if(userPass1.text == '' || userPass1.text == null){
      showSnackBar('Ingresa una contraseña');
      return;
    }

    if(userPass2.text == '' || userPass2.text == null){
      showSnackBar('Por favor valida tu contraseña');
      return;
    }

    if (userPass1.text != userPass2.text) {
      showSnackBar('Las dos contraseña deben coincidir');
      return;
    }

    setState(() {
      disabeledFinal = false;
    });
  }

  showSnackBar(text) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).hoverColor,
        content: Text(
          text,
          style: Theme.of(context).textTheme.title.copyWith(
            color: Theme.of(context).textSelectionColor,
            fontSize: 12
          ),
        ),
      )
    );
    setState(() {
      disabeledFinal = true;
    });
  }
  
  @override
  void dispose() {
    super.dispose();
    usernameFocus.dispose();
    userEmailFocus.dispose();
    userPass1Focus.dispose();
    userPass2Focus.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return
      AnimatedContainer(
        curve: Curves.easeInOutQuart,
        transform: Matrix4.translationValues(stateAnimationForm ? 0 : MediaQuery.of(context).size.width,  0, 0),
        duration: Duration(
          milliseconds: 500
        ),
        child: Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width*0.05,
              left: MediaQuery.of(context).size.width*0.11,
              right: MediaQuery.of(context).size.width*0.11
            ),
            height: activeKeyboard == true ? MediaQuery.of(context).size.height*0.45 : MediaQuery.of(context).size.height*0.65,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).primaryColorDark,
            child: Form(
              key: registerformKey,
              child: Column(
                children: <Widget>[
                  CustomInput(
                    name: 'Username',
                    prefixIcon: Icons.account_circle,
                    inputController: username,
                    focus: usernameFocus,
                    textAction: TextInputAction.next,
                    onSubmit: () => nextInput(userEmailFocus),
                    obscure: false
                  ),
                  CustomInput(
                    name: 'Email',
                    prefixIcon: Icons.mail_outline,
                    inputController: usermail,
                    focus: userEmailFocus,
                    textAction: TextInputAction.next,
                    onSubmit: () => nextInput(userPass1Focus),
                    obscure: false
                  ),
                  CustomInput(
                    name: 'Password',
                    prefixIcon: Icons.lock,
                    inputController: userPass1,
                    focus: userPass1Focus,
                    textAction: TextInputAction.next,
                    onSubmit: () => nextInput(userPass2Focus),
                    obscure: true
                  ),
                  CustomInput(
                    name: 'Confirm Password',
                    prefixIcon: Icons.lock,
                    inputController: userPass2,
                    focus: userPass2Focus,
                    textAction: TextInputAction.send,
                    onSubmit: () => finish(),
                    obscure: true
                  ),
                  Visibility(
                    visible: !activeKeyboard,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height*0.03
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Theme.of(context).hoverColor, Theme.of(context).accentColor],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft
                        ),
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: RaisedButton(
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.8)
                        ),
                        elevation: 0,
                        color: Color(0x00000000),
                        splashColor: Theme.of(context).accentColor,
                        onPressed: () => validateForm(),
                        child: Text(
                          "SIGNUP",
                          style: Theme.of(context).textTheme.body1.copyWith(
                            color: Theme.of(context).textSelectionColor,
                            fontFamily: 'TodaySHOPRegular',
                            fontSize: 18
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ),
      );
  }
}


class TypeLogin extends StatefulWidget {
  final String text;
  final Color textColor;
  final String image;
  final bool active;
  TypeLogin({this.active, this.text, this.textColor, this.image});
  @override
  _TypeLoginState createState() => _TypeLoginState();
}

class _TypeLoginState extends State<TypeLogin> {
  bool active;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right:15, left: 15),
      width: MediaQuery.of(context).size.width / 4 - 20,
      height: MediaQuery.of(context).size.width / 4,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: AnimatedContainer(
              duration: Duration(
                milliseconds: 300
              ),
              width: widget.active ? MediaQuery.of(context).size.width / 4 - 20 : MediaQuery.of(context).size.width / 4 - 28,
              height: widget.active ? MediaQuery.of(context).size.width / 4 - 20 : MediaQuery.of(context).size.width / 4 - 28,
              decoration: BoxDecoration(
                color: Colors.amber[200],
                borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width / 4
                ),
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: ExactAssetImage(widget.image)
                )
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.width / 4 - 20,
            child: Container(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
              width: MediaQuery.of(context).size.width / 4 - 20,
              height: 18,
              child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                '${widget.text}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline.copyWith(
                  fontSize: 16,
                  color: widget.textColor,
                  fontFamily: 'TodaySHOPBold'
                ),
                ),
            ),
            ),
            )
        ],
      ),
    );
  }
}