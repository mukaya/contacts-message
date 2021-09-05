import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/contacts.bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Contactspage extends StatelessWidget {
  const Contactspage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<ContactsBloc>().add(
                          LoadAllContactsEvent(),
                        );
                  },
                  child: Text(
                    "All contacts",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Students",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Developers",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<ContactsBloc, ContactsState>(
            builder: (context, state) {
              if (state.requestState == RequestState.LOADING) {
                return CircularProgressIndicator();
              } else if (state.requestState == RequestState.ERROR) {
                return Column(
                  children: [
                    Text("${state.errorMessage}"),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Retry"),
                    ),
                  ],
                );
              } else if (state.requestState == RequestState.LOADED) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.contacts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          children: [
                            Text("${state.contacts[index].name}"),
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Container();
              }
            },
          )
        ],
      ),
    );
  }
}
