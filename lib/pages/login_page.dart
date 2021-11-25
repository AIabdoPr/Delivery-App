import 'package:delivery/pages/forget_password_login_page.dart';
import 'package:delivery/pages/map_view_page.dart';
import 'package:delivery/pages/signup_page.dart';
import 'package:delivery/views/custom_button_view.dart';
import 'package:delivery/views/custom_edit_text_view.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isDone = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/start_bg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0XBFB57F2C),
                Color(0XBF145155),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/logo.png"),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              const FractionallySizedBox(
                widthFactor: 0.7,
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style:
                      TextStyle(color: Color(0XFFD9D8D8), fontFamily: "roboto"),
                  textAlign: TextAlign.center,
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              FractionallySizedBox(
                widthFactor: 0.7,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      CustomEditTextView(
                          hintText: "User Name", icon: Icons.person),
                      CustomEditTextView(
                          hintText: "********", icon: Icons.lock),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 10))
                    ],
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              FractionallySizedBox(
                widthFactor: 0.65,
                child: CustomButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MapViewPage())),
                  isEnabled: isDone,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Color(isDone ? 0XFFFFFFFF : 0XFF115056),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
              FractionallySizedBox(
                widthFactor: 0.65,
                child: Row(
                  children: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupPage())),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPasswordLoginPage())),
                      child: const Text(
                        "Forget password !",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
