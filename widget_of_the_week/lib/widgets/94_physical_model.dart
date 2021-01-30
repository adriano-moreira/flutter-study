import 'package:flutter/material.dart';

class PhysicalModelStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: PhysicalModel(
              elevation: 10,
              color: Colors.black,
              child: _Box(hf: .25, wf: .5),
            ),
          ),
          Center(
            child: PhysicalModel(
              elevation: 20,
              color: Colors.black,
              child: _Box(hf: .5, wf: .25),
            ),
          ),
        ],
      ),
    );
  }
}

class _Box extends StatelessWidget {
  final double hf;
  final double wf;

  const _Box({
    Key? key,
    required this.hf,
    required this.wf,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: hf,
      widthFactor: wf,
      child: Container(
        color: Colors.green,
      ),
    );
  }
}
