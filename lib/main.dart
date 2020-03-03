import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router/application.dart';
import './router/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void>main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final router = Router();
  Routes.configgureRoutes(router);
  Application.router = router;
  print(await saveLoginData());
  // runApp(
  //   MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider.value(value: Counter()),
  //       //ChangeNotifierProvider(builder: (_) => Counter()),        
  //     ],
  //     child: MyApp(),
  //   )
  // );
  runApp(MyApp());
}

Future<String> saveLoginData() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String loginData =  prefs.getString('loginData');
  return loginData ?? '';
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "flutter demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.white,
      ),
      onGenerateRoute: Application.router.generator,
    );
  }
}
