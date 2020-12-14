import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String name;
  final IconData prefixIcon;
  final TextEditingController inputController;
  final FocusNode focus;
  final TextInputAction textAction;
  final Function onSubmit;
  final bool obscure;

  CustomInput({
    this.name,
    this.prefixIcon,
    this.inputController,
    this.focus,
    this.textAction,
    this.onSubmit,
    this.obscure
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.width*0.05
        ),
      child: TextFormField(
        controller: inputController,
        obscureText: obscure,
        style: TextStyle(
          color: Theme.of(context).primaryColorLight
        ),
        focusNode: focus,
        onFieldSubmitted: (val) => onSubmit(),
        // onEditingComplete: onSubmit(),
        textInputAction: textAction,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: new BorderSide(
              color: Theme.of(context).primaryColorLight,
              width: 1
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: new BorderSide(
              color: Theme.of(context).primaryColorLight,
              width: 1
            )
          ),
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            prefixIcon,
            color: Theme.of(context).primaryColorLight,
          ),
          hintText: this.name,
          hintStyle: TextStyle(
            fontFamily: 'TodaySHOPRegular',
            color: Theme.of(context).primaryColorLight
          ),
        ),
      ),
    );
  }
}