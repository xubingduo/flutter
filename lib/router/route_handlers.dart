import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/login/login_page.dart';
import '../pages/login/login_forget_page.dart';
import '../pages/index_page.dart';


// 404页面
var emptyHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params ) {
    print('页面不存在');
    return null;
});

// 启动页面
var rootHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params ) {
    return LoginPage();
});

// 登录页面
var loginHandler =  Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params ) {
    return LoginPage();
});

// 忘记密码
var forgetHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params ) {
    return ForgetPage();
});

// 首页
var indexPageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params ) {
    return IndexPage();
});
