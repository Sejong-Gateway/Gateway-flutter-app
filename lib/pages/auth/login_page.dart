import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gateway/blocs/auth/auth_bloc.dart';
import 'package:gateway/blocs/auth/auth_event.dart';
import 'package:gateway/blocs/auth/auth_state.dart';
import 'package:gateway/components/Button.dart';
import 'package:gateway/components/TextField.dart';
import 'package:gateway/pages/main/main_page.dart';
import 'package:gateway/pages/signup/select_department_page.dart';
import 'package:gateway/pages/signup/user_info_input_page.dart';
import 'package:gateway/utils/gateway_color.dart';
import 'package:gateway/components/TextField.dart' as Gateway;
import 'package:gateway/components/Checkbox.dart' as Gateway;

class LoginPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider(
        create: (_) => AuthBloc()..add(AuthWillLoad()),
        child: LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if ( state is AuthSignInSuccess){
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

//Login page 확장
extension on LoginPage {
  Widget _body(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 123),
            SvgPicture.asset(
              'asset/Group155.svg',
              color: GatewayColor.primary,
            ),
            SizedBox(height: 45),
            Gateway.TextField(
              labelText: '학번',
              hintText: '학번을 입력해주세요',
              onChange: (value) => BlocProvider.of<AuthBloc>(context)
                ..add(
                  AuthTextFieldWillInputted(
                    name: 'studentId',
                    value: value,
                  ),
                ),
            ),
            SizedBox(height: 45),
            Gateway.TextField(
              labelText: '비밀번호',
              hintText: '비밀번호을 입력해주세요',
              type: TextFieldType.password,
              onChange: (value) => BlocProvider.of<AuthBloc>(context)
                ..add(
                  AuthTextFieldWillInputted(
                    name: 'password',
                    value: value,
                  ),
                ),
            ),
            SizedBox(height: 19),
            Gateway.Checkbox(labelText: '로그인 유지'),
            SizedBox(height: 69),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthTextFieldInputtedSuccess) {
                  return Button(
                    text: '로그인',
                    height: 48,
                    borderRadius: BorderRadius.circular(4),
                    onPressed: () => BlocProvider.of<AuthBloc>(context)
                      ..add(AuthWillSignedIn(input: state.input)),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
            SizedBox(height: 33),
            this._signupRow(context),
          ],
        ),
      ),
    );
  }

  //회원 가입 페이지 위한 버튼
  Widget _signupRow(BuildContext context) {
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
          width: 8,
        ),
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(UserInfoInputPage.route());
          },
          child: Text(
            "회원가입",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: GatewayColor.primary,
            ),
          ),
        ),
      ],
    );
  }
}
