import 'package:delivery/models/order_model.dart';
import 'package:delivery/views/custom_button_view.dart';
import 'package:delivery/views/custom_drawer_view.dart';
import 'package:delivery/views/map_status_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class OrderCallPage extends StatefulWidget {
  OrderModel orderModel;
  OrderCallPage({required this.orderModel});

  @override
  _OrderCallPageState createState() => _OrderCallPageState();
}

class _OrderCallPageState extends State<OrderCallPage> {
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
          child: Column(
            children: <Widget>[
              const Padding(padding: EdgeInsets.symmetric(vertical: 25)),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  widget.orderModel.imagePath,
                  fit: BoxFit.cover,
                  height: 95,
                  width: 95,
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              Text(
                widget.orderModel.userName,
                style: const TextStyle(
                  color: Color(0XFF115056),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBarIndicator(
                    rating: widget.orderModel.rate.toDouble(),
                    direction: Axis.horizontal,
                    itemSize: 12,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) =>
                        const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 3)),
                  Text(
                    widget.orderModel.rate.toString() + ".0",
                    style: const TextStyle(
                      color: Color(0XFF545454),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 12)),
              CustomButton(
                onPressed: () {},
                isElevated: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: const Icon(
                  Icons.phone,
                  color: Color(0XFF115056),
                  size: 35,
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 25)),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        const Text(
                          "Number of orders: ",
                          style: TextStyle(
                            color: Color(0XFF545454),
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          widget.orderModel.orders.length.toString(),
                          style: const TextStyle(
                            color: Color(0XFF115056),
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 6)),
                    Row(
                      children: <Widget>[
                        const Text(
                          "Number of rates: ",
                          style: TextStyle(
                            color: Color(0XFF545454),
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          widget.orderModel.rate.toString(),
                          style: const TextStyle(
                            color: Color(0XFF115056),
                            fontSize: 20,
                          ),
                        )
                      ],
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
