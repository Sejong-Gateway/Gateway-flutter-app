import 'dart:math';
import 'package:flutter/material.dart';
import 'package:login_page/course_select_pages/currentCourseSelect.dart';

class CourseSelect extends StatefulWidget {
  @override
  _CourseSelectState createState() => new _CourseSelectState();
}

class _CourseSelectState extends State<CourseSelect> {
  final _controller = new PageController();

  final List<Widget> _pages = <Widget>[
    Container(child: currentCourseSelect()),
    Container(child: currentCourseSelect()),
    Container(child: currentCourseSelect()),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 44,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                physics: new AlwaysScrollableScrollPhysics(),
                controller: _controller,
                itemBuilder: (BuildContext context, int index) {
                  return _pages[index % _pages.length];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
