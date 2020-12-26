import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//purple custom 실행 오류
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

//LoginPage를 위한 statelesswidget
class LoginPage extends StatelessWidget {
  //static Color purpleCustom = HexColor.fromHex('#6c63ff');
  //purple custom not working
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: this._appBar,
      body: this._body(context),
    );
  }
}

//로그인 유지 항목을 위한 StayedLogin
class StayedLogin extends StatefulWidget {
  @override
  _StayedLogin createState() => new _StayedLogin();
}

class _StayedLogin extends State<StayedLogin> {
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(240, 0, 0, 0),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  checkboxValue = !checkboxValue;
                });
              },
              child: checkboxValue
                  ? Icon(
                Icons.check_circle,
                color: Colors.deepPurpleAccent,
                size: 22,
              )
                  : Icon(
                Icons.check_circle,
                color: Colors.grey,
                size: 22,
              ),
            ),
            SizedBox(width: 8),
            Text("로그인 유지",
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ));
  }
}

//Login page 확장
extension on LoginPage {
  Widget get _appBar =>
      AppBar(
        toolbarHeight: 44,
        backgroundColor: Colors.white,
        elevation: 0,
      );

  Widget _body(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        padding: EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 67),
            SvgPicture.asset('asset/Group155.svg', color: Colors.deepPurpleAccent),
            Expanded(
              flex: 45,
              child: Container(),
            ),
            this._textField("학번", "학번을 입력해주세요"),
            Expanded(
              flex: 45,
              child: Container(),
            ),
            this._passwordtextField("비밀번호", "비밀번호를 입력해주세요"),
            Expanded(
              flex: 19,
              child: Container(),
            ),
            StayedLogin(),
            Expanded(
              flex: 69,
              child: Container(),
            ),
            ButtonTheme(
              height: 48,
              minWidth: 400,
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  "로그인",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
                color: Colors.deepPurpleAccent,
              ),
            ),
            Expanded(
              flex: 33,
              child: Container(),
            ),
            this._signup(),
            Expanded(
              flex: 170,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
  //입력 받을 때 사용 widget
  Widget _textField(String labelText, String hintText) {
    bool _obscureText = true;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextField(
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w300)),
        )
      ],
    );
  }
  //비밀번호 입력 받을 때 위젯, obscureText사용
  Widget _passwordtextField(String labelText, String hintText) {
    bool _obscureText = true;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300),
            contentPadding: EdgeInsets.zero,
          ),
          obscureText: _obscureText,
        )
      ],
    );
  }
  //회원 가입 페이지 위한 버튼
  Widget _signup() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("계정이 없으신가요? ",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.grey,
            )),
        InkWell(
          child: Text("회원가입",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.deepPurpleAccent)),
          onTap: () => {},
        )
      ],
    );
  }
}
