
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'constants.dart';
final _fireStore = FirebaseFirestore.instance;
 User? loggerUser;
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static const id= 'chat_screen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  late String messageText;

  @override
  void initState(){
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async{

  try{
     loggerUser = await _auth.currentUser!;

  }catch (e){
    print(e);
  }

  }

  void messagesStream() async {
  final messages=  await _fireStore.collection('messages').get();
 await  for(var snapshot  in _fireStore.collection('messages').snapshots()){
      for( var message in snapshot.docs){
        print(message.data());
      }
   }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () async {
                messagesStream();
              /*  await _auth.signOut();
                Navigator.pop(context);*/
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                       messageText = value;  //Do something with the user input.
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Material(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () async {
                          messageTextController.clear();
                   try{
                     await _fireStore.collection('messages').add({
                       'text' : messageText,
                       'sender': loggerUser?.email
                     });
                   }catch(e){
                     print(e);
                   }
                        },
                        minWidth: 200.0,
                        height: 42.0,
                        child: Text(
                          'Send',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.text, required this.sender, required this.isMe});
  final String text;
  final String sender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
          Text(sender, style: TextStyle(fontSize: 12.0,
              color: Colors.green),),
          Material(
          borderRadius: isMe ? BorderRadius.only(
            topLeft: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ) : BorderRadius.only(
            topRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
           elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent: Colors.white,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                child: Text(
                  text,
                  style: TextStyle(fontSize: 20.0,
                      color: isMe ? Colors.white: Colors.lightBlueAccent),
                ))),
      ]),
    );
  }
}

class MessagesStream extends StatelessWidget {
  const MessagesStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _fireStore.collection('messages').snapshots(),
        builder: (context, snapshots) {
          if (!snapshots.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
          final messages = snapshots.data?.docs.reversed;
          List<MessageBubble> messageWidgets = [];
          for (var message in messages!) {
            final data = message.data() as Map<String, dynamic>;
            final messageText = data['text'];
            final messageSender = data['sender'];
            final currentUser = data['sender'];


            final messageWidget = MessageBubble(text: messageText, sender: messageSender, isMe: currentUser == loggerUser?.email,);
            messageWidgets.add(messageWidget);
            print( currentUser == loggerUser?.email);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric( horizontal: 10.0, vertical: 20.0),
              children: messageWidgets,
            ),
          );

        });
  }
}

