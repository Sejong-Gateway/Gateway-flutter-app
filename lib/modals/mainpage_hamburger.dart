import 'package:flutter/material.dart';

class MainpageHamburger {
  String dropValue;

  mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _createTile(
                  context, '내정보', Icons.keyboard_arrow_right, _action1),
              _createTile(
                  context, '공학인증', Icons.keyboard_arrow_right, _action2),
            ],
          ),
        );
      },
    );
  }

  ListTile _createTile(
      BuildContext context, String name, IconData icon, Function action) {
    return ListTile(
      trailing: Icon(icon),
      title: Text(name,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
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
}
