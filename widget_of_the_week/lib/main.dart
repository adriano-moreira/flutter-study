import 'package:flutter/material.dart';
import 'package:widget_of_the_week/widgets.dart';

const title = 'Widget Of The Week';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final _names = widgets.keys.toList();
  final _builders = widgets.values.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: _names.length,
        itemBuilder: (context, index) {
          final name = _names[index];
          final builder = _builders[index];
          return HomeListItem(
            name: name,
            builder: builder,
          );
        },
      ),
    );
  }
}

class HomeListItem extends StatelessWidget {
  const HomeListItem({
    Key? key,
    required this.name,
    required this.builder,
  }) : super(key: key);

  final String name;
  final Widget Function(BuildContext context) builder;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text(name),
              ),
              body: builder(context),
            ),
          ),
        );
      },
    );
  }
}
