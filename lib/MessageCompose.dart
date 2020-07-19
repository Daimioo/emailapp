import 'package:emailapp/Message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Observer.dart';
import 'Provider.dart';
import 'manager/MessageFormManager.dart';

class MessageCompose extends StatefulWidget {
  @override
  _MessageComposeState createState() => _MessageComposeState();
}

class _MessageComposeState extends State<MessageCompose> {
  String to = "";
  String subject = "";
  String body = "";

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MessageFormManager manager = Provider.of(context).fetch(MessageFormManager);

    return Scaffold(
      appBar: AppBar(title: Text("Compose New Message"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
              children: <Widget>[
                ListTile(
                  title: Observer(
                    stream: manager.email$,
                    onSuccess: (context, data) {
                      return TextField(
                        onChanged: manager.inEmail.add,
                        decoration: InputDecoration(
                          labelText: 'TO',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                    onError: (context, data) {
                      return TextField(
                        decoration: InputDecoration(
                          labelText: 'TO (error)',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          errorText: 'This field is invalid',
                        ),
                      );
                    },
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    validator: (value) {
                      int len = value.length;
                      if (len == 0) return "`SUBJECT` cannot be empty";
                      if (len < 4) return "`SUBJECT` must be longer than 4 characters";
                      return null;
                    },
                    onSaved: (value) => subject = value,
                    decoration: InputDecoration(
                      labelText: 'SUBJECT',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: TextFormField(
                    onSaved: (value) => body = value,
                    decoration: InputDecoration(
                      labelText: 'BODY',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    maxLines: 9,
                  )
                ),
                ListTile(
                  title: RaisedButton(
                    child: Text('SEND'),
                    onPressed: () {
                      if (this.key.currentState.validate()) {
                        this.key.currentState.save();
                        Message message = Message(subject, body);
                        Navigator.pop(context, message);
                      }
                    },
                  ),
                )
              ],
            ),
        )
      )
    );
  }
}