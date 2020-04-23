import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/viewModel/chatLogic.dart';
import 'package:dbdummy/viewModel/firebaseErrors.dart';
import 'package:firebase_auth/firebase_auth.dart';

getUser(chatModel, widget, context) async {
  try {
    chatModel.user = await FirebaseAuth.instance.currentUser();
    chatModel.details = await Firestore.instance
        .collection('users')
        .document(chatModel.user.uid)
        .get();
  } catch (error) {
    catchFirebaseErrors(context, error);
  }
  chatModel.name = chatModel.details.data['name'].toString();
  chatId(chatModel, widget);
}

subCollection(chatModel, context) {
  print('in get message');
  try {
    return Firestore.instance
        .collection('messages')
        .document(chatModel.chatId)
        .collection(chatModel.chatId)
        .orderBy('timestamp', descending: false)
        .limit(20)
        .snapshots();
  } catch (error) {
    catchFirebaseErrors(context, error);
  }
}

firstCollection(chatModel, context) {
  try {
    return Firestore.instance
        .collection('messages')
        .document(chatModel.chatId)
        .collection(chatModel.chatId)
        .snapshots();
  } catch (error) {
    catchFirebaseErrors(context, error);
  }
}
