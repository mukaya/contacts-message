import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/model/contact.model.dart';
import 'package:flutter_application_1/repositories/contacts.repo.dart';

abstract class ContactsEvent {}

class LoadAllContactsEvent extends ContactsEvent {}

class LoadStudentsEvent extends ContactsEvent {}

class LoadDevelopersEvent extends ContactsEvent {}

enum RequestState { LOADING, LOADED, ERROR, NONE }

class ContactsState {
  List<Contact> contacts;
  RequestState requestState;
  String? errorMessage;

  ContactsState({
    required this.contacts,
    required this.requestState,
    this.errorMessage,
  });
}

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsRepository contactsRepository;
  ContactsBloc(ContactsState initialState, this.contactsRepository)
      : super(initialState);

  @override
  Stream<ContactsState> mapEventToState(ContactsEvent event) async* {
    if (event is LoadAllContactsEvent) {
      yield ContactsState(
        contacts: state.contacts,
        requestState: RequestState.LOADING,
      );
      try {
        List<Contact> data = await contactsRepository.allContacts();
        yield ContactsState(contacts: data, requestState: RequestState.LOADED);
      } catch (e) {
        yield ContactsState(
          contacts: state.contacts,
          requestState: RequestState.ERROR,
          errorMessage: e.toString(),
        );
      }
    }
    if (event is LoadDevelopersEvent) {}
    if (event is LoadStudentsEvent) {}
  }
}
