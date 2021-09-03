import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as Material;
import 'package:flutter/services.dart';
import 'package:gateway/utils/gateway_color.dart';

enum TextFieldType {
  text,
  password,
}

class TextField extends StatefulWidget {
  final String hintText;
  final double textSize;
  final TextFieldType type;
  final bool disabled;
  final TextInputType keyboardType;
  final Function(String value) onChange;
  final double height;
  final double width;
  final TextStyle textStyle;
  final List<TextInputFormatter> inputFormatters;
  final String labelText;
  final TextEditingController controller;

  TextField({
    Key key,
    this.hintText,
    this.controller,
    this.labelText,
    this.textSize,
    this.type,
    this.disabled,
    this.keyboardType,
    this.onChange,
    this.height = 48.0,
    this.width = double.maxFinite,
    this.textStyle = const TextStyle(), this.inputFormatters = const [],
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TextFieldState();
  }
}

class _TextFieldState extends State<TextField> {
  TextEditingController _controller = new TextEditingController();

  TextEditingController get _effectiveController =>
      widget.controller ?? _controller;

  @override
  void initState() {
    if (widget.onChange != null) {
      _effectiveController.addListener(() {
        widget.onChange(_effectiveController.text);
      });
    }

    super.initState();
  }

  Widget build(BuildContext) {
    return Column(
      children: [
        this.widget.labelText != null
            ? Align(
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
              )
            : SizedBox(),
        Container(
          height: this.widget.height,
          width: this.widget.width,
          decoration: BoxDecoration(
            color: GatewayColor.white,
          ),
          child: Material.TextField(
            keyboardType: widget.keyboardType,
            obscureText: widget.type == TextFieldType.password,
            style: this.widget.textStyle,
            controller: _effectiveController,
            inputFormatters: this.widget.inputFormatters,
            decoration: InputDecoration(
              hintText: widget.hintText,
              suffixIconConstraints: BoxConstraints(
                maxHeight: 8,
                minWidth: 12,
              ),
              hintStyle: TextStyle(
                color: GatewayColor.hintText,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
              contentPadding: EdgeInsets.only(),
            ),
          ),
        ),

      ],
    );
  }
}
