import 'package:delivery/views/custom_button_view.dart';
import 'package:delivery/views/question_item_view.dart';
import 'package:flutter/material.dart';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  List<List<String>> questions = <List<String>>[
    <String>[
      "How Can I deliver to another governorate ?",
      "Lorem Ipsum is simply dummy text of the printing and typesetting ...",
    ],
    <String>[
      "How Can I deliver to another governorate ?",
      "Lorem Ipsum is simply dummy text of the printing and typesetting ...",
    ],
    <String>[
      "How Can I deliver to another governorate ?",
      "Lorem Ipsum is simply dummy text of the printing and typesetting ...",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 250),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: Offset(0, 1),
                  color: Color(0XAA444444),
                )
              ],
            ),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0XFF115056),
                  ),
                ),
                const Spacer(),
                const Text(
                  "Contact Us",
                  style: TextStyle(
                    color: Color(0XFF115056),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 90,
              width: MediaQuery.of(context).size.width * 0.95,
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.025,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: TextField(
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  hintText: "Please write your problem ...",
                  contentPadding: const EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Color(0XFF3B90FF)),
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 2.5)),
            CustomButton(
              onPressed: () {},
              isElevated: true,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: const Text(
                "Send",
                style: TextStyle(
                  color: Color(0XFF115056),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              borderColor: const Color(0XFFF5A832),
              color: const Color(0XFFF5A832),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const Text(
              "previous contacts",
              style: TextStyle(
                color: Color(0XFF115056),
                fontSize: 12,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Flexible(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  String question = questions[index][0];
                  String answer = questions[index][1];
                  return QuestionItemView(question: question, answer: answer);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
