import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gateway/blocs/auth/current_user_cuibt.dart';
import 'package:gateway/blocs/department/department_cubit.dart';
import 'package:gateway/blocs/subject_type/subject_type_cubit.dart';
import 'package:gateway/components/indicator_view.dart';
import 'package:gateway/models/auth/user.dart';
import 'package:gateway/models/department/department.dart';
import 'package:gateway/models/department/standard-credit.dart';
import 'package:gateway/models/requirement/category.dart';
import 'package:gateway/models/requirement/user_category.dart';
import 'package:gateway/models/requirement/user_requirement.dart';
import 'package:gateway/models/subject/subject.dart';
import 'package:gateway/models/subject/subject_type.dart';
import 'package:gateway/utils/gateway_color.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CurrentStatusTab extends StatelessWidget {

  final User user;

  const CurrentStatusTab({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: _body(context));
  }

  Widget _body(BuildContext context) {
    return BlocBuilder<DepartmentCubit, Department>(
      builder: (context, department) {
        if (department != null) {
          return BlocBuilder<SubjectTypeCubit, List<SubjectType>>(builder: (context, subjectTypes) {
            if (subjectTypes != null) {
              return ListView(
                children: [
                  SizedBox(height: 24),
                  this._scoreShow(
                      context, getMyTotalCredit(subjectTypes, user.completeSubjects), getTotalCredit(department.standardCredits)),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            this._modify("기이수", "편집"),
                            SizedBox(
                              height: 18,
                            ),
                            ...department.standardCredits
                                .map((standardCredits) {
                              print(standardCredits.max);
                              return Column(
                                children: [
                                  ProgressBar(
                                    totalCredits: standardCredits.max ?? 100,
                                    currentCredits: getMyTotalCredit([standardCredits.subjectType], user.completeSubjects),
                                    noLimit: false,
                                    labelText: standardCredits.subjectType.name,
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                ],
                              );
                            }),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        color: GatewayColor.dividerColor,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 29,
                            ),
                            this._modify("공통졸업요건", "편집"),
                            SizedBox(
                              height: 16,
                            ),
                            // this._sejongVolunteer(0, model),
                            BlocBuilder<CurrentUserCubit, User>(
                              builder: (context, user) {
                                if (user != null) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ...user.userCategories.map(
                                        (userCategory) =>
                                            _categoryRow(userCategory),
                                      )
                                    ],
                                  );
                                } else {
                                  return SizedBox();
                                }
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              );
            } else {
              return SizedBox();
            }
          });
        } else {
          return SizedBox();
        }
      },
    );
  }

  Widget _categoryRow(UserCategory userCategory) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          userCategory.category.title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        this._table(userCategory.requirements),
      ],
    );
  }

  Widget _table(List<UserRequirement> requirements) {
    return Table(
      border: TableBorder(
        verticalInside: BorderSide(width: 1, color: Color(0xffbeb9ff)),
        horizontalInside: BorderSide(width: 1, color: Color(0xffbeb9ff)),
      ),
      columnWidths: const <int, TableColumnWidth>{
        0: FixedColumnWidth(150),
        1: FlexColumnWidth(),
        2: FlexColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            Container(
                height: 32,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '구분',
                    textAlign: TextAlign.center,
                  ),
                )),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Text(
                '인증권수',
                textAlign: TextAlign.center,
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Text(
                '이수권수',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        ...requirements.map(
          (requirement) => TableRow(children: [
            Text(
              requirement.requirement.name,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Text(
                '4권',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                height: 33,
                color: Color(0xffe5e4fe),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    requirement.count.toString() + requirement.requirement.unit,
                    textAlign: TextAlign.center,
                  ),
                ))
          ]),
        )
      ],
    );
  }

  Widget _scoreShow(BuildContext context, int currentCredit, int totalCredit) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/undraw-education-f-8-ru@3x.png',
            height: 172,
            width: 243,
          ),
          Positioned(
            right: 36,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 28),
                Container(
                  child: Text(
                    "현재 취득한 학점은?",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 9),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        currentCredit.toString(),
                        style: TextStyle(
                          fontSize: 30,
                          color: GatewayColor.primary,
                          fontWeight: FontWeight.bold,
                          height: 1.45,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      margin: EdgeInsets.only(top: 6),
                      child: Text(
                        "학점",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          height: 1.45,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 31),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "남은학점",
                      style: TextStyle(
                        fontSize: 12,
                        color: GatewayColor.subText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      (totalCredit - currentCredit).toString(),
                      style: TextStyle(
                        fontSize: 12,
                        color: GatewayColor.subText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '학점',
                      style: TextStyle(
                        fontSize: 12,
                        color: GatewayColor.subText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _modify(String labelText1, String inselText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          labelText1,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        InkWell(
          child: Text(
            inselText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff6d69fb),
            ),
          ),
          onTap: () => {},
        )
      ],
    );
  }

  int getTotalCredit(List<StandardCredit> standardCredits) {
    return standardCredits.fold(
        0, (previousValue, element) => previousValue + element.max);
  }

  int getMyTotalCredit(List<SubjectType> subjectTypes, List<Subject> completedSubjects){
    return completedSubjects.fold(0, (previousValue, subject){
      if ( subjectTypes.any((subjectType) => subjectType.name == subject.type.name) ){
        return previousValue + subject.credit;
      }
      else return previousValue;
    });
  }
}

class ProgressBar extends StatelessWidget {
  final String labelText;
  final int currentCredits;
  final int totalCredits;
  final bool noLimit;

  ProgressBar({
    Key key,
    @required this.labelText,
    this.noLimit,
    this.currentCredits,
    this.totalCredits,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ProgressStatus(
        this.labelText,
        this.currentCredits,
        this.totalCredits,
        this.noLimit,
      ),
    );
  }

  Widget ProgressStatus(
      String labelText, int currentCredits, int totalCredits, bool noLimit) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          labelText,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            LinearPercentIndicator(
              width: 230,
              lineHeight: 10,
              percent: (currentCredits / totalCredits),
              progressColor: GatewayColor.primary,
            ),
            SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  currentCredits.toString(),
                  style: TextStyle(
                    fontSize: 14,
                    color: GatewayColor.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  noLimit == true ? "" : "/",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff989898),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  noLimit == false ? totalCredits.toString() : "",
                  style: TextStyle(
                    fontSize: 14,
                    color: GatewayColor.subText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '학점',
                  style: TextStyle(
                    fontSize: 14,
                    color: GatewayColor.subText,
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
