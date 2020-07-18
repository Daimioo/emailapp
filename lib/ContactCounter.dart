import 'package:flutter/material.dart';

import 'ContactManager.dart';
import 'Observer.dart';
import 'Provider.dart';

class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context).fetch(ContactManager);

    return Chip(
      label: Observer<int>(
          stream: manager.count$,
          onSuccess: (context, data) {
            return Text(
                (data ?? 0).toString(),
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
