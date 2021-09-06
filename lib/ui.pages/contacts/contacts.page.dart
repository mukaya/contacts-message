import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/contacts.bloc.dart';
import 'package:flutter_application_1/bloc/contacts.state.dart';
import 'package:flutter_application_1/bloc/enums/enums.dart';
import 'package:flutter_application_1/ui.pages/contacts/widgets/contacts.bar.buttons.dart';
import 'package:flutter_application_1/ui.pages/contacts/widgets/contacts.list.dart';
import 'package:flutter_application_1/ui.pages/shared/error.retry.action.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Contactspage extends StatelessWidget {
  const Contactspage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: Column(
        children: [
          ContactsBarButtons(),
          BlocBuilder<ContactsBloc, ContactsState>(
            builder: (context, state) {
              if (state.requestState == RequestState.LOADING) {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state.requestState == RequestState.ERROR) {
                return ErrorRetryMessage(
                  errorMessage: state.errorMessage.toString(),
                  onAction: () {
                    context.read<ContactsBloc>().add(state.currentEvent);
                  },
                );
              } else if (state.requestState == RequestState.LOADED) {
                return ContactsList(
                  contacts: state.contacts,
                );
              } else {
                return Container();
              }
            },
          )
        ],
      ),
    );
  }
}
