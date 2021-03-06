import 'package:flutter_application_1/bloc/enums/enums.dart';
import 'package:flutter_application_1/bloc/messages/messages.actions.dart';
import 'package:flutter_application_1/model/contact.model.dart';
import 'package:flutter_application_1/model/message.model.dart';

class MessagesState {
  List<Message> messages;
  RequestState requestState;
  String? messageError;
  MessagesEvent currentMessageEvent;
  List<Message> messagesSelected = [];
  Contact? currentContact;

  MessagesState({
    required this.messages,
    required this.requestState,
    this.messageError,
    required this.currentMessageEvent,
    required this.messagesSelected,
    this.currentContact,
  });

  MessagesState.initialState()
      : requestState = RequestState.NONE,
        messageError = '',
        messages = [],
        currentMessageEvent = NoMessagesEvent(''),
        currentContact = null,
        messagesSelected = [];
}
