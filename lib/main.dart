import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/messages/messages.state.dart';
import 'package:flutter_application_1/repositories/contacts.repo.dart';
import 'package:flutter_application_1/repositories/messages.repositories.dart';
import 'package:flutter_application_1/ui.pages/contacts/contacts.page.dart';
import 'package:flutter_application_1/ui.pages/contactsWithMessages/contacts.messages.page.dart';
import 'package:flutter_application_1/ui.pages/messages/messages.page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'bloc/contacts/contacts.bloc.dart';
import 'bloc/contacts/contacts.state.dart';
import 'bloc/messages/messages.bloc.dart';

void main() {
  GetIt.instance.registerLazySingleton(() => ContactsRepository());
  GetIt.instance.registerLazySingleton(() => MessagesRepository());
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
          create: (context) => MessagesBloc(
            initialState: MessagesState.initialState(),
            messagesRepository: GetIt.instance<MessagesRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => ContactsBloc(
            initialState: ContactsState.initialState(),
            contactsRepository: GetIt.instance<ContactsRepository>(),
            messagesBloc: context.read<MessagesBloc>(),
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
          '/contactsWithMessages': (context) => ConatctsWithMessages(),
        },
        initialRoute: '/contacts',
      ),
    );
  }
}
