import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class certificateguideline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
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
                padding: EdgeInsets.fromLTRB(118, 167, 119, 0),
                child: courseBox("C프로그래밍 실습"),
              )
            ],
          ),
        ],
      ),
    ));
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
