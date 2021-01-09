import 'package:flutter/cupertino.dart';

class IndicatorView extends StatelessWidget {
  final double height;

  const IndicatorView({Key key, this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: this.height ?? MediaQuery.of(context).size.height,
        child: Center(
          child: CupertinoActivityIndicator(),
        )
    );
  }
}
