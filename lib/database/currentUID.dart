import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/screens/signupsignin/widget/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
Future<String> getUID() async {
  print('inside uid');
  final FirebaseUser user = await FirebaseAuth.instance.currentUser();
  
  uid = user.uid.toString();
  if (uid != null) {
    print('uid is not null $uid');
    return uid;
  } else {
    print('uid is null!');
    return null;
  }
}

getDetails(collectionn) async {
      print('current uid  is $uid');
      return await Firestore.instance.collection(collectionn).document(uid).get();
      
    }
    





