import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gateway/utils/gateway_color.dart';
import 'package:gateway/components/Appbar.dart' as Gateway;

class ProfilePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => ProfilePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: Gateway.AppBar(
        preferredSize: Size.fromHeight(56),
        backgroundColor: GatewayColor.white,
        leftButtonExist: true,
        title: '내정보',
      ),
      body: this._body(context),
    );
  }
}

extension on ProfilePage {
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
          this._devEmail("eunsol2953@gmail.com"),
        ],
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
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: GatewayColor.primary,
          ),
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
      padding: EdgeInsets.only(bottom: 1),
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
      padding: EdgeInsets.only(bottom: 2),
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
