import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/messages/messages.actions.dart';
import 'package:flutter_application_1/bloc/messages/messages.bloc.dart';
import 'package:flutter_application_1/model/contact.model.dart';
import 'package:flutter_application_1/model/message.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesFormWidget extends StatelessWidget {
  Contact contact;
  MessagesFormWidget({Key? key, required this.contact}) : super(key: key);

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      alignment: Alignment.bottomLeft,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: textEditingController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Message message = Message(
                contactId: contact.id,
                content: textEditingController.text,
                type: 'sent',
              );
              context.read<MessagesBloc>().add(AddNewMessagesEvent(message));

              Message replay = Message(
                contactId: contact.id,
                content: 'replay to message',
                type: 'received',
              );
              context.read<MessagesBloc>().add(AddNewMessagesEvent(replay));
            },
            icon: Icon(Icons.send),
          )
        ],
      ),
    );
  }
}
