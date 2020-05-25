import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';

class Service extends StatefulWidget {
  String icon, text;
  bool row;
  Function callback;

  Service({this.icon, this.text, this.callback, this.row = false}) {}

  @override
  _ServiceState createState() => _ServiceState(
      icon: this.icon, text: this.text, callback: this.callback, row: this.row);
}

class _ServiceState extends State<Service> {
  String icon, text;
  bool row;
  Function callback;

  _ServiceState({this.icon, this.text, this.callback, this.row = false}) {}
  @override
  Widget build(BuildContext context) {
    List<Widget> tumbs = [
      SvgPicture.asset(
        this.icon,
        semanticsLabel: this.text,
        width: 74,
      ),
      SizedBox(
        height: 8,
        width: 24,
      ),
      Text(this.text)
    ];
    return Expanded(
      child: Container(
        padding: EdgeInsets.all((row)?0:12),
        height: (row)?90:190,
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: FlatButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: EdgeInsets.all(24),
            child: (!row)
                ? Column(children: tumbs)
                : Row(
                    children: tumbs,
                  ),
            onPressed: () {
              this.callback();
            },
          ),
        ),
      ),
    );
  }
}
