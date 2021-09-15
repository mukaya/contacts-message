import 'package:flutter_application_1/bloc/contacts/contacts.actions.dart';
import 'package:flutter_application_1/bloc/enums/enums.dart';
import 'package:flutter_application_1/model/contact.model.dart';

class ContactsState {
  List<Contact> contacts;
  RequestState requestState;
  String errorMessage;
  ContactsEvent currentEvent;
  Contact? currentContact;

  ContactsState({
    required this.contacts,
    required this.requestState,
    required this.errorMessage,
    required this.currentEvent,
    this.currentContact,
  });

  ContactsState.initialState()
      : contacts = [],
        requestState = RequestState.NONE,
        errorMessage = '',
        currentContact = null,
        currentEvent = NonContactEvent();
}
