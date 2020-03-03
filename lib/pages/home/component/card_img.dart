import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CardImg extends StatefulWidget {
  CardImg({Key key}) : super(key: key);

  @override
  _CardImgState createState() => _CardImgState();
}

class _CardImgState extends State<CardImg> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Container(
      width: ScreenUtil().setWidth(272),
      height: ScreenUtil().setHeight(338),
      color: Colors.red,
      child: InkWell (
        onTap: () {},
        child: Card (
          color: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10))
          ),
          elevation: 1.0,
          margin: EdgeInsets.only(right: ScreenUtil().setWidth(18)),
          child: Container (
            child: Column (
              children: <Widget>[
                Container (
                  padding: EdgeInsets.only( 
                    left: ScreenUtil().setWidth(5),
                    right: ScreenUtil().setWidth(5),
                  ),
                  width: ScreenUtil().setWidth(272),
                  height: ScreenUtil().setHeight(272),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/navBox2.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column (
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '张骁', 
                        style: TextStyle (
                          fontSize: ScreenUtil().setSp(27),
                          color: Colors.white
                        ),
                      ),
                      Text(
                        '连续从事本职业工作',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle (
                          fontSize: ScreenUtil().setSp(24),
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),

                Container (
                  padding: EdgeInsets.only( 
                    left: ScreenUtil().setWidth(5),
                    right: ScreenUtil().setWidth(5),
                  ),
                  child: Row (
                    children: <Widget>[
                      Text(
                        'data',
                          style: TextStyle (
                            fontSize: ScreenUtil().setSp(20),
                            color: Color.fromRGBO(72,108,176,1)
                          ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}