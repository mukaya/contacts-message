import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/enums/enums.dart';
import 'package:flutter_application_1/bloc/messages/messages.actions.dart';
import 'package:flutter_application_1/bloc/messages/messages.bloc.dart';
import 'package:flutter_application_1/bloc/messages/messages.state.dart';
import 'package:flutter_application_1/ui.pages/shared/error.retry.action.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesPage extends StatelessWidget {
  var contact;

  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context)!.settings.arguments);
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
            child: BlocBuilder<MessagesBloc, MessagesState>(
                builder: (context, state) {
              if (state.requestState == RequestState.LOADING) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.requestState == RequestState.ERROR) {
                return ErrorRetryMessage(
                    errorMessage: state.messageError.toString(),
                    onAction: () {
                      context
                          .read<MessagesBloc>()
                          .add(state.currentMessageEvent);
                    });
              } else if (state.requestState == RequestState.LOADED) {
                return ListView.separated(
                  itemBuilder: (context, index) => ListTile(
                    title: Row(
                      children: [
                        Text('${state.messages[index].content}'),
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.deepOrange,
                    height: 2,
                  ),
                  itemCount: state.messages.length,
                );
              } else {
                return Container();
              }
            }),
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
