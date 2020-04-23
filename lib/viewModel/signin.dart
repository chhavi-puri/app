import 'package:dbdummy/database/firebaselogin.dart';
import 'package:dbdummy/database/sharedpreference.dart';
import 'package:dbdummy/model/sigin_model.dart';
import 'package:dbdummy/screens/signupsignin/widget/signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

onPressedLogin(BuildContext context, SignInModel signInModel) async {
  final formState = ksiginformKey.currentState;
  if (formState.validate()) {
    formState.save();
    saveData(signInModel);
    userLogin(context, signInModel);
   }
}
