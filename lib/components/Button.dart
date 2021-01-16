import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as Material;

// disabled, default

class ButtonColors {
  ButtonColors({
    this.backgroundColor,
    this.textColor,
    this.borderColor
  });
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  ButtonColors copyWith({
    Color backgroundColor,
    Color textColor,
    Color borderColor,
  }) {
    return ButtonColors(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      borderColor: borderColor ?? this.borderColor,
    );
  }

  ButtonColors merge(ButtonColors other) {
    if (other == null) return this;
    return copyWith(
      backgroundColor: other.backgroundColor,
      textColor: other.textColor,
      borderColor: other.borderColor,
    );
  }
}

class _ButtonDefaultColors {
  const _ButtonDefaultColors(this._theme);
  _ButtonDefaultColors.of(BuildContext context) : this(Theme.of(context));

  final ThemeData _theme;

  ButtonColors get _positive => ButtonColors(
    textColor: _theme.buttonColor,
    backgroundColor: _theme.primaryColor,
    borderColor: Colors.transparent,
  );

  ButtonColors get _nagative => ButtonColors(
    // ! 정의된 컬러가 없슴니당...
    borderColor: Colors.transparent,
    textColor: Color(0xff888888),
    backgroundColor: Color(0xfff6f6f6),
  );

  ButtonColors get _disabled => ButtonColors(
    textColor: _theme.buttonColor,
    backgroundColor: _theme.disabledColor,
    borderColor: Colors.transparent,
  );
}

enum ButtonType {
  positive,
  negative,
}

class Button extends StatelessWidget {
  const Button({
    Key key,
    this.margin = EdgeInsets.zero,
    this.width = double.infinity,
    this.height = 37,
    this.onPressed,
    @required this.text,
    this.borderRadius = const BorderRadius.all(Radius.circular(28)),
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
    this.positiveColors,
    this.negativeColors,
    this.disabledColors,
    this.disabled = false,
    this.type = ButtonType.positive,
    this.splashColor = Colors.transparent,
    this.highlightColor = Colors.transparent,
    this.hoverColor = Colors.transparent,
  }) : super(key: key);

  final String text;
  final double width;
  final double height;
  final EdgeInsets margin;
  final bool disabled;
  final ButtonType type;
  final VoidCallback onPressed;

  final BorderRadiusGeometry borderRadius;
  final double fontSize;
  final FontWeight fontWeight;

  final ButtonColors positiveColors;
  final ButtonColors negativeColors;
  final ButtonColors disabledColors;

  final Color splashColor;
  final Color highlightColor;
  final Color hoverColor;

  bool get _disabled => this.disabled;

  @override
  Widget build(BuildContext context) {
    var defaultColors = _ButtonDefaultColors.of(context);
    ButtonColors Function() _color = () {
      if (_disabled) return defaultColors._disabled.merge(this.disabledColors);
      if (type == ButtonType.negative)
        return defaultColors._nagative.merge(this.negativeColors);
      return defaultColors._positive.merge(this.positiveColors);
    };

    return Container(
      margin: this.margin,
      decoration: BoxDecoration(
        border: Border.all(color: _color().borderColor, width: 1),
        borderRadius: this.borderRadius,
      ),
      child: GestureDetector(
        onTap: this.onPressed,
        child: Material.Material(
          color: _color().backgroundColor,
          borderRadius: this.borderRadius,
          child: SizedBox(
            width: this.width,
            height: this.height,
            child: Center(
              child: Text(
                this.text,
                style: TextStyle(
                  fontSize: this.fontSize,
                  fontWeight: this.fontWeight,
                  color: _color().textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}