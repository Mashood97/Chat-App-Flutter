import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final color;
  Loading(this.color);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitWave(
        color: color,
        size: 50.0,
      ),
    );
  }
}
