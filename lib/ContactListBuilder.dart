import 'package:flutter/material.dart';
import 'ContactManager.dart';
import 'Provider.dart';
import 'model/Contact.dart';

class ContactListBuilder extends StatelessWidget {
  @required final Function builder;

  const ContactListBuilder({this.builder});

  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of<ContactManager>(context);

    return StreamBuilder<List<Contact>>(
      stream: manager.contactListView,
      // ignore: missing_return
      builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            List<Contact> contacts = snapshot.data;

            return builder(context, contacts);
        }
      },
    );
  }
}
