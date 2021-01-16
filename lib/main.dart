import 'package:flutter/material.dart';
import 'package:login_page/core/di_container.dart';
import 'package:login_page/pages/splash_page.dart';
import 'package:login_page/utils/gateway_color.dart';


Future<void> main() async {
  setupDiContainer();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GatewayApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: GatewayColor.primary,
        splashColor: GatewayColor.white,
        disabledColor: Color(0xffefefef),
        buttonColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "NotoSansCJKkr",
      ),
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}