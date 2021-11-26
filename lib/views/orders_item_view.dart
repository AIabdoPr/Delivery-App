import 'package:delivery/models/order_model.dart';
import 'package:delivery/pages/order_send_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class OrdersItemView extends StatefulWidget {
  OrderModel orderModel;
  bool isActive;

  OrdersItemView({required this.orderModel, this.isActive = false});

  @override
  _OrdersItemViewState createState() => _OrdersItemViewState();
}

class _OrdersItemViewState extends State<OrdersItemView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderSendPage(orderModel: widget.orderModel),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.only(top: 5, bottom: 10, left: 5, right: 5),
        decoration: BoxDecoration(
          color: widget.isActive ? const Color(0XFFF5A832) : Colors.white,
          border: Border.all(color: const Color(0XFF115056)),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                widget.orderModel.imagePath,
                fit: BoxFit.cover,
                height: 65,
                width: 65,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.orderModel.userName,
                  style: const TextStyle(
                    color: Color(0XFF115056),
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
                Row(
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
                Row(
                  children: [
                    const Text(
                      "From: ",
                      style: TextStyle(
                        color: Color(0XFF115056),
                        fontWeight: FontWeight.bold,
                        fontSize: 9,
                      ),
                    ),
                    Text(
                      widget.orderModel.from,
                      style: const TextStyle(
                        color: Color(0XFF545454),
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "To: ",
                      style: TextStyle(
                        color: Color(0XFF115056),
                        fontWeight: FontWeight.bold,
                        fontSize: 9,
                      ),
                    ),
                    Text(
                      widget.orderModel.to,
                      style: const TextStyle(
                        color: Color(0XFF545454),
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            const CircleAvatar(
              radius: 30,
              backgroundColor: Color(0XFF115056),
              child: Icon(
                Icons.shopping_cart_outlined,
                color: Color(0XFFF5A832),
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
