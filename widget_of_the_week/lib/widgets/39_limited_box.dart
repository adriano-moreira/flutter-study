import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LimitedBoxStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          for (var i = 0; i < 10; i++)
            LimitedBox(
              maxHeight: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: randomColor(),
                  // child: Text('item $i'),
                ),
              ),
            )
        ],
      ),
    );
  }

  Color randomColor() {
    final colors = [
      Colors.amber,
      Colors.black12,
      Colors.blue,
      Colors.green,
    ];
    final i = Random().nextInt(colors.length - 1);
    return colors[i];
  }
}
