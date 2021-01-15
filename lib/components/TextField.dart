import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as Material;
import 'package:login_page/utils/gateway_color.dart';

class TextField extends StatefulWidget {
  final String hintText;
  final bool activation;
  final String labelText;
  final TextEditingController controller;

  TextField({
    Key key,
    this.hintText,
    this.activation,
    this.controller,
    this.labelText,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TextFieldState();
  }
}

class _TextFieldState extends State<TextField> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext) {
    return Column(
      children: [
        this.widget.labelText != null ?
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            this.widget.labelText,
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: GatewayColor.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ) : SizedBox(),
        Material.TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIconConstraints: BoxConstraints(
              maxHeight: 8,
              minWidth: 12,
            ),
            hintStyle: TextStyle(
              color: GatewayColor.hintText,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
            contentPadding: EdgeInsets.only(top: 10),
          ),
          obscureText: widget.activation,
        ),
      ],
    );
  }
}
