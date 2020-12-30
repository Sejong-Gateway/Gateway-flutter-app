import 'package:flutter/material.dart';

class Modal2{
  String dropValue;
  mainBottomSheet(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _createTile(context, 'Message', Icons.message, _action1),
              _createTile(context, 'Take Photo', Icons.camera_alt, _action2),
              _createTile(context, 'My Images', Icons.photo_library, _action3),
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
