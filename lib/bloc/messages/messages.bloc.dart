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
      yield MessagesState(
        messages: state.messages,
        requestState: RequestState.LOADING,
        currentMessageEvent: event,
        messageError: '',
        messagesSelected: state.messagesSelected,
      );
      try {
        List<Message> data = await messagesRepository.allMessagesByContact(
            contactId: event.payload!.id);

        yield MessagesState(
          messages: data,
          requestState: RequestState.LOADED,
          currentMessageEvent: event,
          messageError: '',
          messagesSelected: state.messagesSelected,
        );
      } catch (e) {
        yield MessagesState(
            messages: state.messages,
            requestState: RequestState.ERROR,
            currentMessageEvent: event,
            messagesSelected: state.messagesSelected,
            messageError: e.toString());
      }
    }

    if (event is AddNewMessagesEvent) {
      try {
        event.payload!.date = DateTime.now();
        Message message =
            await messagesRepository.addNewMessage(message: event.payload);
        List<Message> data = [...state.messages];
        data.add(message);

        yield MessagesState(
          messages: data,
          requestState: RequestState.LOADED,
          currentMessageEvent: event,
          messageError: '',
          messagesSelected: state.messagesSelected,
        );
      } catch (e) {
        yield MessagesState(
            messages: state.messages,
            requestState: RequestState.ERROR,
            currentMessageEvent: event,
            messagesSelected: state.messagesSelected,
            messageError: e.toString());
      }
    }
    if (event is MessagesSelectedEvent) {
      List<Message> messages = state.messages;
      List<Message> selected = [...state.messagesSelected];
      for (Message m in messages) {
        if (m.id == event.payload!.id) {
          m.selected = m.selected;
        }
        if (m.selected == true) {
          selected.add(m);
        } else {
          selected.removeWhere((element) => element.id == m.id);
        }
      }
      MessagesState messagesState = MessagesState(
        messages: messages,
        requestState: RequestState.LOADED,
        currentMessageEvent: event,
        messagesSelected: selected,
      );
      yield messagesState;
    }

    if (event is DeleteMessagesEvent) {
      List<Message> messages = state.messages;
      List<Message> selected = [...state.messagesSelected];
      for (Message m in messages) {
        try {
          await messagesRepository.deleteMessages(message: m);
          messages.removeWhere((element) => element.id == m.id);
          MessagesState messagesState = MessagesState(
            messages: messages,
            requestState: RequestState.LOADED,
            currentMessageEvent: event,
            messagesSelected: selected,
          );
          yield messagesState;
        } catch (e) {
          MessagesState messagesState = MessagesState(
            messages: messages,
            requestState: RequestState.ERROR,
            currentMessageEvent: event,
            messagesSelected: selected,
          );
          yield messagesState;
        }
      }
    }
  }
}
