import 'package:flutter/material.dart';
import 'package:login_page/models/Course_model.dart';

class CurrentCourseTabTrue extends StatelessWidget {

  static Route route(){
    return MaterialPageRoute<void>(
      builder: (_)=>CurrentCourseTabTrue(),
    );
  }
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '현재 나의 학기는?',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
            this._modify("전공", "편집"),
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
            SizedBox(
              height: 49,
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
                    onPressed: () {},
                    color: Color(0xffffffff),
                    textColor: Color(0xff6c63ff),
                    child: Text(
                      "기이수로 넘기기".toUpperCase(),
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  height: 54,
                ),
              ],
            ),
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

  Widget _modify(String labelText1, String inselText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          labelText1,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        InkWell(
          child: Text(
            inselText,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff6d69fb),
            ),
          ),
          onTap: () => {},
        )
      ],
    );
  }
}
