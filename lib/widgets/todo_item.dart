import 'package:flutter/material.dart';

class _TodoItemWidgetState extends State<TodoItemWidget> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    setState(() {
      isChecked = widget.defaultIsChecked;
    });
  }

  void onClick(value) {
    setState(() {
      isChecked = !isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 1.5),
      decoration: const BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Checkbox(value: isChecked, onChanged: onClick),
          Text(
            widget.itemText,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}

class TodoItemWidget extends StatefulWidget {
  TodoItemWidget({
    super.key,
    required this.itemText,
    this.defaultIsChecked = false,
  });

  String itemText;
  bool defaultIsChecked;

  @override
  _TodoItemWidgetState createState() => _TodoItemWidgetState();
}
