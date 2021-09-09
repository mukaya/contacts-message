import 'dart:math';
import 'package:flutter_application_1/model/message.model.dart';

class MessagesRepository {
  Map<int, Message> messages = {
    1: Message(
      id: 1,
      contactId: 1,
      date: DateTime.now(),
      content: 'Je suis avec toi',
      type: 'sent',
    ),
    2: Message(
      id: 2,
      contactId: 2,
      date: DateTime.now(),
      content: 'Bonjour les amis',
      type: 'sent',
    ),
    3: Message(
      id: 3,
      contactId: 3,
      date: DateTime.now(),
      content: 'Hello word',
      type: 'sent',
    ),
    4: Message(
      id: 4,
      contactId: 4,
      date: DateTime.now(),
      content: 'Je suis toujours avec toi',
      type: 'sent',
    ),
    5: Message(
      id: 5,
      contactId: 5,
      date: DateTime.now(),
      content: 'La vie est belle',
      type: 'sent',
    ),
    6: Message(
      id: 6,
      contactId: 3,
      date: DateTime.now(),
      content: 'La vie est belle',
      type: 'sent',
    ),
    7: Message(
      id: 8,
      contactId: 3,
      date: DateTime.now(),
      content:
          'La vie est belle La vie est belle La vie est belle La vie est belle La vie est belle La vie est belle La vie est belle',
      type: 'receiver',
    ),
  };

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
    if (nb > 3) {
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
}
