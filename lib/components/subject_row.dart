import 'package:flutter/material.dart';
import 'package:gateway/models/subject/subject.dart';
import 'package:gateway/utils/gateway_color.dart';

class SubjectRow extends StatelessWidget {
  final Subject subject;
  final bool isSelected;

  const SubjectRow({Key key, this.subject, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = isSelected ? MediaQuery.of(context).size.width - 48 : 0;
    Duration duration = Duration(milliseconds: 450);
    double borderWidth = 1.5;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: AnimatedOpacity(
              duration: duration,
              opacity: isSelected ? 1.0 : 0.0,
              child: AnimatedContainer(
                margin: EdgeInsets.symmetric(horizontal: 24),
                duration: duration,
                width: _width,
                height: borderWidth,
                color: GatewayColor.primary,
              ),
            ),
          ),
          SizedBox(
            height: 64,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 24),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: AnimatedOpacity(
                    duration: duration,
                    opacity: isSelected ? 1.0 : 0,
                    child: AnimatedContainer(
                      duration: duration,
                      width: borderWidth,
                      height: isSelected ? 64 : 0,
                      color: GatewayColor.primary,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    // margin: EdgeInsets.fromLTRB(24, 0, 24, 0),
                    padding: EdgeInsets.fromLTRB(24, 9, 24, 9),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // border: isSelected ? Border.all(color: GatewayColor.primary, width: 2) : Border.all(color: Colors.transparent, width: 2),
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
                                  fontSize: 16,
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
                              subject.department.name,
                              style: TextStyle(
                                fontSize: 14,
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
                            this._tag(
                                subject.type.name, GatewayColor.typeColor),
                            SizedBox(width: 4),
                            this._tag(
                                this.getSemesterToGrade(subject.semester) +
                                    "-" +
                                    this.getSemesterToString(subject.semester),
                                GatewayColor.semesterColor),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: isSelected ? 1.0 : 0.0,
                  duration: duration,
                  child: AnimatedContainer(
                    alignment: Alignment.bottomCenter,
                    duration: duration,
                    width: borderWidth,
                    height: isSelected ? 64 : 0,
                    color: GatewayColor.primary,
                  ),
                ),
                SizedBox(width: 24),
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: AnimatedOpacity(
                duration: duration,
                opacity: isSelected ? 1.0 : 0.0,
                child: AnimatedContainer(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  duration: duration,
                  width: _width,
                  height: borderWidth,
                  color: GatewayColor.primary,
                ),
              )),
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
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ));
  }

  String getSemesterToGrade(int semester) {
    return (semester / 4).ceil().toString();
  }

  String getSemesterToString(int semester) {
    return (2 - (semester % 2)).toString();
  }
}
