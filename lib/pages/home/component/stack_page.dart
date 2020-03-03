import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StackCardPage extends StatefulWidget {
  StackCardPage({Key key}) : super(key: key);

  @override
  _StackCardPageState createState() => _StackCardPageState();
}

class _StackCardPageState extends State<StackCardPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Stack (
      alignment:Alignment.topLeft,
      children: <Widget>[
        Container (
          margin: EdgeInsets.only( bottom: ScreenUtil().setHeight(40)),
          child: Container (
          child: InkWell (
            child: Card (
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10))
              ),
              elevation: 5.0,
              child: Container (
                width: ScreenUtil().setWidth(700),
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container (
                      height: ScreenUtil().setWidth(457),
                      child: Image.asset(
                        'assets/images/demo1.png',
                        width: ScreenUtil().setWidth(700),
                        height: ScreenUtil().setWidth(457),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(22),
                        top: ScreenUtil().setHeight(22),
                        bottom: ScreenUtil().setHeight(28)
                      ),
                      child: Text(
                        '我是不是得了肠道易激综合征？',
                        style: TextStyle (
                          fontSize: ScreenUtil().setSp(31),
                          color: Color.fromRGBO(51,51,51,1),
                          fontWeight: FontWeight.w800
                        ),
                      )
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(22),
                        right: ScreenUtil().setWidth(22),
                        bottom: ScreenUtil().setHeight(28)
                      ),
                      child: Text(
                        '叶酸不仅仅是孕妇的专有营养液，事实上在我们的整个生命周期中都起到了非常重要的作用...',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle (
                          fontSize: ScreenUtil().setSp(25),
                          color: Color.fromRGBO(51,51,51,1),
                        ),
                      )
                    ),

                    Container (
                      padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(22),
                        right: ScreenUtil().setWidth(22),
                        bottom: ScreenUtil().setHeight(40)
                      ),
                      child: Row (
                        children: <Widget>[
                          Container (
                            padding: EdgeInsets.only( right: 10),
                            child: Row (
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/eyeIcon.png',
                                  width: ScreenUtil().setWidth(45),
                                  height: ScreenUtil().setWidth(36),
                                ),
                                Text (
                                  ' 8411',
                                  style: TextStyle (
                                    fontSize: ScreenUtil().setSp(24),
                                    color: Color.fromRGBO(153,153,153,1)
                                  ),
                                )
                              ],
                            ),
                          ),

                          Container (
                            child: Row (
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/questionIcon.png',
                                  width: ScreenUtil().setWidth(45),
                                  height: ScreenUtil().setWidth(36),
                                ),
                                Text (
                                  ' 8411',
                                  style: TextStyle (
                                    fontSize: ScreenUtil().setSp(24),
                                    color: Color.fromRGBO(153,153,153,1)
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

        Positioned(
          child: Container (
            child: Image.asset(
              'assets/images/tag01.png',
              width: ScreenUtil().setWidth(138),
              height: ScreenUtil().setHeight(68),
            )
          )
        )
        
      ],
    );
  }
}