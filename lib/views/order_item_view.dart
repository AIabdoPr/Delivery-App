import 'package:delivery/views/product_item_view.dart';
import 'package:flutter/material.dart';

class OrderItemView extends StatelessWidget {
  const OrderItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          const Divider(height: 5, color: Color(0XFF115056)),
          const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
          Row(
            children: const [
              Text(
                "From:",
                style: TextStyle(
                  color: Color(0XFF115056),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
              Text(
                "بيتزا أسكندرية, القومية, الزقازيق",
                style: TextStyle(
                  color: Color(0XFF545454),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          ProductItemView(),
          ProductItemView(),
        ],
      ),
    );
  }
}
