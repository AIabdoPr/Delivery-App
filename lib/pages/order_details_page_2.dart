import 'package:delivery/views/bill_photo_view.dart';
import 'package:delivery/views/client_details_item_view.dart';
import 'package:delivery/views/custom_button_view.dart';
import 'package:delivery/views/custom_drawer_view.dart';
import 'package:delivery/views/map_status_view.dart';
import 'package:delivery/views/order_details_item_view.dart';
import 'package:delivery/views/rate_dialog_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrderDetailsPage2 extends StatefulWidget {
  @override
  _OrderDetailsPage2State createState() => _OrderDetailsPage2State();
}

class _OrderDetailsPage2State extends State<OrderDetailsPage2> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawerView(),
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 150),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 40,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                    child: const Icon(
                      Icons.menu,
                      color: Color(0XFF115056),
                      size: 20,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(
                        side: BorderSide(color: Color(0XFF115056)),
                      ),
                      padding: const EdgeInsets.all(10),
                      primary: const Color(0XFFFFFFFF),
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(width: 100, child: MapStatusView(isOnline: true)),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
          ),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "Order Details",
                      style: TextStyle(
                        color: Color(0XFF115056),
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: Offset(0.5, 0.5),
                          color: Color(0XAA838383),
                        )
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0XFFF5F5F5),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Order ID",
                              style: TextStyle(
                                color: Color(0XFF115056),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "143",
                              style: TextStyle(
                                color: Color(0XFF545454),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Container(
                              color: const Color(0XFF115056), height: 0.3),
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Client Details",
                            style: TextStyle(
                              color: Color(0XFF115056),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        ClientDetailsItemView(),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8)),
                        Row(
                          children: <Widget>[
                            const Text(
                              "Bill Photos:",
                              style: TextStyle(
                                color: Color(0XFF115056),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Spacer(),
                            BillPhotoImageView(
                              parentContext: context,
                              imagePath: "assets/images/start_bg.png",
                            ),
                            BillPhotoImageView(
                              parentContext: context,
                              imagePath: "assets/images/start_bg.png",
                            ),
                            BillPhotoImageView(
                              parentContext: context,
                              imagePath: "assets/images/start_bg.png",
                            ),
                          ],
                        ),
                        OrderDetialsItemView(label: "You Earned", value: 10),
                        OrderDetialsItemView(
                            label: "Total order cost", value: 816),
                        OrderDetialsItemView(
                            label: "Total money required", value: 826),
                        OrderDetialsItemView(
                            label: "Client paid", value: 0, isInput: true),
                        OrderDetialsItemView(label: "Client wallet", value: 0),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  FractionallySizedBox(
                    widthFactor: 0.6,
                    child: CustomButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return RateDialogView(onClick: (String value) {});
                          },
                        );
                      },
                      color: const Color(0XFF115056),
                      borderColor: const Color(0XFF115056),
                      isElevated: true,
                      child: const Text(
                        "Done",
                        style:
                            TextStyle(color: Color(0XFFF5A832), fontSize: 14),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 15))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
