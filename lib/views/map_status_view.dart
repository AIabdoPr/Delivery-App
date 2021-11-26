import 'package:flutter/material.dart';

class MapStatusView extends StatefulWidget {
  final isOnline;

  MapStatusView({this.isOnline = false});

  @override
  _MapStatusViewState createState() => _MapStatusViewState();
}

class _MapStatusViewState extends State<MapStatusView> {
  late List<Widget> content;

  @override
  Widget build(BuildContext context) {
    content = <Widget>[
      Text(
        widget.isOnline ? "Online" : "Offline",
        style: TextStyle(
          color: Color(widget.isOnline ? 0XFFF5A832 : 0XFFFFFFFF),
          fontSize: 15,
        ),
      ),
      const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
      CircleAvatar(
        radius: 15,
        backgroundColor: Color(widget.isOnline ? 0XFFF5A832 : 0XFF6B6B6B),
        child: Icon(
          Icons.power_settings_new,
          color: Color(widget.isOnline ? 0XFF115056 : 0XFFFFFFFF),
        ),
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(widget.isOnline ? 0XFF115056 : 0XFF979797),
      ),
      child: Row(
        mainAxisAlignment:
            widget.isOnline ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: widget.isOnline ? content : List.from(content.reversed),
      ),
    );
  }
}
