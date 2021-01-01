import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/models/Course_model.dart';

class currentCourseSelect extends StatelessWidget {
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
    return SafeArea(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 26,
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
                    "교양필수",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 17,
              ),
              this._listSpread()
            ],
          )),
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
