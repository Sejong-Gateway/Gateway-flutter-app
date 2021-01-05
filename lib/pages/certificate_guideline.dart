import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class certificateguideline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset('asset/Backwardarrow.svg'),
            color: Color(0xff6d69fb),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "공학인증",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          toolbarHeight: 44,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(36, 21, 0, 0),
                  child: Text(
                    "필수 선.후수",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(36, 83, 0, 0),
                  child: Text(
                    "1-1",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  //C프로그래밍 - 멀티미디어프로그래밍 화살표
                  padding: EdgeInsets.fromLTRB(277, 92, 0, 0),
                  child: SvgPicture.asset('asset/arrowSVG/arrow1.svg',),
                ),
                Container(
                  //C프로그래밍 - 고급 C프로그래밍 화살표
                  padding: EdgeInsets.fromLTRB(270, 92, 0, 0),
                  child: SvgPicture.asset('asset/arrowSVG/arrow2.svg',),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(118, 79, 0, 0),
                  child: courseBox("C프로그래밍 실습"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(36, 148, 0, 0),
                  child: Text(
                    "1-2",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  //공업수학1 - 멀티미디어 프로그래밍: C++ 화살표
                  padding: EdgeInsets.fromLTRB(247, 157, 0, 0),
                  child: SvgPicture.asset('asset/arrowSVG/arrow3.svg',),
                ),
                Container(
                  //고급 C프로그래밍 - 문제 해결 및 실습: C++ 화살표
                  padding: EdgeInsets.fromLTRB(279, 197, 0, 0),
                  child: SvgPicture.asset('asset/arrowSVG/arrow4.svg',),
                ),
                Container(
                  //자료구조 및 실습 - 알고리즘 및 실습 화살표
                  padding: EdgeInsets.fromLTRB(261, 294, 0, 0),
                  child: SvgPicture.asset('asset/arrowSVG/arrow5.svg',),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(136, 144, 0, 0),
                  child: courseBox("공업수학1"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(105, 179, 0, 0),
                  child: courseBox("고급C프로그래밍실습"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(36, 248, 0, 0),
                  child: Text(
                    "2-1",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(100, 244, 0, 0),
                  child: courseBox("문제 해결 및 실습: C++"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(120, 279, 0, 0),
                  child: courseBox("자료구조 및 실습"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(102, 314, 0, 0),
                  child: courseBox("멀티미디어 프로그래밍"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(36, 383, 0, 0),
                  child: Text(
                    "2-2",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  //통계학개론 - 데이터분석 화살표
                  padding: EdgeInsets.fromLTRB(246, 431, 0, 0),
                  child: SvgPicture.asset('asset/arrowSVG/arrow6.svg',),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(120, 379, 0, 0),
                  child: courseBox("알고리즘 및 실습"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(136, 414, 0, 0),
                  child: courseBox("통계학개론"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(36, 483, 0, 0),
                  child: Text(
                    "3-2",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  //고급실시간그래픽스 - 컴퓨터애니메이션 화살표
                  padding: EdgeInsets.fromLTRB(266, 527, 0, 0),
                  child: SvgPicture.asset('asset/arrowSVG/arrow7.svg',),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(136, 479, 0, 0),
                  child: courseBox("데이터분석"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(110, 514, 0, 0),
                  child: courseBox("고급실시간그래픽스"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(36, 583, 0, 0),
                  child: Text(
                    "4-1",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  //소프트웨어특강1 - 소프트웨어특강2 화살표
                  padding: EdgeInsets.fromLTRB(266, 627, 0, 0),
                  child: SvgPicture.asset('asset/arrowSVG/arrow8.svg',),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(116, 579, 0, 0),
                  child: courseBox("컴퓨터애니메이션"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(117, 614, 0, 0),
                  child: courseBox("소프트웨어특강1"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(36, 683, 0, 0),
                  child: Text(
                    "4-2",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(117, 679, 0, 0),
                  child: courseBox("소프트웨어특강1"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(36, 765, 0, 0),
                  child: Text(
                    "BSM",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(80, 768, 0, 0),
                  child: SvgPicture.asset('asset/questionmark.svg',),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(138, 766, 0, 0),
                  child: courseBox("기초미적분학"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(138, 801, 0, 0),
                  child: courseBox("공업수학1"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(138, 836, 0, 0),
                  child: courseBox("이산수학 및 프로그래밍"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(138, 871, 0, 0),
                  child: courseBox("일반물리 및 시뮬레이션"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(138, 906, 0, 0),
                  child: courseBox("선형대수 및 프로그래밍"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(138, 941, 0, 0),
                  child: courseBox("통계학개론"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(36, 1024, 0, 0),
                  child: Text(
                    "설계과목",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(36, 1070, 0, 0),
                  child: Text(
                    "기초설계",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(138, 1067, 0, 0),
                  child: courseBox("SW설계기초"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(36, 1128, 0, 0),
                  child: Text(
                    "요소설계",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(138, 1125, 0, 0),
                  child: courseBox("알고리즘 및 실습"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(138, 1160, 0, 0),
                  child: courseBox("문제 해결 및 실습: JAVA"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(138, 1195, 0, 0),
                  child: courseBox("운영체제"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(138, 1230, 0, 0),
                  child: courseBox("데이터베이스"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(138, 1265, 0, 0),
                  child: courseBox("컴퓨터그래픽스"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(138, 1300, 0, 0),
                  child: courseBox("게임프로그래밍"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(138, 1335, 0, 0),
                  child: courseBox("오픈소스SW개론"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(138, 1370, 0, 0),
                  child: courseBox("고급실시간그래픽스"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(138, 1405, 0, 0),
                  child: courseBox("오픈소스SW공학"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(138, 1440, 0, 0),
                  child: courseBox("가상현실"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(138, 1475, 0, 0),
                  child: courseBox("컴퓨터애니메이션"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(138, 1510, 0, 0),
                  child: courseBox("인공지능"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(138, 1545, 0, 0),
                  child: courseBox("지능형시스템"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(138, 1580, 0, 0),
                  child: courseBox("HCI개론"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(36, 1641, 0, 0),
                  child: Text(
                    "종합설계",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(138, 1638, 0, 0),
                  child: courseBox("Capstone디자인"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(138, 1709, 0, 0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget courseBox(String labelText) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfff3f2ff),
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
        border: Border.all(
          color: Color(0xfff3f2ff),
        ),
      ),
      padding: EdgeInsets.fromLTRB(20, 3, 20, 3),
      child: Text(
        labelText,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      ),
    );
  }
}


/*class courseBox extends StatefulWidget {
  String labelText;
  bool selected;

  courseBox({Key key, @required this.labelText}) : super(key: key);

  @override
  courseBoxState createState() => courseBoxState();
}

class courseBoxState extends State<courseBox> {
  bool _isSelected = false;

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 2.5,right: 2.5,top:2.5,bottom: 3),
      child: ChoiceChip(
        elevation: 4,
        label: Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Text(
              widget.labelText,
              style: TextStyle(
                color:
                _isSelected == true ? Color(0xffffffff) : Color(0xff6c63ff),
              ),
            ),
          ),
        ),
        visualDensity: VisualDensity.standard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
        selected: _isSelected,
        labelStyle: TextStyle(color: Colors.white),
        backgroundColor: Color(0xffffffff),
        selectedColor: Color(0xff6c63ff),
        onSelected: (bool selected) {
          setState(
                () {
              _isSelected = !_isSelected;
            },
          );
        },
      ),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(4)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.01),
            spreadRadius:0.01,
            blurRadius: 0.01,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
    );
  }
}*/
//stack시 클릭 오류 발생

