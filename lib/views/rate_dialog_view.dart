import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateDialogView extends StatefulWidget {
  final Function(String value) onClick;
  RateDialogView({required this.onClick});

  @override
  _RateDialogViewState createState() => _RateDialogViewState();
}

class _RateDialogViewState extends State<RateDialogView> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              color: const Color(0X44115056),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Positioned(
            top: 160,
            left: 70,
            width: MediaQuery.of(context).size.width - 140,
            height: MediaQuery.of(context).size.height - 320,
            child: Container(
              padding: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      border: Border.all(color: const Color(0XFF115056)),
                      image: const DecorationImage(
                        image: NetworkImage("assets/images/man.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  const Text(
                    "Ahmed mohamed",
                    style: TextStyle(
                      color: Color(0XFF115056),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3)),
                      const Text(
                        "4.0",
                        style: TextStyle(
                          color: Color(0XFF545454),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                  const Text(
                    "Please rate our client",
                    style: TextStyle(
                      color: Color(0XFF115056),
                      fontSize: 10,
                    ),
                  ),
                  RatingBar(
                    onRatingUpdate: (double value) {},
                    ratingWidget: RatingWidget(
                      full: const Icon(
                        Icons.star,
                        color: Color(0XFFF5A832),
                      ),
                      half: const Icon(
                        Icons.star,
                        color: Color(0XFF666666),
                      ),
                      empty: const Icon(
                        Icons.star_border_outlined,
                        color: Color(0XFFF5A832),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                  Container(height: 2, color: const Color(0XFF115056)),
                  Flexible(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              padding: MaterialStateProperty.resolveWith(
                                (states) => const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 20),
                              ),
                            ),
                            child: const Text(
                              "Done",
                              style: TextStyle(
                                color: Color(0XFF115056),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        Container(width: 2, color: const Color(0XFF115056)),
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              padding: MaterialStateProperty.resolveWith(
                                (states) => const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 20),
                              ),
                            ),
                            child: const Text(
                              "Skip",
                              style: TextStyle(
                                color: Color(0XFF115056),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
