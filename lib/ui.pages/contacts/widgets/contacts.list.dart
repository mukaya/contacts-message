import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/contact.model.dart';

class ContactsList extends StatelessWidget {
  List<Contact> contacts;
  ContactsList({Key? key, required this.contacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Text("${contacts[index].profile}"),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text("${contacts[index].name}"),
                  ],
                ),
                CircleAvatar(
                  child: Text("${contacts[index].score}"),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
