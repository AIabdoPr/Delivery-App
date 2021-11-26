import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeyEditText extends StatefulWidget {
  final List<int> currectKey;
  final Function onDone, onError;

  KeyEditText(
      {required this.currectKey, required this.onDone, required this.onError});

  @override
  State<StatefulWidget> createState() => _KeyEditTextState();
}

class _KeyEditTextState extends State<KeyEditText> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(
        widget.currectKey.length, (index) => TextEditingController());
    focusNodes =
        List.generate(widget.currectKey.length, (index) => FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.75;
    double padding = width * 0.04;
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: padding),
      decoration: BoxDecoration(
          color: const Color(0XFFFFFFFF),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: List.generate(
          widget.currectKey.length,
          (index) => Container(
            padding: EdgeInsets.symmetric(horizontal: padding / 2),
            margin: EdgeInsets.only(bottom: padding),
            width: (width - (2 * padding)) / widget.currectKey.length,
            child: TextField(
              maxLength: 1,
              textAlign: TextAlign.center,
              focusNode: focusNodes[index],
              onChanged: (String value) {
                for (TextEditingController controller in controllers) {
                  if (controller.text.isEmpty) widget.onError();
                }
                if (int.tryParse(value) != null) {
                  if ((index + 1) < widget.currectKey.length) {
                    focusNodes[index + 1].requestFocus();
                  } else {
                    int index = 0;
                    bool hasError = false;
                    for (int key in widget.currectKey) {
                      if (controllers[index].text.isEmpty ||
                          key.toString() != controllers[index].text) {
                        hasError = true;
                        break;
                      }
                      ++index;
                    }
                    if (hasError) {
                      widget.onError();
                    } else {
                      focusNodes.last.unfocus();
                      widget.onDone();
                    }
                  }
                }
              },
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: controllers[index],
              style: const TextStyle(color: Color(0XFF555555), fontSize: 16),
              decoration: const InputDecoration(
                counterStyle: TextStyle(height: double.minPositive),
                counterText: "",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0XFF888888),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0XFF666666),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
