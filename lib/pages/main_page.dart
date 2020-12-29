import 'package:flutter/material.dart';
import 'package:login_page/main_page_tabs/current_course_tab.dart';
import 'package:login_page/main_page_tabs/current_tab.dart';


class mainpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'NotoSans'
      ),
      home: DefaultTabController(
        // 탭의 수 설정
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              flexibleSpace: new ListView(
                children: [
                  TabBar(
                    labelColor: Colors.black,
                    indicatorColor: Colors.black,
                    indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(width: 3.0),
                        insets: EdgeInsets.symmetric(horizontal:62.0)
                    ),
                    tabs: [
                      Tab(child: Container(
                        child: Text("나의 현황",style: TextStyle(fontWeight: FontWeight.bold)),
                      ),),
                      Tab(child: Container(
                        child: Text("수강중",style: TextStyle(fontWeight: FontWeight.bold)),
                      ),),
                      Tab(child: Container(
                        child: Text("수강계획",style: TextStyle(fontWeight: FontWeight.bold)),
                      ),),
                      Tab(icon: Icon(Icons.menu))
                    ],
                  ),
                ],
              ),
            ),
            // TabVarView 구현. 각 탭에 해당하는 컨텐트 구성
            body: Container(
              color: Colors.white,
              child: TabBarView(
                children: [
                  CurrentStatusTab(),
                  CurrentCourseTab(),
                  CurrentCourseTab(),
                  Drawer(child: Container(
                    color: Colors.white,
                  ),),
                ],
              ),)
        ),
      ),
    );
  }
}
