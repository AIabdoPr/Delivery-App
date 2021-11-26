import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ClientDetailsItemView extends StatefulWidget {
  @override
  _ClientDetailsItemViewState createState() => _ClientDetailsItemViewState();
}

class _ClientDetailsItemViewState extends State<ClientDetailsItemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 1,
            spreadRadius: 1,
            color: Colors.grey,
            offset: Offset(0.5, 0.5),
          )
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              "assets/images/man.png",
              fit: BoxFit.cover,
              height: 65,
              width: 65,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Asmaa Ahmed",
                style: TextStyle(
                  color: Color(0XFF115056),
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
              Row(
                children: [
                  RatingBarIndicator(
                    rating: 4,
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
                  const Text(
                    "4.0",
                    style: TextStyle(
                      color: Color(0XFF545454),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Text(
                    "From: ",
                    style: TextStyle(
                      color: Color(0XFF115056),
                      fontWeight: FontWeight.bold,
                      fontSize: 9,
                    ),
                  ),
                  Text(
                    "بيتزا أسكندرية, القومية, الزقازيق",
                    style: TextStyle(
                      color: Color(0XFF545454),
                      fontSize: 9,
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Text(
                    "To: ",
                    style: TextStyle(
                      color: Color(0XFF115056),
                      fontWeight: FontWeight.bold,
                      fontSize: 9,
                    ),
                  ),
                  Text(
                    "فيلا 5, فلل الجامعة, الزقازيق",
                    style: TextStyle(
                      color: Color(0XFF545454),
                      fontSize: 9,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
