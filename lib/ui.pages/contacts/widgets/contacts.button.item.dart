import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/contacts.bloc.dart';
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
    return ElevatedButton(
      onPressed: () {
        context.read<ContactsBloc>().add(contactsEvent);
      },
      child: Text(
        buttonLabel,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
