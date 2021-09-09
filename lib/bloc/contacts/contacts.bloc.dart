import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/bloc/contacts/contacts.actions.dart';
import 'package:flutter_application_1/bloc/contacts/contacts.state.dart';
import 'package:flutter_application_1/bloc/enums/enums.dart';
import 'package:flutter_application_1/model/contact.model.dart';
import 'package:flutter_application_1/repositories/contacts.repo.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsRepository contactsRepository;
  ContactsBloc(
      {required ContactsState initialState, required this.contactsRepository})
      : super(initialState);

  @override
  Stream<ContactsState> mapEventToState(ContactsEvent event) async* {
    if (event is LoadAllContactsEvent) {
      yield ContactsState(
        contacts: state.contacts,
        requestState: RequestState.LOADING,
        currentEvent: event,
        errorMessage: '',
      );
      try {
        List<Contact> data = await contactsRepository.allContacts();
        yield ContactsState(
          contacts: data,
          requestState: RequestState.LOADED,
          currentEvent: event,
          errorMessage: '',
        );
      } catch (e) {
        yield ContactsState(
          contacts: state.contacts,
          requestState: RequestState.ERROR,
          errorMessage: e.toString(),
          currentEvent: event,
        );
      }
    }
    if (event is LoadDevelopersEvent) {
      yield ContactsState(
        contacts: state.contacts,
        requestState: RequestState.LOADING,
        currentEvent: event,
        errorMessage: '',
      );
      try {
        List<Contact> data =
            await contactsRepository.contactsByType(type: "Developer");
        yield ContactsState(
          contacts: data,
          requestState: RequestState.LOADED,
          currentEvent: event,
          errorMessage: '',
        );
      } catch (e) {
        yield ContactsState(
          contacts: state.contacts,
          requestState: RequestState.ERROR,
          errorMessage: e.toString(),
          currentEvent: event,
        );
      }
    }
    if (event is LoadStudentsEvent) {
      yield ContactsState(
        contacts: state.contacts,
        requestState: RequestState.LOADING,
        currentEvent: event,
        errorMessage: '',
      );
      try {
        List<Contact> data =
            await contactsRepository.contactsByType(type: "Student");
        yield ContactsState(
          contacts: data,
          requestState: RequestState.LOADED,
          currentEvent: event,
          errorMessage: '',
        );
      } catch (e) {
        yield ContactsState(
          contacts: state.contacts,
          requestState: RequestState.ERROR,
          errorMessage: e.toString(),
          currentEvent: event,
        );
      }
    }
  }
}
