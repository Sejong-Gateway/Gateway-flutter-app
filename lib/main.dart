import 'package:flutter/material.dart';
import 'package:login_page/core/di_container.dart';
import 'package:login_page/pages/certificate_req_page.dart';
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
        primaryColor: Color(0xff6c63ff),
        splashColor: Colors.white,
        disabledColor: Color(0xffdedfe5),
        buttonColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Noto",
      ),
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}

//TODO: Routing 방식 SplashPage, MainPage 처럼 바꾸기 -> 페이지 간 데이터 전송 문제 때문에 해당 방식으로 진행해야함
//TODO: Service, Model 은 제가 건들겠습니다.
//TODO: SplashPage 처럼 다른 페이지에도 Viewmodel 적용하고 di_container 파일에 register 하기