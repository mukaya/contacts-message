import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/contacts/contacts.bloc.dart';
import 'package:flutter_application_1/bloc/contacts/contacts.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsButtonItem extends StatelessWidget {
  String buttonLabel;
  var contactsEvent;

  ContactsButtonItem({
    Key? key,
    required this.buttonLabel,
    required this.contactsEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsBloc, ContactsState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
          decoration: BoxDecoration(
            border: Border.all(
              width: state.currentEvent.runtimeType == contactsEvent.runtimeType
                  ? 2
                  : 0,
              color: Colors.deepOrange,
            ),
          ),
          child: ElevatedButton(
            onPressed: () {
              context.read<ContactsBloc>().add(contactsEvent);
            },
            child: Text(
              buttonLabel,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
