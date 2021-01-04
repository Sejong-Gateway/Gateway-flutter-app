import 'package:flutter/material.dart';
import 'package:login_page/models/Course_model.dart';

class futureCoursetab extends StatelessWidget {
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
    return Container(
      width: 302,
      height: 55,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Container(
                  width: 84,
                  height: 25,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                      side: BorderSide(
                        color: Color(0xff6d69fb),
                      ),
                    ),
                    onPressed: () {},
                    color: Color(0xffffffff),
                    textColor: Color(0xff6d69fb),
                    child: Text(
                      "전공".toUpperCase(),
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(
                  width: 11,
                ),
                Container(
                  width: 84,
                  height: 25,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                      side: BorderSide(
                        color: Color(0xff6d69fb),
                      ),
                    ),
                    onPressed: () {},
                    color: Color(0xffffffff),
                    textColor: Color(0xff6d69fb),
                    child: Text(
                      "교양".toUpperCase(),
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 23,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '앞으로 들어야할 과목',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '전공',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 9,
            ),
            ...courseList.map(
              (CourseModel subject) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                            bottomLeft: Radius.circular(4),
                            bottomRight: Radius.circular(4)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.16),
                            spreadRadius: 0.5,
                            blurRadius: 1,
                            offset: Offset(0, 6), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: Color(0xffefefef),
                        ),
                        child: ExpansionTile(
                          trailing: SizedBox.shrink(),
                          tilePadding: EdgeInsets.symmetric(horizontal: 34),
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    subject.name,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff6c63ff),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Text(
                                    subject.department,
                                    style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff989898),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 18,
                                      ),
                                      Row(
                                        children: [
                                          this._courseTag(subject.type),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          this._semesterTag(subject.grade),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                '태그추가',
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff989898),
                                ),
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 22),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                  ],
                );
              },
            ).toList(),
          ],
        ),
      ),
    );
  }

  Widget _courseTag(String labelText) {
    return Container(
      padding: EdgeInsets.only(bottom: 1),
      width: 30,
      height: 18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Color(0xffffcfd4),
        ),
        color: Color(0xffffcfd4),
      ),
      child: Center(
        child: Text(
          labelText,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget _semesterTag(String labelText) {
    return Container(
      padding: EdgeInsets.only(bottom: 2, top: 3),
      width: 30,
      height: 18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Color(0xffcfe5f9),
        ),
        color: Color(0xffcfe5f9),
      ),
      child: Center(
        child: Text(
          labelText,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
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
