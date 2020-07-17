import 'package:flutter/material.dart';
import 'AppDrawer.dart';
import 'ContactManager.dart';

class ContactsScreen extends StatelessWidget {
  ContactManager manager = ContactManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        actions: [
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
      body: StreamBuilder<List<String>>(
      stream: manager.contactListNow,
      builder: (context, snapshot) {
        List<String> contacts = snapshot.data;
        return  ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text(contacts[index]),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: contacts.length ?? 0
        );
      })
    );
  }
}
