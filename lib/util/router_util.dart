  /***
   * 
   * 页面跳转公共管理
   * 
   */
  import 'package:flutter/material.dart';
  import '../router/application.dart';
  import '../router/routes.dart';

  class NavigatorUtil {
    // 去忘记密码页面
    static void goForgetPage(BuildContext context) {
      /// Routes.login 路由地址
      /// replace：true 就是将 splash 页面给移除掉了，这点后退键的时候就不会再出现Splash页面
      // Application.router.navigateTo(context, Routes.login, replace: true);
      Application.router.navigateTo(context, Routes.forget);
    }

    // 跳转首页
    static void goIndexPage(BuildContext context) {
      Application.router.navigateTo(context, Routes.index, replace: true);
    }

    static void goLoginPage(BuildContext context) {
      Application.router.navigateTo(context, Routes.index, replace: true);
    }

  }