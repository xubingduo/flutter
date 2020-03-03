import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// title 组件

class TitleBar extends StatefulWidget {
  final String title;
  final bool showBtn;
  final Function onPress;
  TitleBar({
    Key key, 
    this.title, 
    this.showBtn,
    this.onPress
  }) : super(key: key);

  @override
  _TitleBarState createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Container(
      height: ScreenUtil().setHeight(100),
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            widget.title?? '专家团队', 
            style: TextStyle(
              color: Color.fromRGBO(51,51,51,1),
              fontSize: ScreenUtil().setSp(30),
              fontWeight: FontWeight.w600
            ),
          ),
          widget.showBtn ? (
            InkWell(
              onTap: widget.onPress,
              child: Row (
                children: <Widget>[
                  Text('更多 '),
                  Image.asset(
                    'assets/images/moreArrows.png',
                    width: ScreenUtil().setWidth(26),
                    height: ScreenUtil().setWidth(26),
                    fit: BoxFit.contain,
                  ),
                ],
              )
            )
          ) : Container (
            child: null,
          )
          
        ],
      ),
    );
  }
}