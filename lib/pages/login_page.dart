import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_page/components/Button.dart';
import 'package:login_page/core/base_screen.dart';
import 'package:login_page/utils/gateway_color.dart';
import 'package:login_page/viewmodel/login_viewmodel.dart';
import 'package:login_page/components/TextField.dart' as Gateway;
import 'package:login_page/components/Checkbox.dart' as Gateway;

class LoginPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => LoginPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen<LoginViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: this._body(context, model),
        );
      },
    );
  }
}

//Login page 확장
extension on LoginPage {
  Widget _body(BuildContext context, LoginViewModel model) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 123),
            Container(
              width: 81,
              height: 66,
              child: SvgPicture.asset(
                'asset/Group155.svg',
                color: GatewayColor.primary,
              ),
            ),
            Expanded(
              flex: 45,
              child: SizedBox(),
            ),
            Gateway.TextField(
              labelText: '학번',
              hintText: '학번을 입력해주세요',
              activation: true,
              controller: model.studentId,
            ),
            Expanded(
              flex: 45,
              child: SizedBox(),
            ),
            Gateway.TextField(
                controller: model.userPw,
                labelText: '비밀번호',
                hintText: '학번을 입력해주세요',
                activation: true,
            ),
            Expanded(
              flex: 19,
              child: SizedBox(),
            ),
            Gateway.Checkbox(labelText: '로그인 유지'),
            Expanded(
              flex: 71,
              child: SizedBox(),
            ),
            Button(
              text: '로그인',
              height: 48,
              borderRadius: BorderRadius.circular(4),
            ),
            Expanded(
              flex: 33,
              child: Container(),
            ),
            this._signup(context, model),
            Expanded(
              flex: 170,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

  //회원 가입 페이지 위한 버튼
  Widget _signup(BuildContext context, LoginViewModel model) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "계정이 없으신가요?",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          child: Text(
            "회원가입",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: GatewayColor.primary,
            ),
          ),
          onTap: () => model.onClickRegister(context),
        ),
      ],
    );
  }
}