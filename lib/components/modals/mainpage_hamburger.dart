import 'package:flutter/material.dart';
import 'package:login_page/pages/certificate_guideline.dart';
import 'package:login_page/pages/profiletag_page.dart';
import 'package:login_page/pages/register_page.dart';

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
              _createTile(context, '내정보', Icons.keyboard_arrow_right),
              _createTile(context, '공학인증', Icons.keyboard_arrow_right),
            ],
          ),
        );
      },
    );
  }

  ListTile _createTile(BuildContext context, String name, IconData icon) {
    return ListTile(
      trailing: Icon(icon),
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
      onTap: () {
        name == "공학인증"
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => certificateguideline(),
                ),
              )
            : Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileTagPage(),
                ),
              );
      },
    );
  }
}
