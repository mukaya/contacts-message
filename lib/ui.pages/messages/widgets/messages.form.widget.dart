import 'package:flutter/material.dart';

class MessagesFormWidget extends StatelessWidget {
  const MessagesFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      alignment: Alignment.bottomLeft,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.send))
        ],
      ),
    );
  }
}
