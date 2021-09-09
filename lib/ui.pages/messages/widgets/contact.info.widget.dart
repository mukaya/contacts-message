import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/contact.model.dart';

class ContactInfoWidget extends StatelessWidget {
  Contact contact;
  ContactInfoWidget({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      child: Row(
        children: [
          CircleAvatar(
            child: Text(contact.profile),
          ),
          SizedBox(
            width: 10,
          ),
          Text(contact.name),
        ],
      ),
    );
  }
}
