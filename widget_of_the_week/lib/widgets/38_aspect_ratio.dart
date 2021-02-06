import 'dart:math';

import 'package:flutter/material.dart';

class AspectRatioStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: _children(),
        ),
      ),
    );
  }

  List<Widget> _children() {
    Map<String, double> ratios = {
      '18/9': 18.0 / 9.0,
      '16/9': 16.0 / 9.0,
      'GoldenRatio': (1.0 + sqrt(5)) / 2.0,
      '16/10': 16.0 / 10.0,
      'A4': sqrt(2),
    };

    final resp = <Widget>[];
    ratios.forEach(
      (key, value) {
        resp.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: value,
              child: Container(
                color: Colors.lightBlueAccent,
                child: Center(
                  child: Column(
                    children: [
                      Text(key),
                      Text(value.toStringAsFixed(3)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    return resp;
  }
}
