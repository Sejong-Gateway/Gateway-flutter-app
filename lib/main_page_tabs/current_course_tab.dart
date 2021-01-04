import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/course_select_pages/futureCourseSelect.dart';
import 'package:login_page/models/Course_model.dart';
import 'package:login_page/pages/profiletag_page.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CurrentCourseTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 36),
          child: SafeArea(
            child: ListView(
              children: [
                SizedBox(
                  height: 27,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '현재 나의 학기는?',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        this.courseView("3-2"),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '학기',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '전공',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '수강하고 있는 과목이 없습니다',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  '교양',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '수강하고 있는 과목이 없습니다',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 110,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileTagPage(),
                            ),
                          );
                        },
                        color: Color(0xff6c63ff),
                        textColor: Colors.white,
                        child: Text(
                          "프로필".toUpperCase(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileTagPage(),
                            ),
                          );
                        },
                        color: Color(0xff6c63ff),
                        textColor: Colors.white,
                        child: Text(
                          "공학인증".toUpperCase(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget courseView(String currentCourse) {
    return Row(
      children: [
        Text(
          currentCourse == "" ? "" : currentCourse,
          style: TextStyle(
              fontSize: 30,
              color: Color(0xff6d69fb),
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
