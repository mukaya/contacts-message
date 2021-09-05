import 'dart:math';

import 'package:flutter_application_1/model/contact.model.dart';

class ContactsRepository {
  Map<int, Contact> contacts = {
    1: Contact(
        id: 1, name: "Mukaya", profile: "Mu", type: 'Developer', score: 45687),
    2: Contact(
        id: 1, name: "Kabeya", profile: "Ka", type: 'Student', score: 56),
    3: Contact(
        id: 1, name: "Bitota", profile: "Bi", type: 'Developer', score: 4587),
    4: Contact(
        id: 1, name: "Mapwata", profile: "Ma", type: 'Developer', score: 87),
    5: Contact(
        id: 1, name: "Lola", profile: "Lo", type: 'Student', score: 4687),
  };

  Future<List<Contact>> allContacts() async {
    await Future.delayed(Duration(seconds: 1));
    int rnd = Random().nextInt(10);
    if (rnd > 3) {
      var allContacts;
      allContacts = contacts.values.toList();
      return allContacts;
    } else {
      throw Exception("Error on ContactsRepository.allContacts()");
    }
  }

  Future<List<Contact>> contactsByType({String? type}) async {
    await Future.delayed(Duration(seconds: 1));
    int random = Random().nextInt(10);
    if (random > 3) {
      var contactsByType;
      contactsByType =
          contacts.values.toList().where((element) => element.type == type);
      return contactsByType;
    } else {
      throw Exception("Error on ContactsRepository.contactsByType()");
    }
  }
}
