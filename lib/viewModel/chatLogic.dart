import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/viewModel/firebaseErrors.dart';
import 'package:flutter/material.dart';

Future<void> callback(chatModel, widget, context) async {
  print(chatModel.messageController.text);
  if (chatModel.messageController.text.length > 0) {
    try {
      var documentReference = Firestore.instance
          .collection('messages')
          .document(chatModel.chatId)
          .collection(chatModel.chatId)
          .document(DateTime.now().millisecondsSinceEpoch.toString());
      Firestore.instance.runTransaction((transaction) async {
        await transaction.set(
          documentReference,
          {
            'text': chatModel.messageController.text,
            'from': chatModel.name,
            'to': widget.chatWithName,
            'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
          },
        );
      });
    } catch (error) {
      catchFirebaseErrors(context, error);
    }
    
    chatModel.scrollController.animateTo(
        chatModel.scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300));
   
  }
  
}

chatId(chatModel, widget) async {
  if (widget.chatWithUid.hashCode <= chatModel.user.uid.hashCode) {
    chatModel.chatId = '${widget.chatWithUid}-${chatModel.user.uid}';
  } else {
    chatModel.chatId = '${chatModel.user.uid}-${widget.chatWithUid}';
  }
}
