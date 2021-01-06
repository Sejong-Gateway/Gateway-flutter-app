import 'package:flutter/material.dart';

class semesterModal {
  String dropValue;

  mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: Color(0xffe5e3ff),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(top: 14, left: 23),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _createTile(context, '새내기', _action1),
              _createTile(context, '헌내기', _action2),
              _createTile(context, '암모나이트', _action3),
            ],
          ),
        );
      },
    );
  }

  ListTile _createTile(BuildContext context, String name, Function action) {
    return ListTile(
      title: Text(
        name,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
      ),
      onTap: () {
        Navigator.pop(context);
        action();
      },
    );
  }

  _action1() {
    dropValue = "1";
  }

  _action2() {
    dropValue = "2";
  }

  _action3() {
    dropValue = "3";
  }
}
