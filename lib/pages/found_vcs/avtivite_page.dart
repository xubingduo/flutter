import 'package:flutter/material.dart';


class ActiviteListView extends StatefulWidget {
  ActiviteListView({Key key}) : super(key: key);

  @override
  _ActiviteListViewState createState() => _ActiviteListViewState();
}

class _ActiviteListViewState extends State<ActiviteListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("热门"),
    );
  }
}