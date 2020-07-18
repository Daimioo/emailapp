import 'package:flutter/material.dart';

import 'ContactManager.dart';
import 'Overseer.dart';
import 'Provider.dart';

class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context).fetch(ContactManager);

    return Chip(
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
    );
  }
}
