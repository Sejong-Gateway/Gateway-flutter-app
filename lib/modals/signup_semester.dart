import 'package:flutter/material.dart';

class semesterModal{
  String dropValue;
  mainBottomSheet(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _createTile(context, '새내기', Icons.keyboard_arrow_right, _action1),
              _createTile(context, '헌내기', Icons.keyboard_arrow_right, _action2),
              _createTile(context, '암모나이트', Icons.keyboard_arrow_right, _action3),
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
