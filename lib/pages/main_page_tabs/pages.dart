import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(children: [
          _scoreShow(),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 36),
              child: Column(children: [
                this._modify("기이수", "편집"),
                SizedBox(
                  height: 18,
                ),
                ProgressBar(
                  labelText: "교양필수",
                ),
                SizedBox(
                  height: 25,
                ),
                ProgressBar(
                  labelText: "교양필수1",
                ),
                SizedBox(
                  height: 25,
                ),
                ProgressBar(
                  labelText: "학문기초교양",
                ),
                SizedBox(
                  height: 25,
                ),
                ProgressBar(
                  labelText: "전공필수",
                ),
                SizedBox(
                  height: 25,
                ),
                ProgressBar(
                  labelText: "전공선택",
                ),
                SizedBox(
                  height: 25,
                ),
                ProgressBar(
                  labelText: "교양선택2",
                ),
                SizedBox(
                  height: 73,
                ),
                this._modify("공통졸업요건", "편집"),
                this._bookReq(),
              ]))
        ]));
  }

  Widget _scoreShow() {
    return Container(
      child: Row(
        children: [
          Image.asset(
            'asset/logo2.jpg',
            height: 172,
            width: 243,
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
                  color: Colors.deepPurpleAccent)),
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

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
                padding: EdgeInsets.symmetric(horizontal: 36),
                child: SafeArea(
                    child: ListView(children: [
                      SizedBox(
                        height: 27,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '현재 나의 학기는?',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '학기',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            )
                          ]),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '전공',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '수강하고 있는 과목이 없습니다',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        '교양',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '수강하고 있는 과목이 없습니다',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 110,
                      ),
                      SizedBox(
                        height: 37,
                        width: 155,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.deepPurpleAccent)),
                          onPressed: () {},
                          color: Colors.deepPurpleAccent,
                          textColor: Colors.white,
                          child: Text("이수할 과목 추가".toUpperCase(),
                              style: TextStyle(fontSize: 14)),
                        ),
                      ),
                    ])))));
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
                padding: EdgeInsets.only(left: 36, right: 36),
                child: ListView(children: [
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    '전공선택',
                    style:
                    TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ]))));
  }
}

class ProgressBar extends StatelessWidget {
  final String labelText;

  ProgressBar({Key key, @required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ProgressStatus(this.labelText),
    );
  }

  Widget ProgressStatus(String labelText) {
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
              percent: 0.60,
              progressColor: Colors.deepPurpleAccent,
            )
          ],
        ),
      ],
    );
  }
}
