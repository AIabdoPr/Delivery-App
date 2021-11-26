import 'package:delivery/pages/question_page.dart';
import 'package:flutter/material.dart';

class QuestionItemView extends StatefulWidget {
  final String question, answer;
  QuestionItemView({required this.question, required this.answer});
  @override
  _QuestionItemViewState createState() => _QuestionItemViewState();
}

class _QuestionItemViewState extends State<QuestionItemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(1, 1),
            color: Color(0XAA444444),
          )
        ],
      ),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionPage(
              question: widget.question,
              answer: widget.answer,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.question,
              style: const TextStyle(
                color: Color(0XFF115056),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.answer,
              style: const TextStyle(
                color: Color(0XFF115056),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
