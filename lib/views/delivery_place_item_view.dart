import 'package:delivery/views/custom_button_view.dart';
import 'package:flutter/material.dart';

class DeliveryPlaceItemView extends StatefulWidget {
  final bool isDone, isonGettingImage;
  DeliveryPlaceItemView({this.isDone = false, this.isonGettingImage = false});

  @override
  _DeliveryPlaceItemViewState createState() => _DeliveryPlaceItemViewState();
}

class _DeliveryPlaceItemViewState extends State<DeliveryPlaceItemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 7),
      child: Column(
        children: <Widget>[
          Container(
            height: 1,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            color: const Color(0XFF115056),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 3)),
          Row(
            children: const <Widget>[
              Text(
                "From:",
                style: TextStyle(
                  color: Color(0XFF115056),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
              Text(
                "شارع 5, الزراعة, الزقازيق",
                style: TextStyle(
                  color: Color(0XFF545454),
                  fontSize: 14,
                ),
              ),
              Spacer(),
              Text(
                "15 min",
                style: TextStyle(
                  color: Color(0XFF545454),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 3)),
          Row(
            children: <Widget>[
                  CustomButton(
                    onPressed: () {},
                    isEnabled: !widget.isDone,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: const Icon(
                      Icons.phone,
                      color: Color(0XFF115056),
                      size: 20,
                    ),
                    isElevated: true,
                  ),
                  const Spacer(),
                  CustomButton(
                    onPressed: () {},
                    isEnabled: !widget.isDone,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: widget.isDone
                        ? const Icon(Icons.done,
                            size: 20, color: Color(0XFF115056))
                        : const Text(
                            "Received order",
                            style: TextStyle(
                                color: Color(0XFF115056), fontSize: 10),
                          ),
                    isElevated: true,
                  ),
                ] +
                (widget.isonGettingImage
                    ? [
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5)),
                        CustomButton(
                          onPressed: () {},
                          color: const Color(0XFF115056),
                          borderColor: const Color(0XFFF5A831),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            size: 20,
                            color: Color(0XFFF5A831),
                          ),
                          isElevated: true,
                        ),
                      ]
                    : []),
          )
        ],
      ),
    );
  }
}
