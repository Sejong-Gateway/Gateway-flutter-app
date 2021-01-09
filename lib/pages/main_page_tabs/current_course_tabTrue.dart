import 'package:flutter/material.dart';
import 'package:login_page/components/Button.dart';
import 'package:login_page/components/indicator_view.dart';
import 'package:login_page/core/base_screen.dart';
import 'package:login_page/models/Course_model.dart';
import 'package:login_page/models/subject_model.dart';
import 'package:login_page/utils/gateway_color.dart';
import 'package:login_page/viewmodel/main_viewmodel.dart';

class CurrentCourseTabTrue extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => CurrentCourseTabTrue(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen<MainViewModel>(
      onModelReady: (model) {
        model.onInitState();
      },
      builder: (context, model, child) {
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
                (model.user != null)
                    ? Column(
                        children: [
                          ...model.user.currentSubjects.map(
                            (SubjectModel subject) {
                              return Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(34, 12, 34, 12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.16),
                                          blurRadius: 6,
                                          offset: Offset(0, 2), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 12,
                                            ),
                                            SizedBox(
                                              width: 150,
                                              child: Text(
                                                subject.name,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff6c63ff),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1,
                                            ),
                                            Text(
                                              subject.major,
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff989898),
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            this._courseTag(subject.type),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            this._semesterTag(subject.semester),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 11,
                                  ),
                                ],
                              );
                            },
                          ).toList(),
                        ],
                      )
                    : IndicatorView(),
                SizedBox(
                  height: 49,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(
                      positiveColors: ButtonColors(
                        backgroundColor: Colors.white,
                        textColor: GatewayColor.primary,
                      ),
                      width: 154,
                      text: "기이수로 넘기기",
                    )
                  ],
                ),
              ],
            ),
          ),
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
    return Row(
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
    );
  }
}
