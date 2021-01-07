import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_page/models/Course_model.dart';

const GatewayColor = Color(0xff6d69fb);

class ProfileTagPage extends StatelessWidget {

  static Route route(){
    return MaterialPageRoute<void>(
      builder: (_)=>ProfileTagPage(),
    );
  }

  List<CourseModel> courseList = [
    CourseModel.dummy(),
    CourseModel.dummy(),
    CourseModel.dummy()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar:AppBar(
        centerTitle: true,
        title: Text(
          '내정보',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(icon: SvgPicture.asset('asset/Backwardarrow.svg'), color: Color(0xff6d69fb),
          onPressed: () {Navigator.pop(context);},
        ),
        toolbarHeight: 44,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: this._body(context),
    );
  }
}

extension on ProfileTagPage {
  Widget _body(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 21,
          ),
          this._stuIDwithQuit(77777),
          SizedBox(
            height: 20,
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
            height: 20,
          ),
          Text(
            '태그 설정',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Text(
            '기본 태그',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 9,
          ),
          Text(
            '이수 구분',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 7,
          ),
          this._listSpread('이수'),
          SizedBox(
            height: 10,
          ),
          Text(
            '학년 구분',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          this._listSpread(''),
          SizedBox(
            height: 25,
          ),
          //+ 가 svg이미가 아님
          InkWell(
            child: Text(
              "+     태그추가",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff6d69fb),
              ),
            ),
            onTap: () => {},
          ),
          SizedBox(
            height: 20,
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
            height: 20,
          ),
          Text(
            '기타 문의',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 18,
          ),
          this._devEmail("noddeokbooki@gmail.com"),
        ],
      ),
    );
  }

  //height:18 해결해야함, 버그는 잡았으나 height 18 의미없는 값임
  Widget _listSpread(String courseSemsterChoice) {
    return Container(
      height: 18,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: courseList.length,
        itemBuilder: (context, index) {
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                courseSemsterChoice == '이수'
                    ? this._courseTag(courseList[index].type)
                    : this._semesterTag(
                        courseList[index].grade,
                      ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _devEmail(String email) {
    return Row(
      children: [
        Text(
          '개발자 이메일',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: 18,
        ),
        Text(
          email,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff989898),),
        ),
      ],
    );
  }

  Widget _stuIDwithQuit(int stuID) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '계정',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 18,
        ),
        Row(
          children: [
            Text(
              '학번',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              stuID.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff989898),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        InkWell(
          child: Text(
            "회원 탈퇴",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff6d69fb),
            ),
          ),
          onTap: () => {},
        ),
      ],
    );
  }

  Widget _courseTag(String labelText) {
    return Container(
      padding: EdgeInsets.only(bottom:1),
      width: 30,
      height: 18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Color(0xffffcfd4),
        ),
        color: Color(0xffffcfd4),
      ),
      child: Center(
        child: Text(
          labelText,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget _semesterTag(String labelText) {
    return Container(
      padding: EdgeInsets.only(bottom:2),
      width: 30,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Color(0xffcfe5f9),
        ),
        color: Color(0xffcfe5f9),
      ),
      child: Center(
        child: Text(
          labelText,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
