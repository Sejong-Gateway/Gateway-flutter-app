import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/models/Course_model.dart';
import 'package:percent_indicator/percent_indicator.dart';

const GatewayColor = Color(0xff6c63ff);

class CurrentStatusTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          this._scoreShow(90, 140),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 36),
              child: Column(children: [
                this._modify("기이수", "편집"),
                SizedBox(
                  height: 18,
                ),
                ProgressBar(
                  labelText: "교양필수",
                  currentCredits: 6,
                  totalCredits: 7,
                ),
                SizedBox(
                  height: 25,
                ),
                ProgressBar(
                  labelText: "교양필수1",
                  currentCredits: 2,
                  totalCredits: 3,
                ),
                SizedBox(
                  height: 25,
                ),
                ProgressBar(
                  labelText: "학문기초교양",
                  currentCredits: 1,
                  totalCredits: 3,
                ),
                SizedBox(
                  height: 25,
                ),
                ProgressBar(
                  labelText: "전공필수",
                  currentCredits: 3,
                  totalCredits: 9,
                ),
                SizedBox(
                  height: 25,
                ),
                ProgressBar(
                  labelText: "전공선택",
                  currentCredits: 12,
                  totalCredits: 24,
                ),
                SizedBox(
                  height: 25,
                ),
                ProgressBar(
                  labelText: "교양선택2",
                  currentCredits: 9,
                  totalCredits: 9,
                ),
                SizedBox(
                  height: 73,
                ),
                this._modify("공통졸업요건", "편집"),
                this._bookReq(),
              ]))
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
                  style: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(244, 70, 0, 0),
                child: Text(
                  currentCredit.toString(),
                  style: TextStyle(fontSize: 30, color: GatewayColor,fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(288, 71, 0, 0),
                child: Text(
                  "학점",
                  style: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold),
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
                      style: TextStyle(fontSize: 10, color: Color(0xff888888),fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      (totalCredit-currentCredit).toString(),
                      style: TextStyle(fontSize: 10, color: Color(0xff888888),fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '학점',
                      style: TextStyle(fontSize: 10, color: Color(0xff888888),fontWeight: FontWeight.w500),
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
              fontWeight: FontWeight.w700,
              color: Colors.black,
            )),
        InkWell(
          child: Text(inselText,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: GatewayColor)),
          onTap: () => {},
        )
      ],
    );
  }

//이 아래는 hardcoding 되어있음, widget화 시켜야함
  Widget _bookReq() {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
        ),
        child: DataTable(
          columns: [
            DataColumn(
                label: Text(
              '구분',
              style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              '인증권수',
              style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              '이수권수',
              style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
            )),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text(
                '서양과 역사의 사상',
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
              )),
              DataCell(Text(
                '4권',
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
              )),
              DataCell(Text(
                '4권',
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
              )),
            ]),
            DataRow(cells: [
              DataCell(Text(
                '동양의 역사와 사상',
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
              )),
              DataCell(Text(
                '4권',
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
              )),
              DataCell(Text(
                '4권',
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
              )),
            ]),
            DataRow(cells: [
              DataCell(Text(
                '동서양의 문학',
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
              )),
              DataCell(Text(
                '4권',
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
              )),
              DataCell(Text(
                '4권',
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
              )),
            ]),
            DataRow(cells: [
              DataCell(Text(
                '과학 사상',
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
              )),
              DataCell(Text(
                '4권',
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
              )),
              DataCell(Text(
                '4권',
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
              )),
            ]),
            DataRow(cells: [
              DataCell(Text(
                '합계',
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
              )),
              DataCell(Text(
                '4권',
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
              )),
              DataCell(Text(
                '4권',
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
              )),
            ]),
          ],
        ));
  }

  Widget _engReq() {}
}

class ProgressBar extends StatelessWidget {
  final String labelText;
  final int currentCredits;
  final int totalCredits;

  ProgressBar(
      {Key key,
      @required this.labelText,
      this.currentCredits,
      this.totalCredits})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ProgressStatus(
          this.labelText, this.currentCredits, this.totalCredits),
    );
  }

  Widget ProgressStatus(
      String labelText, int currentCredits, int totalCredits) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          labelText,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
        Column(
          children: [
            LinearPercentIndicator(
              width: 227,
              lineHeight: 10,
              percent: currentCredits / totalCredits,
              progressColor: GatewayColor,
            )
          ],
        ),
      ],
    );
  }
}
