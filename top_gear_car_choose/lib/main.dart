import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:top_gear_car_choose/domain/car.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Scaffold(
      //   body: ChooseCarPage(
      //     cars: getCars(),
      //   ),
      // ),
      home: Demo(),
    );
  }
}

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Center(
        child: Container(
          width: 500,
          height: 500,
          child: CustomPaint(
            painter: MyPainter(),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    canvas.drawCircle(center, center.dx, Paint()..color = Colors.amberAccent);

    for (double i = 0; i < 12; i++) {
      final angle = ((pi * 2) / 12) * i;
      print({'i':i, 'angle': angle});
      final p1 = getOffset(center.dx - 30, angle).move(center);
      final p2 = getOffset(center.dx - 10, angle).move(center);
      canvas.drawLine(p1, p2, paint);
    }

  }

  Offset getOffset(double radius, double angle) {
    double dx = cos(angle) * radius;
    double dy = sin(angle) * radius;
    return Offset(dx, dy);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

extension on Offset {
  Offset move(Offset offset) {
    return Offset(
      this.dx + offset.dx,
      this.dy + offset.dy,
    );
  }
}

class ChooseCarPage extends StatefulWidget {
  final List<Car> cars;

  ChooseCarPage({
    required this.cars,
  });

  @override
  _ChooseCarPageState createState() => _ChooseCarPageState();
}

class _ChooseCarPageState extends State<ChooseCarPage> {
  late Car currentCar;

  @override
  void initState() {
    super.initState();
    currentCar = widget.cars[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [for (final c in widget.cars) _buildCarButton(c)],
            ),
            CarDetail(
              car: currentCar,
              higherMaxSpeed: widget.cars.map((e) => e.maxSpeed).reduce(max),
              higherTime0to100:
                  widget.cars.map((e) => e.time0to100).reduce(max),
              higherTireGrip: widget.cars.map((e) => e.tireGrip).reduce(max),
              higherFuelConsumption:
                  widget.cars.map((e) => e.fuelConsumption).reduce(max),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarButton(Car c) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            currentCar = c;
          });
        },
        child: Text(c.color),
      ),
    );
  }
}

class CarDetail extends StatelessWidget {
  final Car car;
  final num higherMaxSpeed;
  final num higherTime0to100;
  final num higherTireGrip;
  final num higherFuelConsumption;

  const CarDetail({
    Key? key,
    required this.car,
    required this.higherMaxSpeed,
    required this.higherTime0to100,
    required this.higherTireGrip,
    required this.higherFuelConsumption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('max speed: ${car.maxSpeed}'),
          BarValue(
            value: car.maxSpeed / higherMaxSpeed,
          ),
          Text('time 0 to 100: ${car.time0to100}'),
          BarValue(
            value: car.time0to100 / higherTime0to100,
          ),
          Text('tire grip: ${car.tireGrip}'),
          BarValue(
            value: car.tireGrip / higherTireGrip,
          ),
          Text('fuel consumption: ${car.fuelConsumption}'),
          BarValue(
            value: car.fuelConsumption / higherFuelConsumption,
          ),
        ],
      ),
    );
  }
}

class BarValue extends StatelessWidget {
  final double value;

  BarValue({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 30,
      color: Colors.grey,
      child: Align(
        alignment: Alignment.centerLeft,
        child: LayoutBuilder(
          builder: (_, constraints) {
            return AnimatedContainer(
              width: constraints.maxWidth * value,
              color: Colors.black,
              curve: Curves.ease,
              duration: Duration(
                seconds: 1,
              ),
            );
          },
        ),
      ),
    );
  }
}
