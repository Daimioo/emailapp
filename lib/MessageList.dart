
import 'package:emailapp/ComposeButton.dart';
import 'package:emailapp/Message.dart';
import 'package:emailapp/MessageCompose.dart';
import 'package:emailapp/MessageDetail.dart';
import 'package:flutter/material.dart';
// Get data from a file
// import 'package:flutter/services.dart';

class MessageList extends StatefulWidget {
  final String title;

  const MessageList({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  Future<List<Message>> future;
  List<Message> messages = [];

  @override
  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    future = Message.browse();
    messages = await future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: () async {
            var _messages = await Message.browse();

            setState(() {
              messages = _messages;
            });
          })
        ],
      ),
      body: FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
            if (snapshot.hasError) return Text('There was an error: ${snapshot.error}');
            var messages = snapshot.data;
              return ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  Message message = messages[index];

                  return ListTile(
                    title: Text(message.subject),
                    isThreeLine: true,
                    leading: CircleAvatar(
                      child: Text('AV'),
                    ),
                    subtitle: Text(
                      message.body,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      Navigator.push(context,
                       MaterialPageRoute(builder: (BuildContext context) => MessageDetail(message.subject, message.body)));
                    },
                  );
                },
              );
          }
        },
      ),
      floatingActionButton: ComposeButton(messages),
    );
  }
}