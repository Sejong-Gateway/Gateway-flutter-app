import 'package:flutter/material.dart';
import 'package:login_page/models/subject_model.dart';
import 'package:login_page/utils/gateway_color.dart';

class SubjectRow extends StatelessWidget {

  final SubjectModel subject;

  const SubjectRow({Key key, this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(36, 0, 36, 12),
      padding:
      EdgeInsets.fromLTRB(24, 9, 24, 9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            blurRadius: 6,
            offset: Offset(0,
                2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment:
        CrossAxisAlignment.center,
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                child: Text(
                  subject.name ?? "",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: GatewayColor.primary,
                    height: 1.3,
                  ),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Text(
                subject.major,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: GatewayColor.subText,
                  height: 1.55,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Row(
            children: [
              this._courseTag(subject.type),
              SizedBox(
                width: 4,
              ),
              this._semesterTag(subject.semester),
            ],
          )
        ],
      ),
    );
  }
}

extension on SubjectRow{
  Widget _courseTag(String labelText) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
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
      padding: EdgeInsets.only(left: 5, right: 5, bottom: 2),
      // width: 30,
      height: 18,
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
