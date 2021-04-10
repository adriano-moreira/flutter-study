import 'package:flutter/material.dart';

class ExpansionPanelStudy extends StatefulWidget {
  @override
  _ExpansionPanelStudyState createState() => _ExpansionPanelStudyState();
}

class _ExpansionPanelStudyState extends State<ExpansionPanelStudy> {
  var _expanded = <int>[];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: ExpansionPanelList(
        children: [
          for (var i = 1; i <= 10; i++)
            ExpansionPanel(
              isExpanded: _expanded.contains(i),
              headerBuilder: (context, isExpanded) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Item $i title'),
                );
              },
              body: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Item $i body'),
                ),
              ),
            ),
        ],
        expansionCallback: (panelIndex, isExpanded) {
          var i = panelIndex + 1;
          if(!isExpanded) {
            _expanded.add(i);
          } else {
            _expanded.remove(i);
          }
          setState(() {});
        },
      ),
    );
  }
}
