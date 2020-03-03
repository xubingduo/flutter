import 'package:flutter/material.dart';
import '../found_vcs/hot_page.dart';
import '../found_vcs/focus_page.dart';
import '../found_vcs/question_page.dart';
import '../found_vcs/avtivite_page.dart';

class CategoryPage  extends StatelessWidget {
  const CategoryPage ({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        
        appBar: AppBar(
          title: Text("发现",style: TextStyle(
            color: Colors.black
          )),
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 4.0,
            tabs: <Widget>[
              Tab(text: "热门"),
              Tab(text: "关注"),
              Tab(text: "问答"),
              Tab(text: "活动"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            HotListView(),
            FocusListView(),
            QuestionListView(),
            ActiviteListView()
          ],
        ),
      ),
    );
     
  }
}