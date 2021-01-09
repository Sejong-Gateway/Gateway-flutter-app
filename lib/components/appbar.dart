import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Appbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(double.infinity, 56),
      child: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset('asset/Backwardarrow.svg'),
          color: Color(0xff6d69fb),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 44,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}