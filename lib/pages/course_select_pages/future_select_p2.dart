import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_page/components/Button.dart';
import 'package:login_page/components/subject_box.dart';
import 'package:login_page/core/base_screen.dart';
import 'package:login_page/models/Course_model.dart';
import 'package:login_page/models/subject_model.dart';
import 'package:login_page/pages/course_select_pages/current_select_p2.dart';
import 'package:login_page/pages/course_select_pages/current_select_p3.dart';
import 'package:login_page/pages/course_select_pages/future_select_p3.dart';
import 'package:login_page/viewmodel/current_select_viewmodel.dart';

//117번째 줄 PageController.page cannot be accessed before a PageView is built with it. 오류 발생
//future widget으로 만들라는데.. 그래도 되는건가??
class FutureCourseSelectPage2 extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => FutureCourseSelectPage2(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureCourseSelect2();
  }
}

class FutureCourseSelect2 extends StatefulWidget {
  @override
  FutureCourseSelectState2 createState() => FutureCourseSelectState2();
}

class FutureCourseSelectState2 extends State<FutureCourseSelect2> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen<CurrentSelectViewModel>(onModelReady: (model) {
      model.initState();
    }, builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset('asset/Backwardarrow.svg'),
            color: Color(0xff6d69fb),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          toolbarHeight: 44,
          backgroundColor: Colors.white,
          elevation: 0,
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
                    "이번 학기에 이수할 과목을 선택해주세요",
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
                  Button(
                    onPressed: () {
                      model.onClickFutureNext();
                      Navigator.of(context)
                          .push(FutureCourseSelectPage3.route());
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
                disabled: model.getCurrentSubjectList.indexWhere((element) => element == subject.uuid) != -1
            );
          },
        )
      ],
    );
  }
}
