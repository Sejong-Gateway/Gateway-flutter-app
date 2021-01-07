import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_page/models/Course_model.dart';
import 'package:login_page/pages/course_select_pages/current_select_p3.dart';

//117번째 줄 PageController.page cannot be accessed before a PageView is built with it. 오류 발생
//future widget으로 만들라는데.. 그래도 되는건가??
class currentCourseSelectPage2 extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => currentCourseSelectPage2(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CurrentCourseSelect2();
  }
}

class CurrentCourseSelect2 extends StatefulWidget {
  @override
  CurrentCourseSelectState2 createState() => CurrentCourseSelectState2();
}

class CurrentCourseSelectState2 extends State<CurrentCourseSelect2> {
  final _controller = new PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  List<CourseModel> courseList = [
    CourseModel.dummy(),
    CourseModel.dummy(),
    CourseModel.dummy(),
    CourseModel.dummy(),
    CourseModel.dummy(),
    CourseModel.dummy(),
    CourseModel.dummy(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 31),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                ),
                Text(
                  "이수한 과목을 선택해주세요",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 47,
            ),
            Row(
              children: [
                Text(
                  "전공필수",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            this._listSpread(),
            Container(),
            SizedBox(
              height: 206,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 154,
                  height: 37,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(
                        color: Color(0xff6c63ff),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .push(currentCourseSelectPage3.route());
                    },
                    color: Color(0xff6c63ff),
                    textColor: Colors.white,
                    child: Text(
                      "다음".toUpperCase(),
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 45,
            ),
          ],
        ),
      ),
    );
  }

  Widget _listSpread() {
    return Container(
      child: GridView.count(
        shrinkWrap: true,
        crossAxisSpacing: 7,
        mainAxisSpacing: 7,
        crossAxisCount: 2,
        childAspectRatio: 2.65,
        children: [
          ...courseList.map(
            (CourseModel subject) {
              if (subject.type == "전필") {
                return Center(
                  child: _currentCourseBox(
                    labelText: subject.name,
                  ),
                );
              } else {
                return Container();
              }
            },
          ).toList(),
        ],
      ),
    );
  }
}

class _currentCourseBox extends StatefulWidget {
  String labelText;
  bool selected;

  _currentCourseBox({Key key, @required this.labelText}) : super(key: key);

  @override
  _currentCourseState createState() => _currentCourseState();
}

class _currentCourseState extends State<_currentCourseBox> {
  bool _isSelected = false;

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 2.5, right: 2.5, top: 2.5, bottom: 3),
      child: ChoiceChip(
        elevation: 4,
        label: Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Text(
              widget.labelText,
              style: TextStyle(
                color:
                    _isSelected == true ? Color(0xffffffff) : Color(0xff6c63ff),
              ),
            ),
          ),
        ),
        visualDensity: VisualDensity.standard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
        selected: _isSelected,
        labelStyle: TextStyle(color: Colors.white),
        backgroundColor: Color(0xffffffff),
        selectedColor: Color(0xff6c63ff),
        onSelected: (bool selected) {
          setState(
            () {
              _isSelected = !_isSelected;
            },
          );
        },
      ),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(4)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.01),
            spreadRadius: 0.01,
            blurRadius: 0.01,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
