import 'package:flutter_test/flutter_test.dart';

class Cell {
  final int value;
  final int x;
  final int y;

  Cell({
    required this.value,
    required this.x,
    required this.y,
  });
}

main() {
  test('', () {
    final board = <Cell>[];
    for (var x = 0; x < 9; x++) {
      for (var y = 0; y < 9; y++) {
        board.add(Cell(
          value: 1,
          x: x,
          y: y,
        ));
      }
    }
  });
}
