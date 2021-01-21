import 'package:flutter/material.dart';

class NumbersGrid extends StatelessWidget {
  final rows = 6;
  final columns = 10;
  final List<num> selectedNumbers;

  NumbersGrid({
    this.selectedNumbers = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        for (var row = 1; row <= rows; row++)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var col = 1; col <= columns; col++) _text(row, col),
            ],
          ),
      ]),
    );
  }

  Widget _text(int row, int col) {
    final number = ((row  -1 )* 10 ) + col;
    final text = '$number'.padLeft(2, '0');
    final isSelected = this.selectedNumbers.contains(number);
    final TextStyle style = TextStyle(
      backgroundColor: isSelected ? Colors.black : Colors.white,
      color: isSelected ? Colors.white : Colors.red,
    );
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Text(
        '[$text]',
        style: style,
      ),
    );
  }
}
