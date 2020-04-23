import 'package:dbdummy/database/currentUID.dart';
import 'package:dbdummy/model/sigin_model.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:dbdummy/viewModel/firebaseerrors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String errorMessage;
// Firebase signin and exception handling
Future userLogin(context, SignInModel signInModel) async {
  try {
    print('inside');
    print(' here ${signInModel.signinemail}');
    print(signInModel.signinpassword); // primntinh till this point
    final user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: signInModel.signinemail,
            password: signInModel.signinpassword))
        .user;
    print(user.email);
    // print('here again');
    getUID();
    await Navigator.pushReplacementNamed(context, Routes().homeScreen);
  } catch (error) {
    catchFirebaseErrors(context, error);
  }
}
