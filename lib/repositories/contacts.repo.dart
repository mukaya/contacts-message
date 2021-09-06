import 'dart:math';
import 'package:flutter_application_1/model/contact.model.dart';

class ContactsRepository {
  Map<int, Contact> contacts = {
    1: Contact(
        id: 1, name: "Mukaya", profile: "Mu", type: 'Developer', score: 4567),
    2: Contact(
        id: 2, name: "Kabeya", profile: "Ka", type: 'Student', score: 56),
    3: Contact(
        id: 3, name: "Bitota", profile: "Bi", type: 'Developer', score: 4587),
    4: Contact(
        id: 4, name: "Mapwata", profile: "Ma", type: 'Developer', score: 87),
    5: Contact(
        id: 5, name: "Lola", profile: "Lo", type: 'Student', score: 4687),
    6: Contact(
        id: 6, name: "Kabila", profile: "Ka", type: 'Student', score: 4687),
  };

  Future<List<Contact>> allContacts() async {
    await Future.delayed(Duration(seconds: 1));
    int rnd = Random().nextInt(10);
    if (rnd > 2) {
      List<Contact> allContacts;
      allContacts = contacts.values.toList();
      return allContacts;
    } else {
      throw Exception("Internet  Error");
    }
  }

  Future<List<Contact>> contactsByType({String? type}) async {
    await Future.delayed(Duration(seconds: 1));
    int random = Random().nextInt(10);
    if (random > 2) {
      var contactsByType;
      contactsByType = contacts.values
          .toList()
          .where((element) => element.type == type)
          .toList();
      return contactsByType;
    } else {
      throw Exception("Internet  Error");
    }
  }
}
