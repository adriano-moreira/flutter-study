import 'package:top_gear_car_choose/domain/car.dart';

List<Car> getCars() {
  return [
    Car(
      color: 'red',
      maxSpeed: 235,
      time0to100: 6.1,
      tireGrip: 1,
      fuelConsumption: 3,
    ),
    Car(
      color: 'white',
      maxSpeed: 210,
      time0to100: 3.6,
      tireGrip: 3,
      fuelConsumption: 1,
    ),
    Car(
      color: 'purple',
      maxSpeed: 220,
      time0to100: 5.2,
      tireGrip: 1,
      fuelConsumption: 2,
    ),
    Car(
      color: 'cyan',
      maxSpeed: 220,
      time0to100: 4.5,
      tireGrip: 2,
      fuelConsumption: 2,
    ),
  ];
}
