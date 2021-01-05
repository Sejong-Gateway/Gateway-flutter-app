import 'package:flutter/material.dart';

class departmentModal {
  String dropValue;

  mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Color(0xffe5e3ff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(top:14,left: 23),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _createTile(context, '기린', _action1),
                _createTile(context, '토끼', _action2),
                _createTile(context, '거북이', _action3),
                _createTile(context, '거북이', _action3),
                _createTile(context, '거북이', _action3),
              ],
            ),
          );
        });
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
