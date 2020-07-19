import 'package:flutter/material.dart';
import 'package:sprinkle/Observer.dart';
import 'package:sprinkle/SprinkleExtension.dart';

import 'ContactManager.dart';

class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContactManager manager = context.fetch<ContactManager>();


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
