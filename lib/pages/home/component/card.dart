import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CardBoxBg extends StatefulWidget {
  final String title;
  final String subTitle;
  final Function onPress;
  final int type;
  CardBoxBg({
    Key key, 
    this.title,
    this.subTitle,
    this.onPress,
    this.type
  }) : super(key: key);

  @override
  _CardBoxBgState createState() => _CardBoxBgState();
}

class _CardBoxBgState extends State<CardBoxBg> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return InkWell (
      child: Container (
        width: ScreenUtil().setWidth(350),
        height: ScreenUtil().setHeight(198),
        padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(20),
          left: ScreenUtil().setSp(20)
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("${widget.type == 1 ? 'assets/images/navBox2.png' : 'assets/images/navBox1.png'}"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column (
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.title ?? '快速咨询',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(30),
                color: Colors.white
              ),
            ),
            Text(
              widget.subTitle ?? '专业团队 即时回复',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(24),
                color: Colors.white
              ),
            ),
            Container (
              width: 20,
              height: 3,
              color: Colors.white,
              margin: EdgeInsets.only(top: 5),
              child: null,
            )
          ]
        ),
      )
    );
  }
}