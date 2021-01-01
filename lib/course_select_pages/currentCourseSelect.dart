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
              children: [
                Text("교양필수",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 17,),
            this._listSpread()
          ],
        )
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
          ...courseList.map((CourseModel subject) {
            return Center(child: courseBox(subject.name),);
          },).toList(),
        ],
      )
    );
  }

  Widget courseBox(String labelText) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Color(0xff6c63ff),
        ),
        color: Color(0xff6c63ff),
      ),
      child: Center(
        child: Text(
          labelText,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500,color: Colors.white),
        ),
      ),
    );
  }
}
