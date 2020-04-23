import 'package:dbdummy/database/firebasestore.dart';
import 'package:dbdummy/model/ownerscreen_model.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:dbdummy/screens/signupsignin/widget/signup.dart';
import 'package:flutter/material.dart';

void insertingDtaFirebase(
    BuildContext context, OwnerScreenModel ownerScreenModel) async {
  // upload
  print('Inside insertingDtaFirebase');
  print('uid is still $uid');
  Map<String, String> petInformation = <String, String>{
    "uid": uid,
    "petName": petName.text,
    "petAge": petAge.text,
    "petBreed": petBreed.text,
    "petGender": petGender.text,
    "petDescription": petDescription.text,
    "ImageUrl": ownerScreenModel.imageUrl,
  };

  petCollection.document(uid).setData(petInformation).then((_) {
    print('data set ${petName.text}');
    petName.clear();
    petAge.clear();
    petBreed.clear();
    petGender.clear();
    petDescription.clear();

    Navigator.pushReplacementNamed(context, Routes().adopterDisplay);
  });
}
