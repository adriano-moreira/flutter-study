import 'package:flutter/material.dart';

class RotatedBoxStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RotatedBox(
          quarterTurns: 3,
          child: Text('Any widget here'),
        ),
      ),
    );
  }
}
