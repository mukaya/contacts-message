import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  var contact;

  @override
  Widget build(BuildContext context) {
    this.contact = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(contact.name),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(6),
            child: Row(
              children: [
                CircleAvatar(
                  child: Text(contact.profile),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(contact.name),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
