import 'package:flutter/material.dart';

class FullPanel extends StatefulWidget {
  FullPanel({Key key}) : super(key: key);

  @override
  _FullPanelState createState() => _FullPanelState();
}

class _FullPanelState extends State<FullPanel> {
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Text('Play something from your library!')
        );
  }
}