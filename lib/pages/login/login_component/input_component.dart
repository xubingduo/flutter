import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputComponent extends StatefulWidget {
  String title;
  String hintText;
  TextEditingController controller;
  TextInputType keyboardType = TextInputType.phone;
  InputComponent({
    Key key, 
    this.title, 
    this.controller, 
    this.hintText,
    this.keyboardType
    } ) : super(key: key);

  @override
  _InputComponentState createState() => _InputComponentState();
}

class _InputComponentState extends State<InputComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Container(
      width: ScreenUtil().setWidth(600),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey)
        )
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(120),
            child: Text(
              this.widget.title
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(480),
            child: TextField(
              controller: this.widget.controller,
              keyboardType: this.widget.keyboardType,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
                border: InputBorder.none,
                hintText: '${this.widget.hintText}',
                hintStyle: TextStyle(
                  color: Color.fromRGBO(204, 204, 204, 1),
                  fontSize: ScreenUtil().setSp(28)
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}