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
      padding: EdgeInsets.fromLTRB(24, 9, 24, 9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            blurRadius: 6,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 150),
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
              this._tag(subject.type, GatewayColor.typeColor),
              SizedBox(width: 4),
              this._tag(subject.semester, GatewayColor.semesterColor),
            ],
          )
        ],
      ),
    );
  }
}

extension on SubjectRow {
  Widget _tag(String labelText, Color color) {
    return Container(
      height: 20,
      padding: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          labelText,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
      )
    );
  }
}
