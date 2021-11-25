import 'package:delivery/models/order_model.dart';
import 'package:delivery/pages/balance_page.dart';
import 'package:delivery/pages/contact_us_page.dart';
import 'package:delivery/pages/delivery_details_page.dart';
import 'package:delivery/pages/deliveryer_page.dart';
import 'package:delivery/pages/forget_password_enter_key_page.dart';
import 'package:delivery/pages/forget_password_login_page.dart';
import 'package:delivery/pages/forget_password_reset_page.dart';
import 'package:delivery/pages/login_page.dart';
import 'package:delivery/pages/map_view_page.dart';
import 'package:delivery/pages/order_call_page.dart';
import 'package:delivery/pages/order_details_page.dart';
import 'package:delivery/pages/order_details_page_2.dart';
import 'package:delivery/pages/order_send_page.dart';
import 'package:delivery/pages/orders_page.dart';
import 'package:delivery/pages/profile_page.dart';
import 'package:delivery/pages/question_page.dart';
import 'package:delivery/pages/signup_page.dart';
import 'package:delivery/pages/start_page.dart';
import 'package:delivery/views/custom_button_view.dart';
import 'package:flutter/material.dart';

class PreviewPagesPage extends StatefulWidget {
  @override
  _PreviewPagesPageState createState() => _PreviewPagesPageState();
}

class _PreviewPagesPageState extends State<PreviewPagesPage> {
  String currentPage = "Start";
  Map<String, Widget> pages = <String, Widget>{
    "Start": StartPage(),
    "Login": LoginPage(),
    "Signup": SignupPage(),
    "Password Forget Login": ForgetPasswordLoginPage(),
    "Password Forget Enter Key": ForgetPasswordEnterKeyPage(),
    "Password Forget Reset": ForgetPasswordRestPage(),
    "Map View": MapViewPage(),
    "Orders": OrdersPage(),
    "Order Details": OrderDetailsPage(),
    "Order Call": OrderCallPage(
      orderModel: OrderModel(
          userName: "userName",
          imagePath: "imagePath",
          from: "from",
          to: "to",
          type: "type",
          rate: 4,
          orders: []),
    ),
    "Order Send": OrderSendPage(
      orderModel: OrderModel(
          userName: "userName",
          imagePath: "imagePath",
          from: "from",
          to: "to",
          type: "type",
          rate: 4,
          orders: []),
    ),
    "Order Details 2": OrderDetailsPage2(),
    "Delivery Details": DeliveryDetailsPage(),
    "Deliveryer": DeliveryerPage(),
    "Balance": BalancePage(),
    "Profile": ProfilePage(),
    "Contact Us": ContactUsPage(),
    "Questions": QuestionPage(question: "question", answer: "answer"),
  };

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton(
                value: pages.keys.toList()[0],
                onChanged: (value) => setState(() {
                  currentPage = value.toString();
                }),
                items: List.generate(
                  pages.length,
                  (index) {
                    return DropdownMenuItem<String>(
                      value: pages.keys.toList()[index],
                      child: Text(pages.keys.toList()[index]),
                    );
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Text(
                currentPage,
                style: const TextStyle(
                  color: Color(0XFF115056),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              CustomButton(
                isElevated: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => pages[currentPage]!,
                  ),
                ),
                child: const Text(
                  "Go",
                  style: TextStyle(
                    color: Color(0XFF115056),
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
