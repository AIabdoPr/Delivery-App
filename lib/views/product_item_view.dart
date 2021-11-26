import 'package:flutter/material.dart';

class ProductItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 50),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0XFFE2E2E2),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    "assets/images/pizza.png",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      "Cheese pizza",
                      style: TextStyle(color: Color(0XFF115056), fontSize: 12),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                    Text(
                      "55.00 L.E",
                      style: TextStyle(color: Color(0XFF115056), fontSize: 10),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const <Widget>[
                    Text(
                      "3",
                      style: TextStyle(
                        color: Color(0XFF115056),
                        fontSize: 23,
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                    Text(
                      "Pieces",
                      style: TextStyle(
                        color: Color(0XFF115056),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
