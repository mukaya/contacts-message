import 'package:flutter/material.dart';

class Contactspage extends StatelessWidget {
  const Contactspage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: Center(
        child: Text("je suis le contacts"),
      ),
    );
  }
}
