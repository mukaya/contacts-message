import 'dart:math';
import 'package:flutter_application_1/model/message.model.dart';

class MessagesRepository {
  int messageCount = 0;
  Map<int, Message> messages = {
    1: Message(
      id: 1,
      contactId: 1,
      date: DateTime.now(),
      content: 'Je suis avec toi',
      type: 'sent',
      selected: false,
    ),
    2: Message(
      id: 2,
      contactId: 2,
      date: DateTime.now(),
      content: 'Bonjour les amis',
      type: 'sent',
      selected: false,
    ),
    3: Message(
      id: 3,
      contactId: 3,
      date: DateTime.now(),
      content: 'Hello word',
      type: 'sent',
      selected: false,
    ),
    4: Message(
      id: 4,
      contactId: 4,
      date: DateTime.now(),
      content: 'Je suis toujours avec toi',
      type: 'sent',
      selected: false,
    ),
    5: Message(
      id: 5,
      contactId: 5,
      date: DateTime.now(),
      content: 'La vie est belle',
      type: 'sent',
      selected: false,
    ),
    6: Message(
      id: 6,
      contactId: 3,
      date: DateTime.now(),
      content: 'La vie est belle',
      type: 'sent',
      selected: false,
    ),
    7: Message(
      id: 8,
      contactId: 3,
      date: DateTime.now(),
      content: 'La vie est belle La vie est belle',
      type: 'received',
      selected: false,
    ),
  };

  MessagesRepository() {
    this.messageCount = messages.length;
  }

  Future<List<Message>> allMessages() async {
    await Future.delayed(Duration(seconds: 1));
    int rnd = Random().nextInt(10);
    if (rnd > 3) {
      return messages.values.toList();
    } else {
      throw Exception("Internet error");
    }
  }

  Future<List<Message>> allMessagesByContact({required int contactId}) async {
    Future.delayed(Duration(seconds: 1));
    var nb = Random().nextInt(10);
    if (nb > 1) {
      var data;
      data = messages.values
          .toList()
          .where((element) => element.contactId == contactId)
          .toList();
      return data;
    } else {
      throw Exception("Internet error");
    }
  }

  Future<Message> addNewMessage({Message? message}) async {
    await Future.delayed(Duration(seconds: 1));
    var nb = Random().nextInt(10);
    if (nb > 1) {
      int i = 0;
      message!.id = ++messageCount;
      i = message.id!;
      messages[i] = message;
      return message;
    } else {
      throw Exception("Internet error");
    }
  }

  Future<void> deleteMessages({required Message message}) async {
    await Future.delayed(Duration(seconds: 1));
    var nb = Random().nextInt(10);
    if (nb > 0) {
      messages.remove(message.id);
    } else {
      throw Exception("Internet error");
    }
  }
}
