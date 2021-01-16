import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/components/indicator_view.dart';
import 'package:login_page/core/base_screen.dart';
import 'package:login_page/utils/gateway_color.dart';
import 'package:login_page/viewmodel/main_viewmodel.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CurrentStatusTab extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => CurrentStatusTab(),
    );
  }

  static bool engScoreActive = true;

  @override
  Widget build(BuildContext context) {
    return BaseScreen<MainViewModel>(
      onModelReady: (model) {
        model.onInitState();
      },
      builder: (context, model, child) {
        if (model.user == null) {
          return IndicatorView();
        }
        return SafeArea(
          child: ListView(
            children: [
              SizedBox(height: 24),
              this._scoreShow(context, model.getTotalCredit(), 140),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 36),
                child: Column(
                  children: [
                    this._modify("기이수", "편집"),
                    SizedBox(
                      height: 18,
                    ),
                    ProgressBar(
                      labelText: "교양필수",
                      currentCredits: model.user.completeSubjects
                          .where((element) => element.type == "교양필수")
                          .length,
                      totalCredits: 9,
                      noLimit: false,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    ProgressBar(
                      labelText: "교양선택1",
                      currentCredits: model.getSubjectCredit('교양선택1'),
                      totalCredits: 21,
                      noLimit: false,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    ProgressBar(
                      labelText: "학문기교",
                      currentCredits: model.getSubjectCredit('교양선택1'),
                      totalCredits: 3,
                      noLimit: false,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    ProgressBar(
                      labelText: "전공필수",
                      currentCredits: model.getSubjectCredit('전공필수'),
                      totalCredits: 34,
                      noLimit: false,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    ProgressBar(
                      labelText: "전공선택",
                      currentCredits: model.getSubjectCredit('전공선택'),
                      totalCredits: 24,
                      noLimit: false,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    ProgressBar(
                      labelText: "교양선택2",
                      currentCredits: model.getSubjectCredit('교양선택2'),
                      totalCredits: 9,
                      noLimit: true,
                    ),
                    SizedBox(
                      height: 29,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      child: Container(
                        height: 1.0,
                        width: double.infinity,
                        color: Color(0xffefefef),
                      ),
                    ),
                    SizedBox(
                      height: 29,
                    ),
                    this._modify("공통졸업요건", "편집"),
                    SizedBox(
                      height: 18,
                    ),
                    this._sejongVolunteer(0, model),
                    SizedBox(
                      height: 13,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      child: Container(
                        height: 1.0,
                        width: double.infinity,
                        color: Color(0xffefefef),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    this._bookReq(model),
                    SizedBox(
                      height: 13,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      child: Container(
                        height: 1.0,
                        width: double.infinity,
                        color: Color(0xffefefef),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "영어졸업인증",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Container(
                      child: engScoreActive
                          ? Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 33,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                          color: Color(0xffbebbfd), width: 1),
                                      bottom: BorderSide(
                                          color: Color(0xffbebbfd), width: 1),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '구분',
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Container(
                                  height: 33,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: Color(0xffbebbfd), width: 1),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '취득점수',
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                              ],
                            )
                          : Container(),
                    ),
                    Container(
                      child: engScoreActive
                          ? this._tableScoreInput(
                              "TOEIC", true, model.user.toeic, 990)
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '아직 취득한 점수가 없습니다.',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff989898)),
                                ),
                              ],
                            ),
                    ),
                    model.user.opic != null
                        ? this._tableScoreInput(
                            "opic", true, model.user.toeic, 990)
                        : SizedBox(),
                    model.user.teps != null
                        ? this._tableScoreInput(
                            "teps", true, model.user.toeic, 990)
                        : SizedBox(),
                    model.user.ibt != null
                        ? this._tableScoreInput(
                            "ibt", true, model.user.toeic, 990)
                        : SizedBox(),
                    model.user.toeicSpeaking != null
                        ? this._tableScoreInput(
                            "toeicSpeaking", true, model.user.toeic, 990)
                        : SizedBox(),
                    SizedBox(
                      height: 35,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _scoreShow(BuildContext context, int currentCredit, int totalCredit) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Image.asset(
            'asset/logo2x.jpg',
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
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "남은학점",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff888888),
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          (totalCredit - currentCredit).toString(),
                          style: TextStyle(
                              fontSize: 10,
                              color: Color(0xff888888),
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '학점',
                          style: TextStyle(
                              fontSize: 10,
                              color: Color(0xff888888),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
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
            fontSize: 14,
            fontWeight: FontWeight.bold,
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

  Widget _bookReq(MainViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '고전독서인증',
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(
          height: 11,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                width: 100,
                height: 33,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Color(0xffbebbfd), width: 1),
                    bottom: BorderSide(color: Color(0xffbebbfd), width: 1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '구분',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 80,
              height: 33,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Color(0xffbebbfd), width: 1),
                  bottom: BorderSide(color: Color(0xffbebbfd), width: 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '인증권수',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Container(
              width: 80,
              height: 33,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xffbebbfd), width: 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '이수권수',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            )
          ],
        ),
        this._booktableInput(
            '서양의 역사와 사상', 4, model.user.westernBook ?? 0, false),
        this._booktableInput(
            '동양의 역사와 사상', 4, model.user.easternBook ?? 0, false),
        this._booktableInput(
            '동서양의 문학', 4, model.user.literatureBook ?? 0, false),
        this._booktableInput('과학사상', 1, model.user.scienceBook ?? 0, false),
        this._booktableInput('합계', 13, 4, true, false),
      ],
    );
  }

  Widget _tableScoreInput(
      String courseLabel, bool Endline, int currentScore, int maxScore) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 33,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(color: Color(0xffbebbfd), width: 1),
              bottom: Endline == true
                  ? BorderSide(color: Color(0xffffffff), width: 0)
                  : BorderSide(color: Color(0xffbebbfd), width: 1),
            ),
          ),
          child: Container(
              child: Align(
            alignment: Alignment.center,
            child: Text(
              courseLabel,
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            ),
          )),
        ),
        Expanded(
            child: Container(
          height: 33,
          decoration: BoxDecoration(
            border: Border(
              right: Endline == true
                  ? BorderSide(color: Color(0xffffffff), width: 0)
                  : BorderSide(color: Color(0xffbebbfd), width: 1),
              bottom: Endline == true
                  ? BorderSide(color: Color(0xffffffff), width: 0)
                  : BorderSide(color: Color(0xffbebbfd), width: 1),
            ),
            color: Color(0xffe5e3ff),
          ),
          child: Container(
              child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${currentScore.toString()}',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xff6c63ff),
                          )),
                      Text(' / ${maxScore.toString()}',
                          style: TextStyle(
                            fontSize: 11,
                          )),
                    ],
                  ))),
        )),
      ],
    );
  }

  Widget _booktableInput(
      String courseLabel, int totalBook, int currentBook, bool Endline,
      [bool textAlignLeft]) {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: 33,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(color: Color(0xffbebbfd), width: 1),
              bottom: Endline == true
                  ? BorderSide(color: Color(0xffffffff), width: 0)
                  : BorderSide(color: Color(0xffbebbfd), width: 1),
            ),
          ),
          child: Row(
            mainAxisAlignment: textAlignLeft == false
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              SizedBox(width: 11),
              Text(
                courseLabel,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        )),
        Container(
          width: 80,
          height: 33,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(color: Color(0xffbebbfd), width: 1),
              bottom: Endline == true
                  ? BorderSide(color: Color(0xffffffff), width: 0)
                  : BorderSide(color: Color(0xffbebbfd), width: 1),
            ),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  totalBook.toString(),
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: totalBook == 0 ? Colors.red : Colors.black),
                ),
              ),
              Text(
                '권',
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              )
            ],
          ),
        ),
        Container(
          width: 80,
          height: 33,
          decoration: BoxDecoration(
            border: Border(
              //right: BorderSide(color: Color(0xffbebbfd), width: 1),
              bottom: Endline == true
                  ? BorderSide(color: Color(0xffffffff), width: 0)
                  : BorderSide(color: Color(0xffbebbfd), width: 1),
            ),
            color: Color(0xffe5e3ff),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  currentBook.toString(),
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: currentBook == 0 ? Colors.red : Colors.black),
                ),
              ),
              Text(
                '권',
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: currentBook == 0 ? Colors.red : Colors.black),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _sejongVolunteer(int currentVolunteerTime, MainViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '세종사회봉사1',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 9,
        ),
        Row(
          children: [
            Text(
              '봉사시간',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff888888),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              model.user.volunteerTime.toString(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff888888),
              ),
            ),
            Text(
              '시간',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff888888),
              ),
            ),
          ],
        ),
      ],
    );
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
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
                    fontSize: 12,
                    color: GatewayColor.primary,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
                Text(
                  noLimit == true ? "" : "/",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff989898),
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
                Text(
                  noLimit == false ? totalCredits.toString() : "",
                  style: TextStyle(
                    fontSize: 12,
                    color: GatewayColor.subText,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
                Text(
                  '학점',
                  style: TextStyle(fontSize: 12, color: GatewayColor.subText),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
