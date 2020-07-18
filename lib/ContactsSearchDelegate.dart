import 'package:flutter/material.dart';
import 'ContactListBuilder.dart';
import 'ContactManager.dart';
import 'Provider.dart';
import 'model/Contact.dart';

class ContactsSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    ContactManager manager = Provider.of(context);

    if (query.length < 3 ) {
      return Center(
        child: Text("Type more than 3 letters to search."),
      );
    }

    return ContactListBuilder(
      builder: (context, contacts) {
        return ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              Contact _contact = contacts[index];

              return ListTile(
                title: Text(_contact.name),
                subtitle: Text(_contact.email),
                leading: CircleAvatar(),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: contacts?.length ?? 0
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}