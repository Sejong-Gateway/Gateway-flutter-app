
import 'package:flutter/material.dart';

class departmentModal{
  String dropValue;
  mainBottomSheet(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _createTile(context, '기린', Icons.keyboard_arrow_right, _action1),
              _createTile(context, '토끼', Icons.keyboard_arrow_right, _action2),
              _createTile(context, '거북이', Icons.keyboard_arrow_right, _action3),
            ],
          );
        }
    );
  }

  ListTile _createTile(BuildContext context, String name, IconData icon, Function action){
    return ListTile(
      leading: Icon(icon),
      title: Text(name),
      onTap: (){
        Navigator.pop(context);
        action();
      },
    );
  }

  _action1(){
    dropValue="1";
  }

  _action2(){
    dropValue="2";
  }

  _action3(){
    dropValue="3";
  }
}
