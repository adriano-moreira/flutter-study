import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_of_the_week/widgets/util.dart';

main() {
  run(TransformStudy());
}

class TransformStudy extends StatelessWidget {
  Widget apply(Widget Function(Widget) fn) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Stack(
        children: [
          _Child(),
          fn(
            Opacity(
              opacity: 0.75,
              child: _Child(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          children: [
            apply(
              (child) => Transform.rotate(
                angle: pi / 4,
                child: child,
              ),
            ),
            apply(
              (child) => Transform.scale(
                scale: .5,
                child: child,
              ),
            ),
            apply(
              (child) => Transform.translate(
                offset: Offset(20, 20),
                child: child,
              ),
            ),
            apply(
              (child) => Transform(
                transform: Matrix4.skewX(-.3),
                child: child,
              ),
            ),
            apply(
              (child) => Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.01)
                  ..rotateX(0.6),
                alignment: FractionalOffset.center,
                child: child,
              ),
            ),
            apply(
              (child) => Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.01)
                  ..rotateX(-0.6),
                alignment: FractionalOffset.center,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Child extends StatelessWidget {
  final Color color;

  const _Child({
    Key? key,
    this.color = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: color,
        width: 100,
        height: 100,
        child: Icon(
          Icons.account_balance,
          size: 100,
        ),
      ),
    );
  }
}
