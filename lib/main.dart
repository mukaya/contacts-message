import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/contacts.bloc.dart';
import 'package:flutter_application_1/bloc/contacts.state.dart';
import 'package:flutter_application_1/bloc/enums/enums.dart';
import 'package:flutter_application_1/bloc/messages/messages.state.dart';
import 'package:flutter_application_1/repositories/contacts.repo.dart';
import 'package:flutter_application_1/repositories/messages.repositories.dart';
import 'package:flutter_application_1/ui.pages/contacts/contacts.page.dart';
import 'package:flutter_application_1/ui.pages/messages/messages.page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'bloc/messages/messages.bloc.dart';

void main() {
  GetIt.instance.registerLazySingleton(() => new ContactsRepository());
  GetIt.instance.registerLazySingleton(() => new MessagesRepository());
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
            contactsRepository: GetIt.instance<ContactsRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => MessagesBloc(
            initialState: MessagesState.initialState(),
            messagesRepository: GetIt.instance<MessagesRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        routes: {
          '/contacts': (context) => Contactspage(),
          '/messages': (context) => MessagesPage(),
        },
        initialRoute: '/contacts',
      ),
    );
  }
}
