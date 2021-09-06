import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/contacts.bloc.dart';
import 'package:flutter_application_1/bloc/contacts.state.dart';
import 'package:flutter_application_1/bloc/enums/enums.dart';
import 'package:flutter_application_1/ui.pages/contacts/widgets/contacts.bar.buttons.dart';
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
          ContactsBarButtons(),
          Expanded(
            child: BlocBuilder<ContactsBloc, ContactsState>(
              builder: (context, state) {
                if (state.requestState == RequestState.LOADING) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.requestState == RequestState.ERROR) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${state.errorMessage}"),
                      ElevatedButton(
                        onPressed: () {
                          context.read<ContactsBloc>().add(state.currentEvent);
                        },
                        child: Text("Retry..."),
                      ),
                    ],
                  );
                } else if (state.requestState == RequestState.LOADED) {
                  return ListView.builder(
                    itemCount: state.contacts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  child:
                                      Text("${state.contacts[index].profile}"),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("${state.contacts[index].name}"),
                              ],
                            ),
                            CircleAvatar(
                              child: Text("${state.contacts[index].score}"),
                            )
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return Container();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
