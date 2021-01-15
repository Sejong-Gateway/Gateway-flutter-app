import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Checkbox extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final bool checked;
  final String labelText;

  const Checkbox({
    Key key,
    this.onChanged,
    this.checked,
    this.labelText,
  }) : super(key: key);

  @override
  _CheckboxState createState() => _CheckboxState();
}

class _CheckboxState extends State<Checkbox> {
  bool _checked;

  Function get onTap => () => {
        if (widget.onChanged != null)
          {widget.onChanged(!_checked)}
        else
          {
            setState(() {
              _checked = !_checked;
            })
          }
      };

  @override
  void initState() {
    _checked = widget.checked ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: onTap,
            child: _checked
                ? SvgPicture.asset('asset/icons/check-on.svg')
                : SvgPicture.asset('asset/icons/check-off.svg'),
          ),
          this.widget.labelText != null
              ? Row(
                  children: [
                    SizedBox(width: 8),
                    Text(
                      this.widget.labelText,
                      style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
