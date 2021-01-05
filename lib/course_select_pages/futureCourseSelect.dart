import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_page/models/Course_model.dart';
import 'package:login_page/pages/certificate_req_page.dart';
import 'package:login_page/pages/main_page.dart';

class futureCourseSelect extends StatelessWidget {
  bool mainCallCheck;

  futureCourseSelect({Key key, @required this.mainCallCheck}) : super(key: key);
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
        padding: EdgeInsets.symmetric(horizontal: 36),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                ),
                Text(
                  "이수할 과목을 선택해주세요",
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
                  "교양필수",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 17,
            ),
            this._listSpread(),
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
                      /*this.mainCallCheck == false
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CertificateReqInput(),
                              ),
                            )
                          : Navigator.pop(context);*/
                      //main에서 작동을 하게 하는 navigator 작동 안됨
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CertificateReqInput(),
                        ),
                      );
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
        crossAxisSpacing: 11,
        mainAxisSpacing: 9,
        crossAxisCount: 2,
        childAspectRatio: 2.65,
        children: [
          ...courseList.map(
            (CourseModel subject) {
              return Center(
                child: _currentCourse(
                  labelText: subject.name,
                ),
              );
            },
          ).toList(),
        ],
      ),
    );
  }
}

class _currentCourse extends StatefulWidget {
  String labelText;
  bool selected;

  _currentCourse({Key key, @required this.labelText}) : super(key: key);

  @override
  _currentCourseState createState() => _currentCourseState();
}

class _currentCourseState extends State<_currentCourse> {
  bool _isSelected = false;

  Widget build(BuildContext context) {
    return ChoiceChip(
      elevation: 5,
      label: Container(
        width: 146,
        height: 55,
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
    );
  }
}
