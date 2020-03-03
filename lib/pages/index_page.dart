import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './home/home_page.dart';
import './category/category_page.dart';
import './cart/cart_page.dart';
import './member/member_page.dart';
import './add/add_page.dart';


class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IndexPageState();
  }
}

class IndexPageState extends State<IndexPage> {
  //创建视图数组
  List<Widget> _viewList = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage(),
    AddPage()
  ]; 
  //数组索引，通过改变索引值改变视图
  int _index = 0;

  // 添加按鈕
  _openNewPage() {
    setState(() {
      _index = 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _openNewPage,
        child: Icon(
          Icons.add,
          color: Colors.white,
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //和底栏进行融合
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
          
      //   ],
      // ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white, //底部工具栏的颜色。
        shape: CircularNotchedRectangle(),
        //设置底栏的形状，一般使用这个都是为了和floatingActionButton融合，
        // 所以使用的值都是CircularNotchedRectangle(),有缺口的圆形矩形。
        child: Row(
          //里边可以放置大部分Widget，让我们随心所欲的设计底栏
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              // height: 83,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: 40.0,
                    child: InkWell(
                      onTap: () {
                          setState(() {
                          _index = 0;
                        });
                      },
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/dietitian.png",
                            width: 20.0,
                            height: 20.0,
                            //类似于Android的scaleType 此处让图片尽可能小 以覆盖整个widget
                            fit: BoxFit.contain,
                          ),
                          Text('hello', style: TextStyle(color: Colors.black, fontSize: 12.0),)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 40.0,
                    child: InkWell(
                      onTap: () {
                          setState(() {
                          _index = 1;
                        });
                      },
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/dietitian.png",
                            width: 20.0,
                            height: 20.0,
                            //类似于Android的scaleType 此处让图片尽可能小 以覆盖整个widget
                            fit: BoxFit.contain,
                          ),
                          Text('hello', style: TextStyle(color: Colors.black, fontSize: 12.0),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: 40.0,
                    child: InkWell(
                      onTap: () {
                          setState(() {
                          _index = 2;
                        });
                      },
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/dietitian.png",
                            width: 20.0,
                            height: 20.0,
                            //类似于Android的scaleType 此处让图片尽可能小 以覆盖整个widget
                            fit: BoxFit.contain,
                          ),
                          Text('hello', style: TextStyle(color: Colors.black, fontSize: 12.0),)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 40.0,
                    child: InkWell(
                      onTap: () {
                          setState(() {
                          _index = 3;
                        });
                      },
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/dietitian.png",
                            width: 20.0,
                            height: 20.0,
                            //类似于Android的scaleType 此处让图片尽可能小 以覆盖整个widget
                            fit: BoxFit.contain,
                          ),
                          Text('hello', style: TextStyle(color: Colors.black, fontSize: 12.0),)
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
      body: _viewList[_index],
    );
  }
}
