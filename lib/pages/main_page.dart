import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_page/components/modal_view.dart';
import 'package:login_page/pages/main_page_tabs/current_course_tabTrue.dart';
import 'package:login_page/pages/main_page_tabs/current_tab.dart';
import 'package:login_page/pages/main_page_tabs/future_course_tab.dart';

class MainPage extends StatelessWidget{

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => MainPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
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
                            child: Text(
                              "나의 현황",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "수강중",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "수강계획",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showModal(
                            context: context,
                            builder: (_) => this._modalView(context)
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 15, left: 10),
                        child: SvgPicture.asset('asset/hamburgerMenu.svg'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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

extension on MainPage{
  Widget _modalView(BuildContext context){
    return ModalView(
      padding: EdgeInsets.symmetric(
          horizontal: 36, vertical: 13),
      child: Column(
        children: [
          this._modelItem(context, '내 정보'),
          this._modelItem(context, '공학인증'),
        ],
      ),
    );
  }

  Widget _modelItem(BuildContext context, String title) => Padding(
    padding:
    EdgeInsets.symmetric(vertical: 15),
    child: Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SvgPicture.asset(
          'asset/icons/ic_right_arrow.svg',
        ),
      ],
    ),
  );
}