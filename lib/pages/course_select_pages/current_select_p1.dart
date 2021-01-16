import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_page/components/Button.dart';
import 'package:login_page/components/subject_box.dart';
import 'package:login_page/core/base_screen.dart';
import 'package:login_page/models/Course_model.dart';
import 'package:login_page/models/subject_model.dart';
import 'package:login_page/pages/course_select_pages/current_select_p2.dart';
import 'package:login_page/utils/gateway_color.dart';
import 'package:login_page/viewmodel/current_select_viewmodel.dart';
import 'package:login_page/components/Appbar.dart' as Gateway;

class CurrentCourseSelectPage1 extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => CurrentCourseSelectPage1(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CurrentCourseSelect1();
  }
}

class CurrentCourseSelect1 extends StatefulWidget {
  @override
  CurrentCourseSelectState1 createState() => CurrentCourseSelectState1();
}

class CurrentCourseSelectState1 extends State<CurrentCourseSelect1> {
  final _controller = new PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    return BaseScreen<CurrentSelectViewModel>(
      onModelReady: (model) {
        model.initState();
      },
      builder: (context, model, child) {
        return Scaffold(
          appBar: Gateway.AppBar(
            preferredSize: Size.fromHeight(56),
            backgroundColor: GatewayColor.white,
            leftButtonExist: true,
          ),
          body: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 31),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Text(
                      "이수한 과목을 선택해주세요",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                this._listSpread(model, '교양필수'),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "교양선택1",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                this._listSpread(model, '교양선택1'),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "학문기초교양",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                this._listSpread(model, '학문기초교양'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button(
                      onPressed: () {
                        model.onClickNext();
                        Navigator.of(context)
                            .push(currentCourseSelectPage2.route());
                      },
                      width: 120,
                      text: '다음',
                    )
                  ],
                ),
                SizedBox(
                  height: 45,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _listSpread(CurrentSelectViewModel model, String type) {
    return Wrap(
      children: [
        ...model.subjectList.where((SubjectModel subject) => subject.type == type).map(
          (SubjectModel subject) {
            return SubjectBox(
              name: subject.name,
              onClick: () => model.onSelectSubject(subject.uuid),
              select: model.selectList.indexWhere((element) => element == subject.uuid) != -1,
            );
          },
        )
      ],
    );
  }
}

extension on CurrentCourseSelectState1 {}
