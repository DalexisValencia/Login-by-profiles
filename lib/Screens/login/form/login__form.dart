import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fourth_test_app/Screens/login/form/form__input.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class RegisterForm extends StatefulWidget {
  final bool stateAnimation;
  RegisterForm({
    this.stateAnimation,
  });
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
    username = TextEditingController();
    usermail = TextEditingController();
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
    Timer(
        Duration(
          milliseconds: 500,
        ), () {
      startEasyAnimation();
    });
  }

  startEasyAnimation() {
    setState(() {
      stateAnimationForm = true;
    });
  }

  finish() {
    FocusScope.of(context).requestFocus(new FocusNode()); //Quitamos el foco
    validateForm();
    if (disabeledFinal == false) {
      print("Todos los datos son correctos");
    }
  }

  validateForm() {
    // Valida los campos del formulario
    if (username.text == '' || username.text == null) {
      showSnackBar('Ingresa un usuario');
      return;
    }

    if (usermail.text == '' || usermail.text == null) {
      showSnackBar('Ingresa un email');
      return;
    }

    if (userPass1.text == '' || userPass1.text == null) {
      showSnackBar('Ingresa una contraseña');
      return;
    }

    if (userPass2.text == '' || userPass2.text == null) {
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
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: Theme.of(context).textSelectionColor,
                fontSize: 12,
              ),
        ),
      ),
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
    return AnimatedContainer(
      curve: Curves.easeInOutQuart,
      transform: Matrix4.translationValues(
        stateAnimationForm ? 0 : MediaQuery.of(context).size.width,
        0,
        0,
      ),
      duration: Duration(milliseconds: 500),
      child: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.05,
          left: MediaQuery.of(context).size.width * 0.11,
          right: MediaQuery.of(context).size.width * 0.11,
        ),
        height: activeKeyboard == true
            ? MediaQuery.of(context).size.height * 0.45
            : MediaQuery.of(context).size.height * 0.65,
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
                obscure: false,
              ),
              CustomInput(
                name: 'Email',
                prefixIcon: Icons.mail_outline,
                inputController: usermail,
                focus: userEmailFocus,
                textAction: TextInputAction.next,
                onSubmit: () => nextInput(userPass1Focus),
                obscure: false,
              ),
              CustomInput(
                name: 'Password',
                prefixIcon: Icons.lock,
                inputController: userPass1,
                focus: userPass1Focus,
                textAction: TextInputAction.next,
                onSubmit: () => nextInput(userPass2Focus),
                obscure: true,
              ),
              CustomInput(
                name: 'Confirm Password',
                prefixIcon: Icons.lock,
                inputController: userPass2,
                focus: userPass2Focus,
                textAction: TextInputAction.send,
                onSubmit: () => finish(),
                obscure: true,
              ),
              Visibility(
                visible: !activeKeyboard,
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(

                          // colors: [
                          //   Theme.of(context).hoverColor,
                          //   Theme.of(context).accentColor
                          // ],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft),
                      borderRadius: BorderRadius.circular(50)),
                  child: RaisedButton(
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.8)),
                    elevation: 0,
                    color: Color(0x00000000),
                    splashColor: Theme.of(context).accentColor,
                    onPressed: () => validateForm(),
                    child: Text(
                      "SIGNUP",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Theme.of(context).textSelectionColor,
                          fontFamily: 'TodaySHOPRegular',
                          fontSize: 18),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
