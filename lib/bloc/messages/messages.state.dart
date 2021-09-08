import 'package:flutter_application_1/bloc/enums/enums.dart';
import 'package:flutter_application_1/model/message.model.dart';

class MessagesState {
  List<Message> messages;
  RequestState requestState;
  String? messageError;
  var currentMessageEvent;

  MessagesState({
    required this.messages,
    required this.requestState,
    this.messageError,
    this.currentMessageEvent,
  });

  MessagesState.initialState()
      : requestState = RequestState.NONE,
        messageError = '',
        messages = [],
        currentMessageEvent = null;
}
