import 'package:delivery/views/custom_button_view.dart';
import 'package:flutter/material.dart';

class ImagePreviewDialogView extends StatefulWidget {
  @override
  _ImagePreviewDialogViewState createState() => _ImagePreviewDialogViewState();
}

class _ImagePreviewDialogViewState extends State<ImagePreviewDialogView> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              color: const Color(0X44115056),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Positioned(
            top: 60,
            left: 50,
            width: MediaQuery.of(context).size.width - 100,
            height: MediaQuery.of(context).size.height - 120,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Image.network(
                      "assets/images/pizza.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  CustomButton(
                    onPressed: () => Navigator.pop(context),
                    isElevated: true,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: const Text(
                      "Done",
                      style: TextStyle(color: Color(0XFF115056), fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
