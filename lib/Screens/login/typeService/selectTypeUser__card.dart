import 'package:flutter/material.dart';

class TypeLogin extends StatefulWidget {
  final String text;
  final Color textColor;
  final String image;
  final bool active;
  TypeLogin({
    this.active,
    this.text,
    this.textColor,
    this.image,
  });
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
      margin: EdgeInsets.only(right: 15, left: 15),
      width: MediaQuery.of(context).size.width / 4 - 20,
      height: MediaQuery.of(context).size.width / 4,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: widget.active
                  ? MediaQuery.of(context).size.width / 4 - 20
                  : MediaQuery.of(context).size.width / 4 - 28,
              height: widget.active
                  ? MediaQuery.of(context).size.width / 4 - 20
                  : MediaQuery.of(context).size.width / 4 - 28,
              decoration: BoxDecoration(
                color: Colors.amber[200],
                borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width / 4,
                ),
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: ExactAssetImage(
                    widget.image,
                  ),
                ),
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
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      fontSize: 16,
                      color: widget.textColor,
                      fontFamily: 'TodaySHOPBold'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
