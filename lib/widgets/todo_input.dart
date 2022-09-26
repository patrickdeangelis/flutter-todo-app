// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class _TodoInputWidgetState extends State<TodoInputWidget> {
  final _textController = TextEditingController();

  void onCreate() {
    widget.onCreateCallback(_textController.value.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 140,
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
            ),
          ),
          const SizedBox(width: 20),
          ElevatedButton(onPressed: onCreate, child: const Icon(Icons.send)),
        ],
      ),
    );
  }
}

typedef OnCreateInputCallback = void Function(String description);

class TodoInputWidget extends StatefulWidget {
  const TodoInputWidget({super.key, required this.onCreateCallback});

  final OnCreateInputCallback onCreateCallback;

  @override
  _TodoInputWidgetState createState() => _TodoInputWidgetState();
}
