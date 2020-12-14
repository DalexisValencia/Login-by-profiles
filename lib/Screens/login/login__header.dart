import 'package:flutter/material.dart';

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
              style: Theme.of(context).textTheme.headline5.copyWith(
                    fontFamily: 'TodaySHOPRegular',
                    color: Theme.of(context).textSelectionColor,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * 0.07,
            ),
            child: Text(
              "WHO YOU ARE?",
              style: Theme.of(context).textTheme.headline6.copyWith(
                    fontSize: 17,
                    fontFamily: 'TodaySHOPBold',
                    color: Theme.of(context).primaryColorLight,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
