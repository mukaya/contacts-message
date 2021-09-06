import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/contacts.actions.dart';
import 'package:flutter_application_1/ui.pages/contacts/widgets/contacts.button.item.dart';

class ContactsBarButtons extends StatelessWidget {
  const ContactsBarButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ContactsButtonItem(
            buttonLabel: "All Contacts",
            contactsEvent: LoadAllContactsEvent(),
          ),
          ContactsButtonItem(
            buttonLabel: "Students",
            contactsEvent: LoadStudentsEvent(),
          ),
          ContactsButtonItem(
            buttonLabel: "Developers",
            contactsEvent: LoadDevelopersEvent(),
          ),
        ],
      ),
    );
  }
}
