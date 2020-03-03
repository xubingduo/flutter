import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './login_component/input_component.dart';
import 'dart:async';
import 'dart:ui';

class ForgetPage extends StatefulWidget {
  ForgetPage({Key key}) : super(key: key);

  @override
  _ForgetPageState createState() => _ForgetPageState();
}

class _ForgetPageState extends State<ForgetPage> {
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerCode = TextEditingController();
  Timer _timer;
  int _countdownTime = 0;
  bool _canClick = true;

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _canClick = true;
      _timer.cancel();
    }
  }

  void startCountdownTimer() {
    const oneSec = const Duration(seconds: 1);
    var callback = (timer) => {
      setState(() {
        if (_countdownTime < 1) {
          _timer.cancel();
          _canClick = true;
        } else {
          _countdownTime = _countdownTime - 1;
        }
      })
    };
    _timer = Timer.periodic(oneSec, callback);
  }

  void clickTimer() {
    if (_canClick) {
      setState(() {
        _countdownTime = 60;
        _canClick = false;
      });
      //开始倒计时
      startCountdownTimer();
    }
    print(_controllerPhone.text);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(

      body: GestureDetector(
        onTap: () {
          // 触摸收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
                Container(
                  height: (MediaQuery.of(context).size.height),
                  color: Colors.white,
                  child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container (
                        child: Column (
                          children: <Widget>[
                            navigationlBarBox(context),
                            headerComponent(),
                            tabBarBodyComponent(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: imageBgComponent(),
              )
            ],
          )
        )
      )
    );
  }

  Widget navigationlBarBox(context) {
    return Container (
      margin: EdgeInsets.only( top: 20 ),
      height: 80.0,
      child: Row (
        children: <Widget>[
          InkWell (
            onTap: () {
               Navigator.pop(context);
            },
            child: Icon(Icons.arrow_left, size: 60,),
          ),
          Text('重置密码', style: TextStyle (
            color: Color.fromRGBO(51, 51, 51, 1),
            fontSize: 24.0
          ),)
        ],
      ),                
    );
  }

  // 组件头部
  Widget headerComponent() {
    return Container(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(80),
        bottom: ScreenUtil().setHeight(40)
      ),
      child: Center(
        child: Text(
          '重新设置新密码', 
          style: TextStyle(
            fontSize: ScreenUtil().setSp(60),
            color: Color.fromRGBO(50, 50, 50, 1.0)
          ),
        ),
      ),
    );
  }

  Widget tabBarBodyComponent() {
    return Container(
        height: ScreenUtil().setHeight(800),
        child: Column(
        children: <Widget>[
          phoneCodeComponent(),
        ],
      ),
    );
  }

  // 手机验证码登录
  Widget phoneCodeComponent() {
    return Container(
      child: Column(
        children: <Widget>[
          InputComponent(
            title: '手机号码', 
            hintText: '请输入手机号', 
            controller: _controllerPhone,
            keyboardType: TextInputType.phone,
          ),
          codeBtnInputComponent(),
          InputComponent(
            title: '新密码', 
            hintText: '前填写新密码', 
            controller: _controllerPhone,
          ),
          btnComponent(),
        ],
      ),
    );
  }

  // 验证码加发送验证码
  Widget codeBtnInputComponent() {
    return Stack(
      children: <Widget>[
        InputComponent(
          title: '验证码', 
          hintText: '请输入验证码', 
          controller: _controllerCode
        ),
        Positioned(
          top: ScreenUtil().setHeight(50),
          right: ScreenUtil().setWidth(10),
          child: Container(
            width: ScreenUtil().setWidth(160),
            height: ScreenUtil().setHeight(60),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromRGBO(247,182,67,1.0),
                  Color.fromRGBO(255,213,99,1.0)
                ]
              )
            ),
            child: InkWell(
              onTap: clickTimer,
              child: Center(
                child: Text(
                  _countdownTime > 0 ? '$_countdownTime后重新获取' : '获取验证码',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(24)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }


  Widget btnComponent() {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(80)),
      child: InkWell(
        onTap: () {

        },
        child: Container(
          height: ScreenUtil().setHeight(90),
          width: ScreenUtil().setWidth(600),
          decoration: BoxDecoration(
            color: Color.fromRGBO(243, 156, 62, 1),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color.fromRGBO(247,182,67,1.0),
                Color.fromRGBO(255,213,99,1.0)
              ]
            )
          ),
          child: Center(
            child: Text(
              '登录',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(30), 
                color: Colors.white
              ),
            ),
          )
        )
      )
    );
  }

  Widget imageBgComponent() {
    return Container(
      child: Image.asset(
        'assets/images/loginBg.png',
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.contain,
      )
    );
  }

}