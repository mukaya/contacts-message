import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/bloc/enums/enums.dart';
import 'package:flutter_application_1/bloc/messages/messages.actions.dart';
import 'package:flutter_application_1/bloc/messages/messages.state.dart';
import 'package:flutter_application_1/model/message.model.dart';
import 'package:flutter_application_1/repositories/messages.repositories.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  MessagesRepository messagesRepository = MessagesRepository();
  MessagesBloc({
    required MessagesState initialState,
    required this.messagesRepository,
  }) : super(initialState);

  @override
  Stream<MessagesState> mapEventToState(MessagesEvent event) async* {
    if (event is MessagesByContactEvent) {
      try {
        List<Message> data = await messagesRepository.allMessagesByContact(
            contactId: event.payload!.id);

        yield MessagesState(
          messages: data,
          requestState: RequestState.LOADED,
          currentMessageEvent: event,
          messageError: '',
        );
      } catch (e) {
        yield MessagesState(
            messages: state.messages,
            requestState: RequestState.ERROR,
            currentMessageEvent: event,
            messageError: e.toString());
      }
    }
  }
}
