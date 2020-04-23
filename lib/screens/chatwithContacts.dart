import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/components/appbar_decoration.dart';
import 'package:dbdummy/model/chatwithModel.dart';
import 'package:dbdummy/screens/chatscreen.dart';
import 'package:flutter/material.dart';

class ChatWithContact extends StatefulWidget {
  @override
  ChatWithContactState createState() => ChatWithContactState();
}

class ChatWithContactState extends State<ChatWithContact> {
  String name;
  String uid;
  ChatWithModel _chatWithModel = ChatWithModel();
  QuerySnapshot querySnapshot;
  getUserInfo() async {
    return await Firestore.instance.collection('users').getDocuments();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        centerTitle: true,
        title: Text(
          'Chat with!',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: boxDecoration,
        ),
      ),
      body: usersInfo(),
    );
  }

  Widget usersInfo() {
    getUserInfo().then((results) {
      setState(() {
        querySnapshot = results;
      });
    });
    if (querySnapshot != null) {
      return ListView.builder(
          itemCount: querySnapshot.documents.length,
          itemBuilder: ((BuildContext context, int index) {
            _chatWithModel.name = querySnapshot.documents[index].data['name'];
            _chatWithModel.phoneNumber =
                querySnapshot.documents[index].data['phone number'];
            _chatWithModel.userid = querySnapshot.documents[index].data['uid'];
            return Card(
              child: GestureDetector(
                child: ListTile(
                    onTap: () async {
                      name = querySnapshot.documents[index].data['name'];
                      uid = querySnapshot.documents[index].data['uid'];
                      print(name);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ChatScreen(chatWithUid: uid, chatWithName: name),
                        ),
                      );
                      
                    },
                    leading: Text('${_chatWithModel.name}'),
                    subtitle: Text('${_chatWithModel.phoneNumber}')),
              ),
            );
          }));
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}
