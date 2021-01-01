import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_page/modals/signup_department.dart';
import 'package:login_page/modals/signup_semester.dart';

class SignupPage extends StatelessWidget {
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

class CourseSelection extends StatefulWidget {
  String depsemtype;
  String selectValue = "골라주세요";
  bool initialState = true;

  CourseSelection({Key key, @required this.depsemtype}) : super(key: key);

  @override
  _CourseSelectState createState() => new _CourseSelectState();
}

class _CourseSelectState extends State<CourseSelection> {
  departmentModal depModal = new departmentModal();
  semesterModal semModal = new semesterModal();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 39,
      child: ButtonTheme(
        buttonColor: Colors.white,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              color: Color(0xffcccccc),
            ),
          ),
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.depsemtype == "1" ? "전공을 선택해주세요" : "이수 학기를 선택해주세요",
                style: TextStyle(
                    color:
                        widget.initialState ? Color(0xffdbdbdb) : Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          onPressed: () => {
            widget.initialState = false,
            widget.depsemtype == "1"
                ? widget.selectValue = depModal.mainBottomSheet(context)
                : widget.selectValue = semModal.mainBottomSheet(context)
          },
        ),
      ),
    );
  }
}

class Certificatechecker extends StatefulWidget {
  final String label1;
  final String label2;

  Certificatechecker({Key key, @required this.label1, this.label2})
      : super(key: key);

  @override
  _Certificatechecker createState() => new _Certificatechecker();
}

class _Certificatechecker extends State<Certificatechecker> {
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                checkboxValue = !checkboxValue;
              });
            },
            child: checkboxValue
                ? Container(
                    width: 22,
                    height: 22,
                    child: SvgPicture.asset(
                      'asset/checkerNo.svg',
                    ),
                  )
                : Container(
                    width: 22,
                    height: 22,
                    child: SvgPicture.asset(
                      'asset/checker.svg',
                    ),
                  ),
          ),
          SizedBox(width: 8),
          Text(
            widget.label1,
            style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 38),
          GestureDetector(
            onTap: () {
              setState(
                () {
                  checkboxValue = !checkboxValue;
                },
              );
            },
            child: !checkboxValue
                ? Container(
                    width: 22,
                    height: 22,
                    child: SvgPicture.asset(
                      'asset/checkerNo.svg',
                    ),
                  )
                : Container(
                    width: 22,
                    height: 22,
                    child: SvgPicture.asset(
                      'asset/checker.svg',
                    ),
                  ),
          ),
          SizedBox(width: 8),
          Text(
            widget.label2,
            style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

//SignupPage 확장
extension on SignupPage {
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
            Expanded(
              flex: 6,
              child: Container(),
            ),
            this._textField("학번", "학번을 입력해주세요", false),
            Expanded(
              flex: 45,
              child: Container(),
            ),
            this._textField("비밀번호", "비밀번호를 입력해주세요", true),
            Expanded(
              flex: 45,
              child: Container(),
            ),
            Text(
              '전공',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              flex: 13,
              child: Container(),
            ),
            CourseSelection(
              depsemtype: "1",
            ),
            Expanded(
              flex: 45,
              child: Container(),
            ),
            Text(
              '공학인증여부',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              flex: 13,
              child: Container(),
            ),
            new Row(
              children: [
                Certificatechecker(label1: "예", label2: "아니오"),
              ],
            ),
            Expanded(
              flex: 45,
              child: Container(),
            ),
            Text(
              '이수학기',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              flex: 13,
              child: Container(),
            ),
            CourseSelection(
              depsemtype: "2",
            ),
            Expanded(
              flex: 60,
              child: Container(),
            ),
            this._verifyButton(true),
            Expanded(
              flex: 99,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

  //비밀번호 입력 받을 때 위젯, obscureText사용
  Widget _textField(String labelText, String hintText, bool activation) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300),
            contentPadding: EdgeInsets.only(top: 13),
          ),
          obscureText: activation,
        )
      ],
    );
  }

  Widget _verifyButton(bool inputChecks) {
    return ButtonTheme(
      height: 48,
      minWidth: 400,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            color: Color(0xff6c63ff),
          ),
        ),
        onPressed: () {},
        child: Text(
          "회원가입",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: inputChecks == true ? Colors.white : Colors.grey),
        ),
        color: inputChecks == true ? Color(0xff6c63ff) : Colors.white70,
        elevation: 0,
      ),
    );
  }
}
