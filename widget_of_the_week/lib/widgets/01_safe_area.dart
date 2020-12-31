import 'package:flutter/material.dart';

class SafeAreaStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ListTile(
            onTap: () => _open(context, false),
            title: Text('without SafeArea'),
          ),
          ListTile(
            onTap: () => _open(context, true),
            title: Text('with SafeArea'),
          ),
        ],
      ),
    );
  }

  _open(BuildContext context, bool withSafeArea) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        Widget content = _Content();
        if (withSafeArea) {
          content = SafeArea(child: content);
        }
        return Material(
          child: content,
        );
      },
    ));
  }
}

class _Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Content'),
            RaisedButton(
              child: Text('close'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
