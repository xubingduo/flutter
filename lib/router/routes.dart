/**
 * 第一个参数是路由地址
 * 第三个参数是默认的转场动画
 * 第二个参数是页面跳转和传参
 */
import 'package:fluro/fluro.dart';
import './route_handlers.dart';


class Routes {
  // 页面启动页
  static String root = "/";
  // 登录页面
  static String login = "/login";
  // 忘记密码
  static String forget = "/forget";
  // 首页
  static String index = "/index";

  static void configgureRoutes(Router router) {
    // 404页面
    router.notFoundHandler = emptyHandler;
    // 页面启动页
    router.define(root, handler: rootHandler, transitionType: TransitionType.cupertino);
    // 登录页面
    router.define(login, handler: loginHandler, transitionType: TransitionType.cupertino);
    // 忘记密码
    router.define(forget, handler: forgetHandler, transitionType: TransitionType.cupertino);
    // 首页
    router.define(index, handler: indexPageHandler, transitionType: TransitionType.cupertino);
  }

}