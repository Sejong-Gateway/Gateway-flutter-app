import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_page/core/base_screen.dart';
import 'package:login_page/utils/gateway_color.dart';
import 'package:login_page/viewmodel/splash_viewmodel.dart';

class SplashPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => SplashPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen<SplashViewModel>(
      onModelReady: (model) {
        model.initState(context);
      },
      builder: (context, model, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: this._body(context),
        );
      },
    );
  }
}

extension on SplashPage {
  Widget _body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                width: 120,
                height: 97,
                child: SvgPicture.asset('asset/Group155.svg'),
              ),
              SizedBox(
                height: 14.7,
              ),
              Container(
                width: 78.5,
                height: 18.3,
                child: SvgPicture.asset(
                  'asset/icons/app-logo-title.svg',
                  color: GatewayColor.primary,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
