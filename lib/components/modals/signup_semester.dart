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
          child: ListView(
            children: <Widget>[
              _createTile(context, '1-1', _action1),
              _createTile(context, '1-2', _action2),
              _createTile(context, '2-1', _action3),
              _createTile(context, '2-2', _action3),
              _createTile(context, '3-1', _action3),
              _createTile(context, '3-2', _action3),
              _createTile(context, '4-1', _action3),
              _createTile(context, '4-2', _action3),
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
