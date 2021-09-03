import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gateway/blocs/subject_select/subject_list_select_cubit.dart';
import 'package:gateway/pages/common/splash_page.dart';
import 'package:gateway/pages/main/main_page.dart';
import 'package:gateway/utils/gateway_color.dart';

Future<void> main() async {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => SubjectListSelectCubit(),
    ),
  ], child: GatewayApp()));
}

class GatewayApp extends StatelessWidget {
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
