import 'package:flutter/material.dart';

class SelectionListView extends StatefulWidget {
  final List<String> items;
  int sleectedIndex;
  Function(int index) onSelect;

  SelectionListView({
    required this.items,
    required this.onSelect,
    this.sleectedIndex = 0,
  });

  @override
  _SelectionListViewState createState() => _SelectionListViewState();
}

class _SelectionListViewState extends State<SelectionListView> {
  late int selectedItemIndex;
  @override
  void initState() {
    super.initState();
    selectedItemIndex = widget.sleectedIndex;
  }

  void onItemSelected(int index) {
    setState(() {
      selectedItemIndex = index;
    });
    widget.onSelect(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              blurRadius: 1,
              spreadRadius: 0.5,
              offset: Offset(1, 1),
              color: Colors.black45)
        ],
      ),
      child: Row(
        children: List.generate(
          widget.items.length,
          (index) => TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: () => onItemSelected(index),
            child: Container(
              alignment: Alignment.center,
              width:
                  MediaQuery.of(context).size.width * 0.8 / widget.items.length,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: selectedItemIndex == index
                    ? const Color(0XFFF5A832)
                    : Colors.white,
                border: Border.all(color: const Color(0XFF115056)),
                borderRadius: BorderRadius.only(
                  topLeft: index == 0 ? const Radius.circular(20) : Radius.zero,
                  bottomLeft:
                      index == 0 ? const Radius.circular(20) : Radius.zero,
                  topRight: index == widget.items.length - 1
                      ? const Radius.circular(20)
                      : Radius.zero,
                  bottomRight: index == widget.items.length - 1
                      ? const Radius.circular(20)
                      : Radius.zero,
                ),
              ),
              child: Text(
                widget.items[index],
                style: TextStyle(
                  color: selectedItemIndex == index
                      ? Colors.white
                      : const Color(0XFF115056),
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
