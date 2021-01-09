import 'package:flutter/material.dart';

class ModalView extends StatelessWidget {
  const ModalView({
    Key key,
    @required this.child,
    this.title,
    this.actions,
    this.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(12),
      topRight: Radius.circular(12),
    ),
    this.padding = const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
    this.childMarginBottom = 30,
    this.childMarginTop = 37,
    this.backgroundColor = Colors.white,
    this.width,
    this.height,
  }) : super(key: key);

  final Widget child;
  final Widget title;
  final Widget actions;

  final BorderRadiusGeometry borderRadius;
  final EdgeInsets padding;

  final double childMarginBottom;
  final double childMarginTop;

  final double width;
  final double height;

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        children: [
          Container(
            width: this.width,
            height: this.height,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: this.borderRadius,
            ),
            child: Padding(
              padding: padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  title,
                  title != null ? SizedBox(height: this.childMarginTop) : null,
                  child,
                  actions != null
                      ? SizedBox(height: this.childMarginBottom)
                      : null,
                  actions,
                ].where((e) => e != null).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showModal({
  @required BuildContext context,
  @required WidgetBuilder builder,
  Color backgroundColor,
  Color barrierColor,
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: backgroundColor ?? Colors.transparent,
    builder: builder,
    barrierColor: barrierColor,
  );
}
