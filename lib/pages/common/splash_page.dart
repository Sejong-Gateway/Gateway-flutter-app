import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gateway/blocs/auth/auth_event.dart';
import 'package:gateway/blocs/auth/auth_state.dart';
import 'package:gateway/blocs/splash/splash_bloc.dart';
import 'package:gateway/blocs/splash/splash_event.dart';
import 'package:gateway/blocs/splash/splash_state.dart';
import 'package:gateway/pages/auth/login_page.dart';
import 'package:gateway/pages/main/main_page.dart';
import 'package:gateway/utils/gateway_color.dart';
import 'package:gateway/blocs/auth/auth_bloc.dart';

class SplashPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider(
        create: (_) => SplashBloc()..add(SplashWillLoad()),
        child: SplashPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if ( state is SplashNotLoggedIn ){
          Navigator.of(context).pushReplacement(LoginPage.route());
        }
        else if (state is SplashLoggedIn ){
          Navigator.of(context).pushReplacement(MainPage.route());
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: this._body(context),
      ),
    );
  }
}

extension on SplashPage {
  Widget _body(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Expanded(
          flex: 341,
          child: SizedBox(),
        ),
        SvgPicture.asset(
          'assets/images/logo.svg',
          width: 120,
          height: 97,
        ),
        SizedBox(
          height: 16,
        ),
        SvgPicture.asset(
          'assets/images/app-logo-title.svg',
          color: GatewayColor.primary,
          height: 16,
          width: 78,
        ),
        Expanded(
          flex: 342,
          child: SizedBox(),
        ),
      ],
    ));
  }
}
