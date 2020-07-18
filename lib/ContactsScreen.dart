import 'package:flutter/material.dart';
import 'AppDrawer.dart';
import 'ContactManager.dart';
import 'model/Contact.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  ContactManager manager = ContactManager();

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
          Padding(
            padding: EdgeInsets.only(right: 16),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: StreamBuilder<List<Contact>>(
      stream: manager.contactListNow,
      // ignore: missing_return
      builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            List<Contact> contacts = snapshot.data;
            return ListView.separated(
                itemBuilder: (context, index) {
                  Contact _contact = contacts[index];

                  return ListTile(
                    title: Text(_contact.name),
                    subtitle: Text(_contact.email),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: contacts.length ?? 0
            );
        }
      },
      )
    );
  }
}
