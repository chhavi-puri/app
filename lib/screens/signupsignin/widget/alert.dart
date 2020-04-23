import 'package:dbdummy/model/sigin_model.dart';
import 'package:flutter/material.dart';


showAlertDialog(BuildContext context, String errorMessage) {
  SignInModel signInModel = SignInModel();
  // set up the buttons
  Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
        signInModel.isLoading = false;
      });
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "Alert!",
      style: TextStyle(color: Colors.red),
    ),
    content: Text("$errorMessage"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
