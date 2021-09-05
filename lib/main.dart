import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui.pages/contacts/contacts.page.dart';

main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      routes: {
        '/contacts': (context) => Contactspage(),
      },
      initialRoute: '/contacts',
    );
  }
}
