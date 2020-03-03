
import 'package:flutter/material.dart';

class HotListView extends StatefulWidget {
  HotListView({Key key}) : super(key: key);

  @override
  _HotListViewState createState() => _HotListViewState();
}

class _HotListViewState extends State<HotListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("热门"),
    );
  }
}