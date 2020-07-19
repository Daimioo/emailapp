import 'package:flutter/material.dart';
import 'package:sprinkle/Observer.dart';
import 'model/Contact.dart';

class ContactListBuilder extends StatelessWidget {
  @required final Function builder;
  @required final Stream stream;


  const ContactListBuilder({this.builder, this.stream});

  @override
  Widget build(BuildContext context) {
    return Observer<List<Contact>>(
      stream: stream,
      // ignore: missing_return
      onSuccess: (BuildContext context, List<Contact> data) {
        return builder(context, data);
      },
      onWaiting: (context) => LinearProgressIndicator(),
    );
  }
}
