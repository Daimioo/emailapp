import 'package:flutter/material.dart';
import 'AppDrawer.dart';
import 'ContactListBuilder.dart';
import 'ContactManager.dart';
import 'ContactsSearchDelegate.dart';
import 'model/Contact.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final ContactManager manager = ContactManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        actions: <Widget>[
          Chip(
            label: StreamBuilder<int>(
              stream: manager.contactCounter,
              builder: (context, snapshot) {
                return Text(
                    (snapshot.data ?? 0).toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    )
                );
              }
            ),
            backgroundColor: Colors.red,
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => showSearch(
                context: context,
                delegate: ContactsSearchDelegate(manager: manager)
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ContactListBuilder(
        stream: manager.contactListView,
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
