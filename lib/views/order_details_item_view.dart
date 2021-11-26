import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrderDetialsItemView extends StatefulWidget {
  final String label;
  final int value;
  final bool isInput, isBalace;
  OrderDetialsItemView({
    required this.label,
    required this.value,
    this.isInput = false,
    this.isBalace = true,
  });

  @override
  _OrderDetialsItemViewState createState() => _OrderDetialsItemViewState();
}

class _OrderDetialsItemViewState extends State<OrderDetialsItemView> {
  late TextEditingController valueController;

  @override
  void initState() {
    super.initState();
    if (widget.isInput) {
      valueController = TextEditingController();
      valueController.text = widget.value.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 15),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
                  Text(
                    widget.label,
                    style: const TextStyle(
                      color: Color(0XFF115056),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                ] +
                (widget.isInput
                    ? [
                        Container(
                          width: 90,
                          height: 35,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: const Color(0XFF545454),
                            ),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Flexible(
                                child: SizedBox(
                                  height: 20,
                                  child: TextField(
                                    controller: valueController,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    maxLength: 4,
                                    cursorHeight: 20,
                                    cursorColor: const Color(0XFF115056),
                                    decoration: const InputDecoration(
                                      counterStyle: TextStyle(
                                        height: double.minPositive,
                                      ),
                                      counterText: "",
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0XFF888888),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0XFF115056),
                                        ),
                                      ),
                                    ),
                                    style: const TextStyle(
                                      color: Color(0XFF115056),
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 1.5)),
                              const Text(
                                "L.E",
                                style: TextStyle(
                                  color: Color(0XFF545454),
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]
                    : widget.isBalace
                        ? [
                            Text(
                              widget.value.toString(),
                              style: const TextStyle(
                                color: Color(0XFF545454),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const Text(
                              "L.E",
                              style: TextStyle(
                                color: Color(0XFF545454),
                                fontSize: 10,
                              ),
                            ),
                          ]
                        : [
                            Text(
                              widget.value.toString(),
                              style: const TextStyle(
                                color: Color(0XFF545454),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 5, right: 5),
            child: Container(color: const Color(0XFF115056), height: 0.3),
          ),
        ],
      ),
    );
  }
}
