import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/messages/messages.actions.dart';
import 'package:flutter_application_1/bloc/messages/messages.bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesPage extends StatelessWidget {
  var contact;

  @override
  Widget build(BuildContext context) {
    this.contact = ModalRoute.of(context)!.settings.arguments;
    context.read<MessagesBloc>().add(MessagesByContactEvent(this.contact));
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
          Expanded(
            child: Container(
              child: Text("Messages List"),
            ),
          ),
          Container(
            padding: EdgeInsets.all(6),
            alignment: Alignment.bottomLeft,
            child: Text("Messages Form"),
          ),
        ],
      ),
    );
  }
}
