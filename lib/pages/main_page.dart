import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_page/pages/course/futureCourseSelect.dart';
import 'package:login_page/pages//main_page_tabs/current_course_tab.dart';
import 'package:login_page/pages//main_page_tabs/current_course_tabTrue.dart';
import 'package:login_page/pages//main_page_tabs/current_tab.dart';
import 'package:login_page/pages//main_page_tabs/future_course_tab.dart';
import 'package:login_page/components/modals/mainpage_hamburger.dart';
import 'package:login_page/components/modals/signup_department.dart';

class MainPage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => MainPage(),
    );
  }
  MainPage({Key key}) : super(key: key);

  @override
  _MainPage createState() => new _MainPage();
}

class _MainPage extends State<MainPage> {
  MainpageHamburger hamburerModal = new MainpageHamburger();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        // 탭의 수 설정
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TabBar(
                              labelColor: Colors.black,
                              indicatorColor: Colors.black,
                              indicator: UnderlineTabIndicator(
                                borderSide: BorderSide(width: 3.0),
                                insets: EdgeInsets.symmetric(horizontal: 60.0),
                              ),
                              tabs: [
                                Tab(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "나의 현황",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    child: Text(
                                      "수강중",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    child: Text(
                                      "수강계획",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              RaisedButton(
                                color: Colors.white,
                                elevation: 0,
                                child: Container(
                                  margin: EdgeInsets.only(left: 30),
                                  child:
                                  SvgPicture.asset('asset/hamburgerMenu.svg'),
                                ),
                                onPressed: () {
                                  hamburerModal.mainBottomSheet(context);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ),
          // TabVarView 구현. 각 탭에 해당하는 컨텐트 구성
          body: Container(
            color: Colors.white,
            child: TabBarView(
              children: [
                CurrentStatusTab(),
                CurrentCourseTabTrue(), //과목이 정상적으로 들어왔으면 CurrentCourseTabTrue()
                futureCoursetab(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
