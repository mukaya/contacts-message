import 'package:flutter_application_1/bloc/enums/enums.dart';
import 'package:flutter_application_1/bloc/messages/messages.actions.dart';
import 'package:flutter_application_1/model/message.model.dart';

class MessagesState {
  List<Message> messages;
  RequestState requestState;
  String? messageError;
  MessagesEvent currentMessageEvent;

  MessagesState({
    required this.messages,
    required this.requestState,
    this.messageError,
    required this.currentMessageEvent,
  });

  MessagesState.initialState()
      : requestState = RequestState.NONE,
        messageError = '',
        messages = [],
        currentMessageEvent = NoMessagesEvent('');
}
