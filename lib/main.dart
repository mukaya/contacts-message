import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/contacts.bloc.dart';
import 'package:flutter_application_1/bloc/contacts.state.dart';
import 'package:flutter_application_1/bloc/enums/enums.dart';
import 'package:flutter_application_1/repositories/contacts.repo.dart';
import 'package:flutter_application_1/ui.pages/contacts/contacts.page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ContactsBloc(
            initialState: ContactsState(
              contacts: [],
              requestState: RequestState.NONE,
              errorMessage: '',
              currentEvent: null,
            ),
            contactsRepository: new ContactsRepository(),
          ),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        routes: {
          '/contacts': (context) => Contactspage(),
        },
        initialRoute: '/contacts',
      ),
    );
  }
}
