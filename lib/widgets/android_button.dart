import 'package:flutter/material.dart';

class AndroidButton extends StatelessWidget {
  final onPressed;
  final child;
  final elevation;

  AndroidButton({this.onPressed, this.child, this.elevation = 3.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: elevation,
        onPressed: onPressed,
        color: Theme.of(context).primaryColor,
        child: child,
        splashColor: Theme.of(context).accentColor,
      ),
    );
  }
}
