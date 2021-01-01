import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const GatewayColor = Color(0xff6d69fb);

class CertificateReqInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: this._appBar,
      body: this._body(context),
    );
  }
}

extension on CertificateReqInput {
  Widget get _appBar => AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: GatewayColor,
          ),
          iconSize: 33,
          onPressed: () {},
        ),
        toolbarHeight: 44,
        backgroundColor: Colors.white,
        elevation: 0,
      );

  Widget _body(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 36),
        children: [
          SizedBox(
            height: 26,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '인증 완료한 항목을 작성해주세요',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 29,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '고전독서인증',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 26,
          ),
          this._textField('서양의 역사와 사상', '권'),
          SizedBox(
            height: 15,
          ),
          this._textField('동양의 역사와 사상', '권'),
          SizedBox(
            height: 15,
          ),
          this._textField('동서양의 문학', '권'),
          SizedBox(
            height: 15,
          ),
          this._textField('과학 사상', '권'),
          SizedBox(
            height: 23,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              height: 1.0,
              width: double.infinity,
              color: Color(0xffefefef),
            ),
          ),
          SizedBox(
            height: 23,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '세종사회봉사1',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          this._textField('봉사시간', '시간'),
          SizedBox(
            height: 23,
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
            height: 23,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '영어졸업인증',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 2),
                    child: Text(
                      '취득점수/커트라인',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 9,
                          color: Color(0xff888888)),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          this._engTable(),
        ],
      ),
    );
  }

  Widget _textField(String courseText, String countText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          courseText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          children: [
            Container(
              width: 30,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 0, left: 15),
                  isDense: true,
                  hintText: "0",
                  labelStyle: TextStyle(fontSize: 19),
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Text(
              countText,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _engTable() {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 119,
              height: 33,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Color(0xffbebbfd), width: 2),
                  bottom: BorderSide(color: Color(0xffbebbfd), width: 2),
                ),
              ),
              child: Center(
                child: Text(
                  '구분',
                  style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              width: 220,
              height: 33,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Color(0xffbebbfd), width: 2),
                  bottom: BorderSide(color: Color(0xffbebbfd), width: 2),
                ),
              ),
              child: Center(
                child: Text(
                  '취득점수',
                  style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        this._tableScoreInput("TOEIC"),
        this._tableScoreInput("IBT"),
        this._tableScoreInput("TEPS"),
        this._tableScoreInput("OPIc"),
        this._tableScoreInput("TOEIC Speaking"),
        SizedBox(
          height: 31,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 120,
              height: 39,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(
                    color: Color(0xff6c63ff),
                  ),
                ),
                onPressed: () {},
                color: Color(0xff6c63ff),
                textColor: Colors.white,
                child: Text("완료", style: TextStyle(fontSize: 14)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 200,
        ),
      ],
    );
  }

  Widget _tableScoreInput(String courseLabel) {
    return Row(
      children: [
        Container(
          width: 119,
          height: 33,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(color: Color(0xffbebbfd), width: 2),
              bottom: BorderSide(color: Color(0xffbebbfd), width: 2),
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
              right: BorderSide(color: Color(0xffbebbfd), width: 2),
              bottom: BorderSide(color: Color(0xffbebbfd), width: 2),
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
}


