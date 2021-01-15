import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_page/core/base_screen.dart';
import 'package:login_page/pages/main_page.dart';
import 'package:login_page/viewmodel/certificate_req_viewmodel.dart';

const GatewayColor = Color(0xff6d69fb);

class CertificateReqInput extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => CertificateReqInput(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen<CertificateReqViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              icon: SvgPicture.asset('asset/Backwardarrow.svg'),
              color: Color(0xff6d69fb),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            toolbarHeight: 44,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: this._body(context, model),
        );
      },
    );
  }
}

extension on CertificateReqInput {
  Widget _body(BuildContext context, CertificateReqViewModel model) {
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
          this._textField('서양의 역사와 사상', '권', model.westernBook),
          SizedBox(
            height: 15,
          ),
          this._textField('동양의 역사와 사상', '권', model.easternBook),
          SizedBox(
            height: 15,
          ),
          this._textField('동서양의 문학', '권', model.literatureBook),
          SizedBox(
            height: 15,
          ),
          this._textField('과학 사상', '권', model.scienceBook),
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
          this._textField('봉사시간', '시간', model.volunteerTime),
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
                          fontSize: 11,
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
          this._engTable(context, model),
        ],
      ),
    );
  }

  Widget _textField(
      String courseText, String countText, TextEditingController controller) {
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
                textAlign: TextAlign.end,
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 0, right: 3),
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

  Widget _engTable(context, CertificateReqViewModel model) {
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
            Expanded(
              child: Container(
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
            ),
          ],
        ),
        this._tableScoreInput("TOEIC", 700, model.toeic),
        this._tableScoreInput("IBT", 700, model.ibt),
        this._tableScoreInput("TEPS", 700, model.teps),
        this._tableScoreInput("OPIc", 700, model.opic),
        this._tableScoreInput("TOEIC Speaking", 700, model.toeicSpeaking),
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
                onPressed: () {
                  model.onClickNext();
                  // Navigator.of(context).push(MainPage.route());
                },
                color: Color(0xff6c63ff),
                textColor: Colors.white,
                child: Text("완료", style: TextStyle(fontSize: 14)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _tableScoreInput(
      String courseLabel, int courseScore, TextEditingController controller) {
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
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
            child: Container(
          height: 33,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(color: Color(0xffbebbfd), width: 2),
              bottom: BorderSide(color: Color(0xffbebbfd), width: 2),
            ),
            color: Color(0xffe5e3ff),
          ),
          child: Container(
            padding: EdgeInsets.only(right: 65),
            child: TextFormField(
              controller: controller,
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
              textAlign: TextAlign.end,
              cursorColor: Colors.black,
              decoration: new InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                //prefixStyle: TextStyle(fontSize: 8, fontWeight: FontWeight.w300),
                hintText: "점수를 입력해주세요",
                hintStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
                suffixText: '/$courseScore',
                suffixStyle:
                    TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
              ),
            ),
          ),
        )),
      ],
    );
  }
}
