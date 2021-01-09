import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


//arrow highlight가 안됨 => 과목 토글은 가능
class certificateguideline extends StatefulWidget {

  static Route route(){
    return MaterialPageRoute<void>(
      builder: (_)=>certificateguideline(),
    );
  }

  @override
  certificateguidelineState createState() => certificateguidelineState();
}

class certificateguidelineState extends State<certificateguideline> {
  bool arrowSelect1;
  bool arrowSelect2;
  bool _arrowSelect3;
  bool arrowSelect4;
  bool arrowSelect5;
  bool arrowSelect6;
  bool arrowSelect7;
  bool arrowSelect8;
  void refresh2(dynamic childValue) {
    setState(() {
      arrowSelect2 = childValue;
    });
  }
  void refresh3(dynamic childValue) {
    setState(() {
      _arrowSelect3 = childValue;
    });
  }
  void refresh4(dynamic childValue) {
    setState(() {
      arrowSelect4 = childValue;
    });
  }
  void refresh5(dynamic childValue) {
    setState(() {
      arrowSelect5 = childValue;
    });
  }
  void refresh6(dynamic childValue) {
    setState(() {
      arrowSelect6 = childValue;
    });
  }
  void refresh7(dynamic childValue) {
    setState(() {
      arrowSelect7 = childValue;
    });
  }
  void refresh8(dynamic childValue) {
    setState(() {
      arrowSelect8 = childValue;
    });
  }
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
                  child: SvgPicture.asset(
                    'asset/arrowSVG/arrow1.svg',color: arrowSelect2 == true ? Color(0xff6d69fb):Color(0xffefefef)
                  ),
                ),
                Container(
                  //C프로그래밍 - 고급 C프로그래밍 화살표
                  padding: EdgeInsets.fromLTRB(270, 92, 0, 0),
                  child: SvgPicture.asset(
                    'asset/arrowSVG/arrow2.svg',color: arrowSelect2 == true ? Color(0xff6d69fb):Color(0xffefefef)
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(118, 79, 0, 0),
                  child:
                  courseBoxes(labelText: "C프로그래밍 실습",xSize: 139,notifyParent: refresh2,),
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
                  child: SvgPicture.asset(
                    'asset/arrowSVG/arrow3.svg',color: _arrowSelect3 == true ? Color(0xff6d69fb):Color(0xffefefef)
                  ),
                ),
                Container(
                  //고급 C프로그래밍 - 문제 해결 및 실습: C++ 화살표
                  padding: EdgeInsets.fromLTRB(279, 197, 0, 0),
                  child: SvgPicture.asset(
                    'asset/arrowSVG/arrow4.svg',color: arrowSelect4 == true ? Color(0xff6d69fb):Color(0xffefefef)
                  ),
                ),
                Container(
                  //자료구조 및 실습 - 알고리즘 및 실습 화살표
                  padding: EdgeInsets.fromLTRB(261, 294, 0, 0),
                  child: SvgPicture.asset(
                    'asset/arrowSVG/arrow5.svg',color: arrowSelect5 == true ? Color(0xff6d69fb):Color(0xffefefef)
                  ),
                ),
                //색 업데이트 안됨 => 2020 1 6 해결 불가능, state변화 감지가 안됨
                Container(
                  padding: EdgeInsets.fromLTRB(136, 144, 0, 0),
                  child: courseBoxes(labelText: "공업수학",xSize: 103,notifyParent: refresh3,),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(105, 179, 0, 0),
                  child:
                  courseBoxes(labelText: "고급C프로그래밍실습",xSize: 165,notifyParent: refresh4,),
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
                  child:
                  courseBoxes(labelText: "자료구조 및 실습",xSize: 136,notifyParent: refresh5,),
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
                  child: SvgPicture.asset(
                    'asset/arrowSVG/arrow6.svg',color: arrowSelect6 == true ? Color(0xff6d69fb):Color(0xffefefef)
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(120, 379, 0, 0),
                  child: courseBox("알고리즘 및 실습"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(136, 414, 0, 0),
                  child:
                  courseBoxes(labelText: "통계학개론",xSize: 104,notifyParent: refresh6,),
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
                  child: SvgPicture.asset(
                    'asset/arrowSVG/arrow7.svg',color: arrowSelect7 == true ? Color(0xff6d69fb):Color(0xffefefef)
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(136, 479, 0, 0),
                  child: courseBox("데이터분석"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(110, 514, 0, 0),
                  child:
                  courseBoxes(labelText: "고급실시간그래픽스",xSize: 156,notifyParent: refresh7,),
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
                  child: SvgPicture.asset(
                    'asset/arrowSVG/arrow8.svg',color: arrowSelect8 == true ? Color(0xff6d69fb):Color(0xffefefef)
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(116, 579, 0, 0),
                  child: courseBox("컴퓨터애니메이션"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(117, 614, 0, 0),
                  child:
                  courseBoxes(labelText: "소프트웨어특강1",xSize: 141,notifyParent: refresh8,),
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
                  child: courseBox("소프트웨어특강2"),
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
                  padding: EdgeInsets.fromLTRB(80, 764, 0, 0),
                  child: SvgPicture.asset(
                    'asset/questionmark.svg',
                  ),
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

class courseBoxes extends StatefulWidget {
  String labelText;
  double xSize;
  Function(dynamic) notifyParent;
  courseBoxes({Key key, @required this.labelText, this.xSize,this.notifyParent})
      : super(key: key);

  @override
  courseBoxState createState() => courseBoxState();
}

class courseBoxState extends State<courseBoxes> {
  bool selected = false;
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ChoiceChip(
          padding: EdgeInsets.only(bottom: 8),

          label: Container(
            child: Text(
              widget.labelText,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
          visualDensity: VisualDensity.standard,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
            side: BorderSide(
              color:selected == true ? Color(0xff6d69fb) : Color(0xfff3f2ff)
            )
          ),
          selected: selected,
          labelStyle: TextStyle(color: Colors.white),
          backgroundColor: Color(0xfff3f2ff),
          selectedColor: Color(0xffbeb9ff),
          onSelected: (selected) {
            setState(
              () {
                this.selected = !this.selected;
                widget.notifyParent(this.selected);
              },
            );
          },
        ),
      ),
      height: 26,
      width: widget.xSize,
    );
  }
}
