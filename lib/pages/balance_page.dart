import 'package:delivery/views/map_status_view.dart';
import 'package:delivery/views/order_details_item_view.dart';
import 'package:delivery/views/visible_order_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_badged/flutter_badge.dart';

class BalancePage extends StatefulWidget {
  @override
  _BalancePageState createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  int visibledIndex = 0;

  void visibelsController(bool isVisible, int index) {
    setState(() {
      visibledIndex = isVisible ? index : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 250),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: const Color(0XFFF5A832),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0XFFF5A832),
                  ),
                ),
                const Spacer(),
                SizedBox(width: 100, child: MapStatusView(isOnline: true)),
                const Spacer(),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: FlutterBadge(
                      icon: const Icon(
                        Icons.notifications,
                        color: Color(0XFFF5A832),
                        size: 25,
                      ),
                      itemCount: 2,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(5),
                      primary: const Color(0XFF115056),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 15, bottom: 25),
                decoration: const BoxDecoration(
                  color: Color(0XFFF5A832),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    const Text(
                      "Your Balance Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 35,
                        bottom: 20,
                        left: 40,
                        right: 40,
                      ),
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 45),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0XFF115056),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SizedBox(
                        height: 50,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          maxLength: 4,
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
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: ListView(
                  children: <Widget>[
                    VisibleOrderDetailsView(
                      isVisible: visibledIndex == 0,
                      onChange: (isVisible) => visibelsController(isVisible, 0),
                    ),
                    VisibleOrderDetailsView(
                      isVisible: visibledIndex == 1,
                      onChange: (isVisible) => visibelsController(isVisible, 1),
                    ),
                    VisibleOrderDetailsView(
                      isVisible: visibledIndex == 2,
                      onChange: (isVisible) => visibelsController(isVisible, 2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
