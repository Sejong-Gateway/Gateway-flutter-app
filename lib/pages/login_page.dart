import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//Gateway 색 적용
const GateWaycolor = Color(0xff6c63ff);

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

//Login page 확장
extension on LoginPage {
  Widget get _appBar => AppBar(
        toolbarHeight: 44,
        backgroundColor: Colors.white,
        elevation: 0,
      );

  Widget _body(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 67),
            Container(
              width: 81,
              height: 66,
              child:
                  SvgPicture.asset('asset/Group155.svg', color: GateWaycolor),
            ),
            Expanded(
              flex: 45,
              child: Container(),
            ),
            this._textField("학번", "학번을 입력해주세요", false),
            Expanded(
              flex: 45,
              child: Container(),
            ),
            this._textField("비밀번호", "비밀번호를 입력해주세요", true),
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
                color: GateWaycolor,
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

  //비밀번호 입력 받을 때 위젯, obscureText사용
  Widget _textField(String labelText, String hintText, bool activation) {
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
          obscureText: activation,
        ),
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
                  color: GateWaycolor)),
          onTap: () => {},
        ),
      ],
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
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
                    color: GateWaycolor,
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
      ),
    );
  }
}
