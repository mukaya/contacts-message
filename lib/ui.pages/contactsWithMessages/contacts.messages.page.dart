import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/contacts/contacts.actions.dart';
import 'package:flutter_application_1/bloc/contacts/contacts.bloc.dart';
import 'package:flutter_application_1/bloc/contacts/contacts.state.dart';
import 'package:flutter_application_1/bloc/enums/enums.dart';
import 'package:flutter_application_1/bloc/messages/messages.actions.dart';
import 'package:flutter_application_1/bloc/messages/messages.bloc.dart';
import 'package:flutter_application_1/bloc/messages/messages.state.dart';
import 'package:flutter_application_1/ui.pages/messages/widgets/messages.form.widget.dart';
import 'package:flutter_application_1/ui.pages/messages/widgets/messages.list.widget.dart';
import 'package:flutter_application_1/ui.pages/shared/circular.progress.ind.widget.dart';
import 'package:flutter_application_1/ui.pages/shared/error.retry.action.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConatctsWithMessages extends StatelessWidget {
  ConatctsWithMessages({Key? key}) : super(key: key);

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    context.read<ContactsBloc>().add(LoadAllContactsEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts with Messages"),
      ),
      body: Column(
        children: [
          BlocBuilder<ContactsBloc, ContactsState>(
            builder: (context, state) {
              if (state.requestState == RequestState.ERROR) {
                return ErrorRetryMessage(
                  errorMessage: state.errorMessage,
                  onAction: () {
                    context.read<ContactsBloc>().add(state.currentEvent);
                  },
                );
              } else if (state.requestState == RequestState.LOADING) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.requestState == RequestState.LOADED) {
                return SizedBox(
                  height: 130,
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: state.contacts.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            context.read<MessagesBloc>().add(
                                MessagesByContactEvent(state.contacts[index]));
                            scrollController.animateTo(
                                (index * 200 - 150).toDouble(),
                                duration: Duration(microseconds: 2000),
                                curve: Curves.ease);
                          },
                          child: BlocBuilder<MessagesBloc, MessagesState>(
                            builder: (context, messagesState) {
                              return Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: messagesState.currentContact ==
                                            state.contacts[index]
                                        ? 3
                                        : 1,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                                padding: EdgeInsets.all(8),
                                width: 150,
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      child: Text(
                                          "${state.contacts[index].profile}"),
                                    ),
                                    Text("${state.contacts[index].name}"),
                                    Text("${state.contacts[index].score}"),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
          BlocBuilder<MessagesBloc, MessagesState>(
            builder: (context, state) {
              if (state.requestState == RequestState.LOADING) {
                return MyCircularProgressIndWidget();
              } else if (state.requestState == RequestState.ERROR) {
                return ErrorRetryMessage(
                    errorMessage: state.messageError.toString(),
                    onAction: () {
                      context
                          .read<MessagesBloc>()
                          .add(state.currentMessageEvent);
                    });
              } else if (state.requestState == RequestState.LOADED) {
                return MessagesListWidget(
                  messages: state.messages,
                );
              } else {
                return Container();
              }
            },
          ),
          BlocBuilder<ContactsBloc, ContactsState>(
            builder: (context, state) {
              return MessagesFormWidget(contact: state.currentContact);
            },
          ),
        ],
      ),
    );
  }
}
