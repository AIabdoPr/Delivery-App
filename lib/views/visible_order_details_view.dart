import 'package:delivery/views/custom_button_view.dart';
import 'package:flutter/material.dart';

import 'order_details_item_view.dart';

class VisibleOrderDetailsView extends StatefulWidget {
  bool isVisible;
  final Function(bool isVisible) onChange;
  VisibleOrderDetailsView({this.isVisible = true, required this.onChange});

  @override
  _VisibleOrderDetailsViewState createState() =>
      _VisibleOrderDetailsViewState();
}

class _VisibleOrderDetailsViewState extends State<VisibleOrderDetailsView> {
  late bool mIsVisible;

  @override
  void initState() {
    super.initState();
    mIsVisible = widget.isVisible;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0XFF115056),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: <Widget>[
          OrderDetialsItemView(
            label: "Order ID",
            value: 143,
            isBalace: false,
          ),
          Visibility(
            visible: mIsVisible,
            child: Column(
              children: <Widget>[
                OrderDetialsItemView(label: "You Earned", value: 10),
                OrderDetialsItemView(label: "Paid for order", value: 50),
              ],
            ),
          ),
          CustomButton(
            onPressed: () {
              setState(() {
                mIsVisible = !mIsVisible;
                widget.onChange(mIsVisible);
              });
            },
            isElevated: true,
            borderColor: const Color(0XFFF5A832),
            color: Color(mIsVisible ? 0XFFFFFFFF : 0XFFF5A832),
            child: Text(
              mIsVisible ? "See less" : "See more",
              style: const TextStyle(color: Color(0XFF115056), fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
