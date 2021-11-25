import 'package:delivery/views/custom_button_view.dart';
import 'package:delivery/views/custom_edit_text_view.dart';
import 'package:flutter/material.dart';

class ForgetPasswordRestPage extends StatefulWidget {
  @override
  _ForgetPasswordRestPageState createState() => _ForgetPasswordRestPageState();
}

class _ForgetPasswordRestPageState extends State<ForgetPasswordRestPage> {
  bool isDone = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0XFFB57F2C),
              Color(0XFF145155),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Forget password !",
              style: TextStyle(
                  color: Color(0XFFD9D8D8),
                  fontSize: 20,
                  fontFamily: "roboto",
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            const FractionallySizedBox(
              widthFactor: 0.7,
              child: Text(
                "Please fill in the following",
                style:
                    TextStyle(color: Color(0XFFD9D8D8), fontFamily: "roboto"),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 50)),
            CustomEditTextView(
              hintText: "New Password",
              icon: Icons.lock,
              isPassword: true,
            ),
            CustomEditTextView(
              hintText: "Repeat New Password",
              icon: Icons.lock,
              isPassword: true,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 50)),
            FractionallySizedBox(
              widthFactor: 0.75,
              child: CustomButton(
                isEnabled: isDone,
                onPressed: () {},
                child: Text(
                  "Confirm",
                  style: TextStyle(
                    color: Color(isDone ? 0XFFFFFFFF : 0XFF115056),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
