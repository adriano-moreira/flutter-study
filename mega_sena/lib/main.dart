import 'package:flutter/material.dart';
import 'package:mega_sena/generator.dart';
import 'package:mega_sena/numbers_grid.dart';

void main() {
  runApp(MyApp());
}

const Color primaryColor = Color(0xFF0A7E41);
const Color backGroundColor = Color(0xFFFBFBB5);
const String title = '🍀 Mega-Sena';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: MaterialColor(primaryColor.value, {
          50: primaryColor.withOpacity(.1),
          100: primaryColor.withOpacity(.2),
          200: primaryColor.withOpacity(.3),
          300: primaryColor.withOpacity(.5),
          500: primaryColor.withOpacity(.6),
          600: primaryColor.withOpacity(.7),
          700: primaryColor.withOpacity(.8),
          800: primaryColor.withOpacity(.9),
          900: primaryColor.withOpacity(1),
        }),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _getBody(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.5),
        currentIndex: tab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_on),
            label: 'Números',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Sobre',
          ),
        ],
        onTap: (v) {
          setState(() {
            tab = v;
          });
        },
      ),
    );
  }

  Widget _getBody() {
    if (tab == 0) {
      return NumbersWidget();
    }
    return AboutWidget();
  }
}

class NumbersWidget extends StatefulWidget {
  @override
  _NumbersWidgetState createState() => _NumbersWidgetState();
}

class _NumbersWidgetState extends State<NumbersWidget> {
  bool _started = false;
  List<num> selectedNumbers = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backGroundColor,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              RaisedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(_started ? Icons.stop : Icons.play_arrow),
                    Text(_started ? 'PARAR' : 'INICIAR'),
                  ],
                ),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                onPressed: () => _started ? _pause() : _start(),
              ),
              NumbersGrid(
                selectedNumbers: selectedNumbers,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _start() {
    setState(() {
      _started = true;
    });
    _tick();
  }

  _pause() {
    setState(() {
      _started = false;
    });
  }

  _generate() {
    setState(() {
      selectedNumbers = generateMegaSenaNumbers();
    });
  }

  _tick() {
    _generate();
    // TODO: change it to use Ticker
    Future.delayed(Duration(milliseconds: 10), () {
      if (_started) {
        _tick();
      }
    });
  }
}

class AboutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backGroundColor,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Este aplicativo é um gerador de números aleatorios para a Mega-Sena.',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                '🍀 Boa Sorte! 🍀',
                style: Theme.of(context).textTheme.headline5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
