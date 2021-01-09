import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as Material;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_page/components/modal_view.dart' as Gateway;
import 'package:login_page/components/modals/signup_department.dart';
import 'package:login_page/components/modals/signup_semester.dart';
import 'package:login_page/core/base_screen.dart';
import 'package:login_page/pages/course_select_pages/current_select_p1.dart';
import 'package:login_page/pages/main_page.dart';
import 'package:login_page/viewmodel/register_viewmodel.dart';

class SignupPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SignupPage());
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen<RegisterViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              icon: SvgPicture.asset('asset/Backwardarrow.svg'),
              color: Color(0xff6d69fb),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            toolbarHeight: 44,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: this._body(context, model),
        );
      },
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
  Widget _body(BuildContext context, RegisterViewModel model) {
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
            this._textField("학번", "학번을 입력해주세요", false, model.idController),
            Expanded(
              flex: 45,
              child: Container(),
            ),
            this._textField("비밀번호", "비밀번호를 입력해주세요", true, model.pwController),
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
            GestureDetector(
              onTap: () {
                Gateway.showModal(
                  context: context,
                  builder: (_) => Gateway.ModalView(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            model.onSelectMajor("컴퓨터공학과");
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(23, 15, 23, 15),
                            child: Text('컴퓨터공학과'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            model.onSelectMajor("디자인이노베이션학과");
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(23, 15, 23, 15),
                            child: Text(
                              '디자인이노베이션학과',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            model.onSelectMajor("소프트웨어학과");
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(23, 15, 23, 15),
                            child: Text(
                              '소프트웨어학과',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(19, 10, 19, 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color(0xffcccccc),
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  model.major ??'전공을 선택해주세요',
                  style: TextStyle(
                    color: model.major != null ? Colors.black : Color(0xffdbdbdb),
                  ),
                ),
              ),
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
            GestureDetector(
              onTap: () {
                Gateway.showModal(
                  context: context,
                  builder: (_) => Gateway.ModalView(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            model.onSelectSemester("1-1");
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(23, 15, 23, 15),
                            child: Text('1학년 1학기'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            model.onSelectSemester("1-2");
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(23, 15, 23, 15),
                            child: Text(
                              '1학년 2학기',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            model.onSelectSemester("2-1");
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(23, 15, 23, 15),
                            child: Text(
                              '2학년 1학기',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            model.onSelectSemester("2-2");
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(23, 15, 23, 15),
                            child: Text(
                              '2학년 2학기',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            model.onSelectSemester("3-1");
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(23, 15, 23, 15),
                            child: Text(
                              '3학년 1학기',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            model.onSelectSemester("3-2");
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(23, 15, 23, 15),
                            child: Text(
                              '3학년 2학기',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            model.onSelectSemester("4-1");
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(23, 15, 23, 15),
                            child: Text(
                              '4학년 1학기',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            model.onSelectSemester("4-2");
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(23, 15, 23, 15),
                            child: Text(
                              '4학년 2학기',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(19, 10, 19, 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color(0xffcccccc),
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  model.semester ??'이수학기를 선택해주세요',
                  style: TextStyle(
                    color: model.semester != null ? Colors.black : Color(0xffdbdbdb),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 60,
              child: Container(),
            ),
            this._verifyButton(true, context, model),
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
  Widget _textField(String labelText, String hintText, bool activation,
      TextEditingController controller) {
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
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIconConstraints: BoxConstraints(
              maxHeight: 8,
              minWidth: 12,
            ),
            hintStyle: TextStyle(
                color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300),
            contentPadding: EdgeInsets.only(top: 13),
          ),
          obscureText: activation,
        )
      ],
    );
  }

  Widget _verifyButton(
      bool inputChecks, BuildContext context, RegisterViewModel model) {
    return Material.ButtonTheme(
      height: 48,
      minWidth: 400,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            color: Color(0xff6c63ff),
          ),
        ),
        onPressed: () {
          model.onClickRegister();
          Navigator.of(context).push(currentCourseSelectPage1.route());
        },
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
