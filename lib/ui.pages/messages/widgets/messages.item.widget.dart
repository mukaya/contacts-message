import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/message.model.dart';

class MessagesItemWidget extends StatelessWidget {
  Message message;
  MessagesItemWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: message.type == 'sent'
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          message.type == 'sent'
              ? SizedBox(
                  width: 0,
                )
              : SizedBox(
                  width: 20,
                ),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(20),
              color: message.type == 'sent'
                  ? Color.fromARGB(20, 0, 255, 0)
                  : Color.fromARGB(20, 255, 255, 0),
              foregroundDecoration: BoxDecoration(
                border: Border.all(color: Colors.deepOrange),
              ),
              child: Text(
                  '${message.content} (${message.date.day}-${message.date.month}-${message.date.year})'),
            ),
          ),
          message.type == 'sent'
              ? SizedBox(
                  width: 20,
                )
              : SizedBox(
                  width: 0,
                ),
          message.type == 'sent'
              ? SizedBox(
                  width: 20,
                )
              : SizedBox(
                  width: 0,
                ),
        ],
      ),
    );
  }
}
