import 'package:flutter/material.dart';
import 'package:login_page/components/Button.dart';
import 'package:login_page/components/indicator_view.dart';
import 'package:login_page/components/subject_row.dart';
import 'package:login_page/core/base_screen.dart';
import 'package:login_page/models/Course_model.dart';
import 'package:login_page/models/subject_model.dart';
import 'package:login_page/utils/gateway_color.dart';
import 'package:login_page/viewmodel/main_viewmodel.dart';

class CurrentCourseTab extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => CurrentCourseTab(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen<MainViewModel>(
      onModelReady: (model) {
        model.onInitState();
      },
      builder: (context, model, child) {
        return ListView(
          children: <Widget>[
            SizedBox(
              height: 27,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '현재 나의 학기는?',
                    style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      this.courseView(model?.user?.semester ?? "1-1"),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '학기',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            this._modify("전공", "편집"),
            SizedBox(height: 9),
            (model.user != null)
                ? Column(
              children: [
                ...model.user.currentSubjects
                    .map((SubjectModel subject) =>
                    SubjectRow(subject: subject)).toList(),
              ],
            )
                : IndicatorView(),
            SizedBox(
              height: 49,
            ),
            Align(
              alignment: Alignment.center,
              child: Button(
                positiveColors: ButtonColors(
                    backgroundColor: Colors.white,
                    textColor: GatewayColor.primary,
                    borderColor: GatewayColor.primary
                ),
                borderRadius: BorderRadius.circular(20),
                width: 154,
                text: "기이수로 넘기기",
              ),
            ),
            SizedBox(height: 46),
          ],
        );
      },
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
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _modify(String labelText1, String inselText) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            labelText1,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          InkWell(
            child: Text(
              inselText,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff6d69fb),
              ),
            ),
            onTap: () => {},
          )
        ],
      ),
    );
  }
}
