import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/enums/enums.dart';
import 'package:flutter_application_1/bloc/messages/messages.actions.dart';
import 'package:flutter_application_1/bloc/messages/messages.bloc.dart';
import 'package:flutter_application_1/bloc/messages/messages.state.dart';
import 'package:flutter_application_1/ui.pages/messages/widgets/contact.info.widget.dart';
import 'package:flutter_application_1/ui.pages/messages/widgets/messages.form.widget.dart';
import 'package:flutter_application_1/ui.pages/messages/widgets/messages.list.widget.dart';
import 'package:flutter_application_1/ui.pages/shared/circular.progress.ind.widget.dart';
import 'package:flutter_application_1/ui.pages/shared/error.retry.action.dart';
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
          ContactInfoWidget(
            contact: contact,
          ),
          Expanded(
            child: BlocBuilder<MessagesBloc, MessagesState>(
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
            }),
          ),
          MessagesFormWidget(),
        ],
      ),
    );
  }
}
