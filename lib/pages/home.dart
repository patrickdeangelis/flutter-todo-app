import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/domain.dart';
import 'package:todo/widgets/todo_input.dart';
import 'package:todo/widgets/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final defaultMargin = const EdgeInsets.symmetric(horizontal: 10.0);
  final defaultPadding = const EdgeInsets.all(10.0);
  final defaultRadius = const BorderRadius.all(Radius.circular(5.0));
  var listItems = [
    TodoItem(description: "Milk", isChecked: true),
    TodoItem(description: "Apples"),
    TodoItem(description: "Subway"),
  ];

  Widget getTitle(String title) {
    return Container(
      decoration:
          BoxDecoration(color: Colors.black26, borderRadius: defaultRadius),
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
      width: MediaQuery.of(context).size.width,
      padding: defaultPadding,
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget getItemsList() {
    return Column(
      children: [
        getTitle("📌 TODOs"),
        Expanded(
          child: ListView.builder(
              itemCount: listItems.length,
              itemBuilder: ((context, index) {
                var listItem = listItems[index];
                return TodoItemWidget(
                  itemText: listItem.description,
                  defaultIsChecked: listItem.isChecked,
                );
              })),
        ),
        TodoInputWidget(
          onCreateCallback: (description) {
            setState(() {
              listItems = [...listItems, TodoItem(description: description)];
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      statusBarColor: Colors.blue,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(color: Colors.blue),
            child: SafeArea(
              bottom: false,
              child: Center(child: getItemsList()),
            )));
  }
}
