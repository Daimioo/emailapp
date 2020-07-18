import 'package:flutter/material.dart';
import 'AppDrawer.dart';
import 'ContactCounter.dart';
import 'ContactListBuilder.dart';
import 'ContactsSearchDelegate.dart';
import 'model/Contact.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        actions: <Widget>[
          ContactCounter(),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => showSearch(
                context: context,
                delegate: ContactsSearchDelegate()
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ContactListBuilder(
        builder: (context, contacts) {
          return ListView.separated(
              itemBuilder: (context, index) {
                Contact _contact = contacts[index];

                return ListTile(
                  title: Text(_contact.name),
                  subtitle: Text(_contact.email),
                  leading: CircleAvatar(),
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: contacts.length ?? 0
          );
        },
      )
    );
  }
}
