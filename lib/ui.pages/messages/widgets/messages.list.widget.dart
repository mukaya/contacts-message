import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/message.model.dart';
import 'package:flutter_application_1/ui.pages/messages/widgets/messages.item.widget.dart';

class MessagesListWidget extends StatelessWidget {
  List<Message> messages;
  ScrollController scrollController = ScrollController();
  MessagesListWidget({Key? key, required this.messages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (scrollController.hasClients) {
        this.scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        itemBuilder: (context, index) => MessagesItemWidget(
          message: messages[index],
        ),
        itemCount: messages.length,
      ),
    );
  }
}
