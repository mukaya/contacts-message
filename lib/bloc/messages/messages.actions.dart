import 'package:flutter_application_1/model/contact.model.dart';
import 'package:flutter_application_1/model/message.model.dart';

abstract class MessageEvent<T> {
  T payload;
  MessageEvent(this.payload);
}

class MessagesByContactEvent extends MessageEvent<Contact> {
  MessagesByContactEvent(Contact payload) : super(payload);
}

class AddNewMessageEvent extends MessageEvent<Message> {
  AddNewMessageEvent(Message payload) : super(payload);
}
