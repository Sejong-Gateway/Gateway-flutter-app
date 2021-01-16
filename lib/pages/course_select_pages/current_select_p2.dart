import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/components/subject_box.dart';
import 'package:login_page/core/base_screen.dart';
import 'package:login_page/models/subject_model.dart';
import 'package:login_page/pages/course_select_pages/current_select_p3.dart';
import 'package:login_page/utils/gateway_color.dart';
import 'package:login_page/viewmodel/current_select_viewmodel.dart';
import 'package:login_page/components/Appbar.dart' as Gateway;
import 'package:login_page/components/Button.dart' as Gateway;

class currentCourseSelectPage2 extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => currentCourseSelectPage2(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CurrentCourseSelect2();
  }
}

class CurrentCourseSelect2 extends StatefulWidget {
  @override
  CurrentCourseSelectState2 createState() => CurrentCourseSelectState2();
}

class CurrentCourseSelectState2 extends State<CurrentCourseSelect2> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen<CurrentSelectViewModel>(onModelReady: (model) {
      model.initState();
    }, builder: (context, model, child) {
      return Scaffold(
        appBar:Gateway.AppBar(
          preferredSize: Size.fromHeight(56),
          backgroundColor: GatewayColor.white,
          leftButtonExist: true,
          title: '내정보',
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
                    "전공필수",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              this._listSpread(model, '전공필수'),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Gateway.Button(
                    onPressed: () {
                      model.onClickNext();
                      Navigator.of(context)
                          .push(CurrentCourseSelectPage3.route());
                    },
                    width: 120,
                    text: '다음',
                  ),
                ],
              ),
              SizedBox(
                height: 45,
              ),
            ],
          ),
        ),
      );
    });
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
