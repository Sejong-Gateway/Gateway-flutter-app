import 'package:flutter/material.dart';
import 'package:login_page/components/indicator_view.dart';
import 'package:login_page/components/subject_row.dart';
import 'package:login_page/core/base_screen.dart';
import 'package:login_page/models/subject_model.dart';
import 'package:login_page/utils/gateway_color.dart';
import 'package:login_page/viewmodel/main_viewmodel.dart';
import 'package:login_page/components/Button.dart' as Gateway;

class FutureCoursetab extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => FutureCoursetab(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen<MainViewModel>(
      onModelReady: (model) {
        model.onFutureInit();
      },
      builder: (context, model, child) {
        return ListView(
          children: <Widget>[
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36),
              child: Row(
                children: [
                  Gateway.Button(
                    positiveColors: Gateway.ButtonColors(
                      backgroundColor: Colors.white,
                      textColor: GatewayColor.primary,
                      borderColor: GatewayColor.primary,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    width: 84,
                    height: 25,
                    fontSize: 12,
                    text: "전공",
                  ),
                  SizedBox(
                    width: 11,
                  ),
                  Gateway.Button(
                    positiveColors: Gateway.ButtonColors(
                      backgroundColor: Colors.white,
                      textColor: GatewayColor.primary,
                      borderColor: GatewayColor.primary,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    width: 84,
                    height: 25,
                    fontSize: 12,
                    text: "교양",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 23,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '앞으로 들어야할 과목',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            this._modify("전공", "편집"),
            SizedBox(
              height: 9,
            ),
            (model.user != null)
                ? Column(
                    children: [
                      ...model.futureSubjectList
                          .map(
                            (SubjectModel subject) =>
                                SubjectRow(subject: subject),
                          )
                          .toList(),
                    ],
                  )
                : IndicatorView()
          ],
        );
      },
    );
  }

  Widget _courseTag(String labelText) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
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
      padding: EdgeInsets.only(left: 5, right: 5, bottom: 2),
      // width: 30,
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
