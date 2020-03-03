import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './component/title.dart';
import './component/card.dart';
import './component/card_img.dart';
import './component/stack_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  final TextEditingController _controllerText = TextEditingController();
  
  //储存图片数据
  List<Map<String, String>> imgList = [
    {'text': '减肥瘦身', 'img': 'assets/images/reduceWeight.png'},
    {'text': '孕妈宝贝', 'img': 'assets/images/pregnantMother.png'},
    {'text': '儿童成长', 'img': 'assets/images/children.png'},
    {'text': '运动营养', 'img': 'assets/images/sportsNutrition.png'},
    {'text': '老年营养', 'img': 'assets/images/elderlyNutrition.png'},
    {'text': '慢性病', 'img': 'assets/images/chronicDisease.png'},
    {'text': '亚健康', 'img': 'assets/images/SubHealth.png'},
    {'text': '食品安全', 'img': 'assets/images/foodSafety.png'},
    {'text': '保健食品', 'img': 'assets/images/healthFood.png'},
    {'text': '全部分类', 'img': 'assets/images/allCategories.png'},
  ];

  @override
  void initState() {
    super.initState();
    print('首页');
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Container(
          child: Column(
            children: <Widget>[
              headerBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      navGrid(context),
                      TitleBar(title: '服务优选', showBtn: false),
                      navBox(),
                      advance(),
                      TitleBar(title: '专家团队', showBtn: true),
                      listRowPage(),
                      TitleBar(title: '精选', showBtn: false),
                      StackCardPage()
                    ],
                  ),
                )
              )
            ],
          ),
        ),
      )
    );
  }

  Widget headerBar() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      height: ScreenUtil().setHeight(132),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
            child: Row(
              children: <Widget>[
                Text('北京'),
                Icon(Icons.arrow_drop_down)
              ],
            ),
          ),

          Container(
            height: ScreenUtil().setHeight(105),
            width: ScreenUtil().setWidth(580),
            decoration: BoxDecoration(
              color: Color.fromRGBO(242,242,242,1),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              )
            ),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(25),
                    right: ScreenUtil().setWidth(15)
                  ),
                  child: Image.asset(
                    'assets/images/indexSearch.png',
                    width: ScreenUtil().setWidth(26),
                    height: ScreenUtil().setWidth(26),
                    fit: BoxFit.contain,
                  ),
                ),
                

                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                  width: ScreenUtil().setWidth(500),
                  child: TextField(
                    controller: _controllerText,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '请输入关键词',
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(102,102,102,1),
                        fontSize: ScreenUtil().setSp(28)
                      )
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
            child: Stack(
              children: <Widget>[
                Container(
                  child: Image.asset(
                    'assets/images/indexTips.png',
                    width: ScreenUtil().setWidth(28),
                    height: ScreenUtil().setWidth(34),
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: ScreenUtil().setWidth(25),
                    height: ScreenUtil().setHeight(25),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius:  BorderRadius.all(
                        Radius.circular(ScreenUtil().setWidth(25)),
                      ),
                    ),
                    child: Center(
                      child: Text('3', 
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget navGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        childAspectRatio: 1,
      ), 
      itemCount: imgList.length,
      itemBuilder: (BuildContext context, int index) {

        return InkWell(
          onTap: () {
            print('hrllo-$index');
          },
          child: Column(
            children: <Widget>[
              Image.asset(
                imgList[index]['img'],
                width: ScreenUtil().setWidth(100),
                height: ScreenUtil().setWidth(100),
                fit: BoxFit.contain,
              ),
              Text(
                imgList[index]['text'],
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                  color: Color.fromRGBO(51,51,51,1)
                ),
              )
            ],
          ),
        );
      } 
    );
  }

  Widget navBox() {
    return Container (
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(15),
        right: ScreenUtil().setWidth(15),
      ),
      child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CardBoxBg(type: 1),
          CardBoxBg(
            type: 2, 
            title: '营养课堂', 
            subTitle: '一对一个性化管理'
          ),
        ]
      ),
    );
  }

  Widget advance() {
    return Container (
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(25),
        right: ScreenUtil().setWidth(25),
      ),
      child: InkWell (
        onTap: (){},
        child: Image.asset(
          'assets/images/advance.png',
          width: ScreenUtil().setWidth(700),
          height: ScreenUtil().setWidth(203),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget listRowPage() {
    return Container(
      height: ScreenUtil().setHeight(338),
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(25),
        right: ScreenUtil().setWidth(25),
        bottom: ScreenUtil().setHeight(25)
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImg(),
          CardImg(),
          CardImg(),
        ],
      ),
    );
  }
}