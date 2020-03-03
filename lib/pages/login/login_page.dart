import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './login_component/input_component.dart';
import 'dart:async';
import '../../request/request.dart';
import 'dart:math';
import '../../util/utl.dart';
import '../../util/router_util.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  TabController _tabController;
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerCode = TextEditingController();
  final TextEditingController _invitationCode = TextEditingController();
  final TextEditingController _controllerPwd = TextEditingController();
  Timer _timer;
  int _countdownTime = 0;
  bool _canClick = true;
  String _codeV = '';

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
    if (_timer != null) {
      _canClick = true;
      _timer.cancel();
    }
  }

  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    //TabBar监听器
    _tabController.addListener(() => _onTabChanged());
    // 查看是否有数据
    getLocalData();
  }
  // 页面滚动监听
  _onTabChanged() {
    FocusScope.of(context).requestFocus(FocusNode());
    _controllerPhone.text = '';
    _controllerCode.text = '';
    _invitationCode.text = '';
    _controllerPwd.text = '';
  }

  // 倒计时
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

  // 点击获取验证码
  void clickTimer() {
    if (_canClick) {
      setState(() {
        _countdownTime = 60;
        _canClick = false;
      });
      //开始倒计时
      startCountdownTimer();
    }
  }

  // 获取验证码
  void getVerifyCode() {
    String phone = _controllerPhone.text;
    var random = Random();
    var code = (random.nextInt(9000) + 1000).toString();
    setState(() {
      _codeV =  code;
    });
    if(phone.isEmpty) {
      showToast('手机号码不能为空', context);
      return;
    } else {
      if(phone.length != 11) {
        showToast('手机号码11位哦', context);
        return;
      }
    }

    DioManager.getInstance().get('/tc-user/user/getVerifyCode', {
      'phone': phone,
      'type': 1,
      'noncestr': code
    }).then((data) {
      if (data['success']) {
        showToast('发送成功', context);
        clickTimer();
      } else {
        showToast(data['appMsg'], context);
      }
    }).catchError((onError) {
      print(onError);
    });
  }

  // 登录
  void loginFunc(type) {
    String phone = _controllerPhone.text;
    String pwd = _controllerPwd.text;
    String invitation = _invitationCode.text;
    String code = _controllerCode.text;
    Map<String,String> mapData = {
      'phone': '13454735035',
      'password': '123456',
      'loginType': type,
      'inviteCode': '',
      'deviceCode': '33528d5211d7584c8fbb303b62d74214b5ea0667b44bee60c267cfe0281ef9e6',
      'source': '2',
      'noncestr': _codeV
    };

    if(phone.isEmpty) {
      showToast("手机号码不能为空", context);
      return;
    } else {
        if(phone.length != 11) {
        showToast('手机号码11位哦', context);
        return;
      }
    }
    mapData['phone'] = phone;

    //手机验证码登录
    if(type == '1') {
      if(code.isEmpty) {
        showToast('验证码不为空', context);
        return;
      } else {
        mapData["verifyCode"] = code;
      }

      if(invitation.isEmpty) {
        showToast('邀请码不为空', context);
        mapData["inviteCode"] = invitation;
        return;
      } else {

      }
    } else {
      // 普通验证码登录
      if(pwd.isEmpty) {
        showToast('密码不能为空', context);
        return;
      } else {
        mapData['password'] = generateMd5(generateMd5(pwd));
      }
    }
    FocusScope.of(context).requestFocus(FocusNode());
    DioManager.getInstance().post('/tc-user/user/login', mapData).then((data) {
      print('夜场梦回对哦$data');
      if(data['success']) {
        String strData = data['result'].toString();
        saveLoginData(strData);
        print("-------------$strData ----------------");
        NavigatorUtil.goIndexPage(context);
      } else {
        showToast(data['appMsg'], context);
      }
    }).catchError((onError){
      print(onError);
    });

  }

  // 存储数据
  saveLoginData(str) async {
    print('obj ------------ $str');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('loginData',  str);
      NavigatorUtil.goIndexPage(context);
  }

  // 获取登录数据
  getLocalData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String counter = prefs.getString('loginData');
    if(counter != null) {
      NavigatorUtil.goIndexPage(context);
    }

    print('我是存储数据');
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
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                  children: <Widget>[
                    headerComponent(),
                    tabBarHeaderComponent(context),
                    tabBarBodyComponent(),
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

  // 组件头部
  Widget headerComponent() {
    return Container(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(80),
        bottom: ScreenUtil().setHeight(40)
      ),
      child: Center(
        child: Text(
          '欢迎您', 
          style: TextStyle(
            fontSize: ScreenUtil().setSp(60),
            color: Color.fromRGBO(50, 50, 50, 1.0)
          ),
        ),
      ),
    );
  }

  Widget tabBarHeaderComponent(context) {
    return Container(
      child: TabBar(
        tabs: <Widget>[
          Tab(text: '手机验证码登录'),
          Tab(text: '普通密码登录')
        ],
        controller: _tabController,
        indicatorColor: Color.fromRGBO(247,182,67,1.0),
        indicatorSize: TabBarIndicatorSize.label,
        isScrollable: false,
        labelColor: Color.fromRGBO(50, 50, 50, 1.0),
        unselectedLabelColor: Colors.black,
        indicatorWeight: 3.0,
        labelStyle: TextStyle(height: 2),
      ),
    );
  }

  Widget tabBarBodyComponent() {
    return Container(
        height: ScreenUtil().setHeight(800),
        child: TabBarView(
        controller: _tabController,
        children: <Widget>[
          phoneCodeComponent(),
          commonCodeComponent(context),
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
            title: '邀请码', 
            hintText: '选填', 
            controller: _invitationCode,
          ),
          btnComponent('1'),
          tipComponent()
        ],
      ),
    );
  }

  // 普通验证码登录
  Widget commonCodeComponent(context) {
    return Container(
      child: Column(
        children: <Widget>[
          InputComponent(
            title: '手机号码', 
            hintText: '请输入手机号', 
            controller: _controllerPhone,
            keyboardType: TextInputType.phone,
          ),
        
          InputComponent(
            title: '密码', 
            hintText: '请输入密码', 
            controller: _controllerPwd,
            keyboardType: TextInputType.phone,
          ),
          fogetPwdComponent(context),
          btnComponent('2'),
          tipComponent()
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
              onTap: getVerifyCode,
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


  Widget btnComponent(String type) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(80)),
      child: InkWell(
        onTap: () {
          loginFunc(type);
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

  // 底部提示
  Widget tipComponent() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      width: ScreenUtil().setWidth(600),
      child: Row(
        children: <Widget>[
          Text(
            '登录即为同意', 
            style: TextStyle(
              color: Colors.grey,
              fontSize: ScreenUtil().setSp(24)
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              '《使用协议》', 
              style: TextStyle(
                fontSize: ScreenUtil().setSp(24),
                color: Color.fromRGBO(247,182,67,1.0)
              ),
            ),
          ),
          Text(
            '和',
            style: TextStyle(
              color: Colors.grey,
              fontSize: ScreenUtil().setSp(24)
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              '《隐私协议》',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(24),
                color: Color.fromRGBO(247,182,67,1.0)
              ),
            ),
          ),
        ],
      )
    );
  }

  Widget fogetPwdComponent(context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      width: ScreenUtil().setWidth(600),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          InkWell(
            onTap: () {
               NavigatorUtil.goForgetPage(context);
            },
            child: Text('忘记密码', style: TextStyle(
              fontSize: ScreenUtil().setSp(24),
              color: Colors.grey
            ),),
          ),
        ],
      ),
    );
  }

}
