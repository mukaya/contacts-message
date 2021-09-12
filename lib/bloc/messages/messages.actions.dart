import 'package:flutter_application_1/model/contact.model.dart';
import 'package:flutter_application_1/model/message.model.dart';

abstract class MessagesEvent<T> {
  T? payload;
  MessagesEvent(this.payload);
}

class MessagesByContactEvent extends MessagesEvent<Contact> {
  MessagesByContactEvent(Contact payload) : super(payload);
}

class AddNewMessagesEvent extends MessagesEvent<Message> {
  AddNewMessagesEvent(Message payload) : super(payload);
}

class NoMessagesEvent extends MessagesEvent {
  NoMessagesEvent(payload) : super(payload);
}

class MessagesSelectedEvent extends MessagesEvent<Message> {
  MessagesSelectedEvent(payload) : super(payload);
}

// class DeleteMessagesEvent extends MessagesEvent<Object> {
//   DeleteMessagesEvent(payload) : super(payload);
// }

class DeleteMessagesEvent extends MessagesEvent {
  DeleteMessagesEvent() : super(null);
}
