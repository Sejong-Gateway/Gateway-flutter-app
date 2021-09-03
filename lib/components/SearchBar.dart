import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as Material;
import 'package:gateway/utils/gateway_color.dart';

enum TextFieldType {
  text,
  password,
}

class SearchBar extends StatefulWidget {
  final String hintText;
  final double textSize;
  final TextFieldType type;
  final bool disabled;
  final TextInputType keyboardType;
  final Function(String value) onChange;

  final String labelText;
  final TextEditingController controller;

  SearchBar({
    Key key,
    this.hintText,
    this.controller,
    this.labelText,
    this.textSize,
    this.type,
    this.disabled,
    this.keyboardType,
    this.onChange,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SearchBarState();
  }
}

class _SearchBarState extends State<SearchBar> {
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
          height: 48.0,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: GatewayColor.inactive),
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              // BoxShadow(
              //   offset: Offset(2, 0),
              //   blurRadius: 6,
              //   color: Color.fromRGBO(0, 0, 0, 0.16),
              // )
            ],
            color: GatewayColor.white,
          ),
          child: Row(
            children: [
              Expanded(
                child: Material.TextField(
                  obscureText: widget.type == TextFieldType.password,
                  style: TextStyle(color: GatewayColor.primary, fontSize: 14, fontWeight: FontWeight.bold),
                  controller: _effectiveController,
                  decoration: InputDecoration(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    // focusedBorder: OutlineInputBorder(
                    //     borderSide:
                    //         BorderSide(width: 1, color: GatewayColor.primary)),
                    border: InputBorder.none,
                    hintText: widget.hintText,
                    suffixIconConstraints: BoxConstraints(
                      maxHeight: 8,
                      minWidth: 12,
                    ),
                    hintStyle: TextStyle(
                      color: GatewayColor.inactive,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    contentPadding: EdgeInsets.only(left: 16),
                  ),
                ),
              ),
              Icon(Icons.search, color: GatewayColor.inactive,),
              SizedBox(width: 12),
            ],
          ),
        )
      ],
    );
  }
}
