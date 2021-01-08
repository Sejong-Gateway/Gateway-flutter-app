import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/models/Course_model.dart';
import 'package:percent_indicator/percent_indicator.dart';

const GatewayColor = Color(0xff6c63ff);

class CurrentStatusTab extends StatelessWidget {
  static Route route(){
    return MaterialPageRoute<void>(
      builder: (_)=>CurrentStatusTab(),
    );
  }

  static bool engScoreActive = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          this._scoreShow(90, 140),
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
                  currentCredits: 6,
                  totalCredits: 7,
                  noLimit: false,
                ),
                SizedBox(
                  height: 25,
                ),
                ProgressBar(
                  labelText: "교양필수1",
                  currentCredits: 2,
                  totalCredits: 3,
                  noLimit: false,
                ),
                SizedBox(
                  height: 25,
                ),
                ProgressBar(
                  labelText: "학문기초교양",
                  currentCredits: 1,
                  totalCredits: 3,
                  noLimit: false,
                ),
                SizedBox(
                  height: 25,
                ),
                ProgressBar(
                  labelText: "전공필수",
                  currentCredits: 3,
                  totalCredits: 9,
                  noLimit: false,
                ),
                SizedBox(
                  height: 25,
                ),
                ProgressBar(
                  labelText: "전공선택",
                  currentCredits: 12,
                  totalCredits: 24,
                  noLimit: false,
                ),
                SizedBox(
                  height: 25,
                ),
                ProgressBar(
                  labelText: "교양선택2",
                  currentCredits: 9,
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
                this._sejongVolunteer(0),
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
                this._bookReq(),
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
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
                              width: 119,
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
                                      fontSize: 9, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              width: 220,
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
                                      fontSize: 9, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                ),
                Container(
                  child: engScoreActive
                      ? this._tableScoreInput("TOEIC",true)
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
                SizedBox(
                  height: 35,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _scoreShow(int currentCredit, int totalCredit) {
    return Container(
      child: Row(
        children: [
          Stack(
            children: [
              Image.asset(
                'asset/logo2x.jpg',
                height: 172,
                width: 243,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(183, 32, 0, 0),
                child: Text(
                  "현재 취득한 학점은?",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(244, 69, 0, 0),
                child: Text(
                  currentCredit.toString(),
                  style: TextStyle(
                      fontSize: 30,
                      color: GatewayColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(288, 71, 0, 0),
                child: Text(
                  "학점",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(254, 136, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "남은학점",
                      style: TextStyle(
                          fontSize: 10,
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
          ),
        ],
      ),
    );
  }

  Widget _modify(String labelText1, String inselText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(labelText1,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
        InkWell(
          child: Text(
            inselText,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff6d69fb),
            ),
          ),
          onTap: () => {},
        )
      ],
    );
  }

  Widget _bookReq() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '고전독서인증',
          style: TextStyle(
              fontSize: 9, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(
          height: 11,
        ),
        Row(
          children: [
            Container(
              width: 129,
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
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Container(
              width: 105,
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
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Container(
              width: 105,
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
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            )
          ],
        ),
        this._booktableInput('서양의 역사와 사상', 4, 4,false),
        this._booktableInput('동양의 역사와 사상', 4, 0,false),
        this._booktableInput('동서양의 문학', 4, 0,false),
        this._booktableInput('과학사상', 4, 4,false),
        this._booktableInput('합계', 13, 4,true),
      ],
    );
  }

  Widget _tableScoreInput(String courseLabel,bool Endline) {
    return Row(
      children: [
        Container(
          width: 119,
          height: 33,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(color: Color(0xffbebbfd), width: 1),
              bottom: Endline == true ? BorderSide(color: Color(0xffffffff), width: 0) : BorderSide(color: Color(0xffbebbfd), width: 1),
            ),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(17, 11, 73, 9),
            child: Text(
              courseLabel,
              style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          width: 220,
          height: 33,
          decoration: BoxDecoration(
            border: Border(
              right: Endline == true ? BorderSide(color: Color(0xffffffff), width: 0) : BorderSide(color: Color(0xffbebbfd), width: 1),
              bottom: Endline == true ? BorderSide(color: Color(0xffffffff), width: 0) : BorderSide(color: Color(0xffbebbfd), width: 1),
            ),
            color: Color(0xffe5e3ff),
          ),
          child: Container(
            child: TextFormField(
              cursorColor: Colors.black,
              decoration: new InputDecoration(
                contentPadding: EdgeInsets.only(top: 0, left: 75, bottom: 20),
                border: InputBorder.none,
                //labelstyle 작동 안됨
                //labelStyle: TextStyle(fontSize: 8),
                hintText: "점수를 입력해주세요",
                hintStyle: TextStyle(fontSize: 8, fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _booktableInput(String courseLabel, int totalBook, int currentBook,bool Endline) {
    return Row(
      children: [
        Container(
          width: 129,
          height: 33,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(color: Color(0xffbebbfd), width: 1),
              bottom: Endline == true ? BorderSide(color: Color(0xffffffff), width: 0) : BorderSide(color: Color(0xffbebbfd), width: 1),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                courseLabel,
                style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ],
          ),
        ),
        Container(
          width: 105,
          height: 33,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(color: Color(0xffbebbfd), width: 1),
              bottom: Endline == true ? BorderSide(color: Color(0xffffffff), width: 0) : BorderSide(color: Color(0xffbebbfd), width: 1),
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
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: totalBook == 0 ? Colors.red : Colors.black),
                ),
              ),
              Text(
                '권',
                style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              )
            ],
          ),
        ),
        Container(
          width: 105,
          height: 33,
          decoration: BoxDecoration(
            border: Border(
              //right: BorderSide(color: Color(0xffbebbfd), width: 1),
              bottom: Endline == true ? BorderSide(color: Color(0xffffffff), width: 0) : BorderSide(color: Color(0xffbebbfd), width: 1),
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
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: currentBook == 0 ? Colors.red : Colors.black),
                ),
              ),
              Text(
                '권',
                style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: currentBook == 0 ? Colors.red : Colors.black),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _sejongVolunteer(int currentVolunteerTime) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '세종사회봉사1',
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
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
              currentVolunteerTime.toString(),
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

  ProgressBar(
      {Key key,
      @required this.labelText,
      this.noLimit,
      this.currentCredits,
      this.totalCredits})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ProgressStatus(
          this.labelText, this.currentCredits, this.totalCredits, this.noLimit),
    );
  }

  Widget ProgressStatus(
      String labelText, int currentCredits, int totalCredits, bool noLimit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          labelText,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            LinearPercentIndicator(
              width: 230,
              lineHeight: 10,
              percent: currentCredits / totalCredits,
              progressColor: GatewayColor,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  currentCredits.toString(),
                  style: TextStyle(
                      fontSize: 10,
                      color: GatewayColor,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  noLimit == true ? "" : "/",
                  style: TextStyle(
                      fontSize: 10,
                      color:  Color(0xff989898),
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  noLimit == false ? totalCredits.toString() : "",
                  style: TextStyle(
                      fontSize: 10,
                      color: Color(0xff989898),
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  noLimit == true ? "학점" : "과목",
                  style: TextStyle(fontSize: 10, color: Color(0xff989898)),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
