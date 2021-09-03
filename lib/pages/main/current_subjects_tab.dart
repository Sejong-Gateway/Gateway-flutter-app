import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gateway/blocs/auth/current_user_cuibt.dart';
import 'package:gateway/blocs/current_subject/current_subejct_list_state_cubit.dart';
import 'package:gateway/blocs/current_subject/select_current_subject_list_cubit.dart';
import 'package:gateway/blocs/subject_type/subject_type_cubit.dart';
import 'package:gateway/components/Button.dart';
import 'package:gateway/components/subject_row.dart';
import 'package:gateway/models/auth/user.dart';
import 'package:gateway/models/subject/subject.dart';
import 'package:gateway/models/subject/subject_type.dart';
import 'package:gateway/utils/gateway_color.dart';

class CurrentSubjectsTab extends StatelessWidget {
  final User user;

  const CurrentSubjectsTab({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return BlocBuilder<SelectCurrentSubjectListCubit, List<String>>(
        builder: (context, selectedList) {
      return BlocBuilder<CurrentSubjectListStateCubit, bool>(
          builder: (context, changeState) {
        return Stack(
          children: [
            ListView(
              children: <Widget>[
                SizedBox(
                  height: 27,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '현재 나의 학기는?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            this.getSemesterToGrade(user.semester) + "-",
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: GatewayColor.primary,
                            ),
                          ),
                          Text(
                            this.getSemesterToString(user.semester),
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: GatewayColor.primary,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '학기',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                              color: GatewayColor.black,
                              height: 1.45,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                BlocBuilder<SubjectTypeCubit, List<SubjectType>>(
                    builder: (context, types) {
                  if (types != null) {
                    return Column(
                      children: [
                        ...types.map(
                          (type) => Column(
                            children: [
                              this._modify(type.name),
                              SizedBox(height: 10),
                              ...user.currentSubjects
                                  .where((subject) =>
                                      subject.type.uuid == type.uuid)
                                  .map(
                                    (Subject subject) => GestureDetector(
                                      onTap: () {
                                        if (changeState) {
                                          BlocProvider.of<
                                                  SelectCurrentSubjectListCubit>(
                                              context)
                                            ..onChangeSubject(subject.uuid);
                                        }
                                      },
                                      child: SubjectRow(
                                        subject: subject,
                                        isSelected: selectedList.any(
                                          (element) => element == subject.uuid,
                                        ),
                                      ),
                                    ),
                                  ),
                              SizedBox(height: 22),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return SizedBox();
                  }
                }),
                SizedBox(
                  height: 49,
                ),
              ],
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              width: _width,
              height: 100,
              bottom: changeState ? -100 : 0,
              child: Align(
                alignment: Alignment.center,
                child: Button(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      blurRadius: 6,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                  positiveColors: ButtonColors(
                    backgroundColor: GatewayColor.white,
                    textColor: GatewayColor.primary,
                    borderColor: GatewayColor.primary,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  width: _width - 48,
                  onPressed: () {
                    BlocProvider.of<CurrentSubjectListStateCubit>(context)
                      ..changeState();
                  },
                  text: "기이수로 넘기기",
                ),
              ),
            ),

            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              width: _width,
              height: 100,
              bottom: changeState ? 0 : -100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.16),
                        blurRadius: 6,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    positiveColors: ButtonColors(
                      backgroundColor: GatewayColor.white,
                      textColor: GatewayColor.primary,
                      borderColor: GatewayColor.primary,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    width: (_width - 48 - 10) / 2,
                    onPressed: () {
                      BlocProvider.of<CurrentSubjectListStateCubit>(context)
                        ..changeState();
                    },
                    text: "취소",
                  ),
                  SizedBox(width: 10),
                  Button(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.16),
                        blurRadius: 6,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    positiveColors: ButtonColors(
                      backgroundColor: GatewayColor.primary,
                      textColor: GatewayColor.white,
                      borderColor: GatewayColor.primary,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    width: (_width - 48 - 10) / 2,
                    onPressed: () {
                      BlocProvider.of<SelectCurrentSubjectListCubit>(
                          context)..onUpdateCurrentSubject();
                    },
                    text: "확인",
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 85,
              width: _width,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 300),
                opacity: changeState ? 1.0 : -.0,
                child: Text(
                  '기이수로 넘길 과목을 선택 후 확인버튼을 눌러주세요',
                  style: TextStyle(
                    color: GatewayColor.subText
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        );
      });
    });
  }

  Widget _modify(String labelText1) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            labelText1,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  String getSemesterToGrade(int semester) {
    return (semester / 4).ceil().toString();
  }

  String getSemesterToString(int semester) {
    return (2 - (semester % 2)).toString();
  }
}
