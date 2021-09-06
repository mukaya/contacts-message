import 'package:flutter_application_1/bloc/enums/enums.dart';
import 'package:flutter_application_1/model/contact.model.dart';

class ContactsState {
  List<Contact> contacts;
  RequestState requestState;
  String? errorMessage;
  var currentEvent;

  ContactsState({
    required this.contacts,
    required this.requestState,
    this.errorMessage,
    required this.currentEvent,
  });
}
