import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          height: 50,
          child: ElevatedButton(
            onPressed: _onPressed,
            child: Text("foo"),
          ),
        ),
      ),
    );
  }

  void _onPressed() {
    final route = MyCustomPageRoute((context) => PageA());
    Navigator.of(context).push(route);
  }
}

class MyCustomPageRoute extends PageRouteBuilder {
  final WidgetBuilder builder;

  MyCustomPageRoute(this.builder)
      : super(
          pageBuilder: _createPageBuilder(builder),
        );

  static RoutePageBuilder _createPageBuilder(WidgetBuilder builder) {
    return (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) {
      return Provider(
        create: (BuildContext context) => MyCustomScaffoldConfig(animation),
        child: builder(context),
      );
    };
  }
}

class MyCustomScaffoldConfig {
  final Animation<double> animation;

  MyCustomScaffoldConfig(this.animation);
}

class MyCustomScaffold extends StatelessWidget {
  final Widget? title;
  final Widget? body;

  const MyCustomScaffold({
    Key? key,
    this.title,
    this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = Provider.of<MyCustomScaffoldConfig>(context);
    return Builder(
      builder: (BuildContext context) {
        return _MyCustomScaffold(
          title: title ?? Container(),
          body: body ?? Container(),
          animation: config.animation,
        );
      },
    );
  }
}

class _MyCustomScaffold extends StatelessWidget {
  final Widget title;
  final Widget body;
  final Animation<double> animation;

  const _MyCustomScaffold({
    Key? key,
    required this.title,
    required this.body,
    required this.animation,
  }) : super(key: key);

  final topHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // appBar: AppBar(),
      body: AnimatedBuilder(
        animation: animation,
        child: body,
        builder: (BuildContext context, Widget? child) {
          var height = MediaQuery.of(context).size.height;
          return Stack(
            children: [
              Positioned(
                bottom: -height + height * animation.value,
                child: ScaleTransition(
                  scale: animation,
                  child: child ?? Container(),
                ),
              ),
              Positioned(
                top: -topHeight + topHeight * animation.value,
                child: _header(context),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _header(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: topHeight,
        child: Material(
          color: Colors.orange,
          elevation: 20,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          child: Container(
            child: Center(
              child: title,
            ),
          ),
        ),
      ),
    );
  }
}

class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      title: _title(),
      body: _body(context),
    );
  }

  Text _title() => Text("Header");

  Widget _body(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Container(
      color: Colors.grey,
      width: mq.size.width,
      height: mq.size.height,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
      ),
    );
  }
}
