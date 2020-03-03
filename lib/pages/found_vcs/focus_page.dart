import 'package:flutter/material.dart';

class FocusListView extends StatefulWidget {
  FocusListView({Key key}) : super(key: key);

  @override
  _FocusListViewState createState() => _FocusListViewState();
}

class _FocusListViewState extends State<FocusListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("关注"),
    );
  }
}