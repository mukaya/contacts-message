import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/message.model.dart';
import 'package:flutter_application_1/ui.pages/messages/widgets/messages.item.widget.dart';

class MessagesListWidget extends StatelessWidget {
  List<Message> messages;
  MessagesListWidget({Key? key, required this.messages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => MessagesItemWidget(
        message: messages[index],
      ),
      itemCount: messages.length,
    );
  }
}
