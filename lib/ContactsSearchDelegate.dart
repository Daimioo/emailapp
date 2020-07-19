import 'package:flutter/material.dart';
import 'ContactListBuilder.dart';
import 'ContactManager.dart';
import 'model/Contact.dart';
import 'package:sprinkle/SprinkleExtension.dart';

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
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    ContactManager manager = context.fetch<ContactManager>();

    manager.inFilter.add(query);

    return ContactListBuilder(
      stream: manager.browse$,
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

}