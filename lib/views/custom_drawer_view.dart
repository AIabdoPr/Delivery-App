import 'package:delivery/views/custom_button_view.dart';
import 'package:flutter/material.dart';

class CustomDrawerView extends StatefulWidget {
  @override
  _CustomDrawerViewState createState() => _CustomDrawerViewState();
}

class _CustomDrawerViewState extends State<CustomDrawerView> {
  TextButton _buildButton(String lable) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        alignment: Alignment.centerLeft,
        padding: MaterialStateProperty.resolveWith(
          (states) => const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        ),
      ),
      child: Text(
        lable,
        style: const TextStyle(
          color: Color(0XFF115056),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Colors.transparent, shadowColor: Colors.transparent),
      child: Drawer(
        child: Container(
          width: 280,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.symmetric(vertical: 50),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(2, 1),
                color: Color(0X77333333),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 120,
                decoration: const BoxDecoration(
                  color: Color(0XFF115056),
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(20)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        border: Border.all(color: const Color(0XFFF5A832)),
                        image: const DecorationImage(
                          image: NetworkImage("assets/images/man.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                    const Text(
                      "Ahmed Mohamed",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
              _buildButton("Balance"),
              _buildButton("Your trips"),
              _buildButton("Contact us"),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomButton(
                    onPressed: () {},
                    isElevated: true,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    color: const Color(0XFF115056),
                    borderColor: const Color(0XFFF5A832),
                    child: const Text(
                      "English",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                  CustomButton(
                    onPressed: () {},
                    isElevated: true,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    color: Colors.white,
                    borderColor: const Color(0XFF115056),
                    child: const Text(
                      "عربي",
                      style: TextStyle(color: Color(0XFF707070), fontSize: 15),
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              Container(height: 3, color: const Color(0XFF115056)),
              _buildButton("Log out")
            ],
          ),
        ),
      ),
    );
  }
}
