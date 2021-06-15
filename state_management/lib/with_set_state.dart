import 'package:flutter/widgets.dart';
import 'package:state_management_study/template.dart';

class WithSetStateCounterPage extends StatefulWidget {
  const WithSetStateCounterPage({
    Key? key,
  }) : super(key: key);

  @override
  _WithSetStateCounterPageState createState() => _WithSetStateCounterPageState();
}

class _WithSetStateCounterPageState extends State<WithSetStateCounterPage> {
  var value = 0;

  void increment() {
    setState(() {
      value++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterTemplate(
      title: 'setState',
      increment: increment,
      value: value,
    );
  }
}

