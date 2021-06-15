import 'package:flutter/material.dart';
import 'package:state_management_study/with_inherited_widget.dart';
import 'package:state_management_study/with_set_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management Study',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final pages = <String, WidgetBuilder>{
    'setState': (_) => WithSetStateCounterPage(),
    'InheritedWidget': (_) => WithInheritedWidgetCounterPage(),
  }.entries.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: pages.length,
          itemBuilder: (context, index) {
            final page = pages[index];
            return ListTile(
              title: Text(page.key),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: page.value,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
