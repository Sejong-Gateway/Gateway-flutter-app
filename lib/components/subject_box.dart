import 'package:flutter/material.dart';
import '../utils/gateway_color.dart';

class SubjectBox extends StatelessWidget {
  final String name;
  final bool select;
  final bool disabled;
  final Function onClick;

  const SubjectBox({
    Key key,
    this.name,
    this.select,
    this.disabled = false,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if ( this.disabled != true ) {
          this.onClick();
        }
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: (MediaQuery.of(context).size.width - 83) / 2,
        height: 55,
        decoration: BoxDecoration(
          color: this.disabled == true ? Color(0xffdbdbdb) : this.select == true ? Color(0xff6c63ff) : Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            this.disabled == true ? BoxShadow():
            BoxShadow(
              color: Colors.black.withOpacity(0.16),
              blurRadius: 5,
              offset: Offset(0.2, 0.6), // changes position of shadow
            ),
          ],
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            name,
            style: TextStyle(
                fontSize: 13,
                color: this.disabled == true ? Color(0xff464646) : this.select == true ? Colors.white : GatewayColor.primary),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
