import 'package:flutter/material.dart';

class CounterTemplate extends StatelessWidget {
  CounterTemplate({
    Key? key,
    required this.title,
    required this.increment,
    required this.value,
  }) : super(key: key);

  final String title;
  final VoidCallback increment;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$value',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
