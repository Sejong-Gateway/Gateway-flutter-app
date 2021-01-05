import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: this._body(context),
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
                  'asset/GateWayTitle.svg',
                  color: Color(0xff6c63ff),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
