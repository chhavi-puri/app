import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/database/currentUID.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:dbdummy/viewModel/firebaseerrors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Firebase signup and exception handling
String errorMessage;
userSignup(context, signUpModel) {
  print('inisde sign up');
  FirebaseAuth.instance
      .createUserWithEmailAndPassword(
          email: signUpModel.signupemail, password: signUpModel.signuppassword)
      .then((currentUser) {
    print(currentUser);
    Firestore.instance
        .collection("users")
        .document(currentUser.user.uid)
        .setData({
      "uid": currentUser.user.uid,
      "name": signUpModel.signupname,
      "phone number": signUpModel.signupphone,
      "currentUSERID": currentUser.user.uid,
    }).then((result) => {
              Navigator.pushNamed(context, Routes().temp),
            });
  }).catchError((error) {
    catchFirebaseErrors(context, error);
  });
}

updateData(accountScreenModel, context) {
  print('hi');
  Firestore.instance
      .collection('users')
      .document(getUID().toString())
      .updateData({
    "name": accountScreenModel.editName.text,
    "phone number": accountScreenModel.editPhone.text
  }).then((result) {
    print(accountScreenModel.editName.text);
    print("new USer true");
  }).catchError((error) {
    catchFirebaseErrors(context, error);
  });
}
