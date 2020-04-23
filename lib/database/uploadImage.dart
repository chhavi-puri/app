import 'package:dbdummy/database/currentUID.dart';
import 'package:dbdummy/database/insertPetInfo.dart';
import 'package:dbdummy/model/ownerscreen_model.dart';
import 'package:dbdummy/screens/ownerscreen.dart';
import 'package:dbdummy/viewModel/firebaseerrors.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

Future uploadFile(
    BuildContext context, OwnerScreenModel ownerScreenModel) async {
      if(kformKey.currentState.validate())
      {
         StorageReference reference =
      FirebaseStorage.instance.ref().child("user_input/${petName.text}");
  StorageUploadTask uploadTask = reference.putFile(ownerScreenModel.imageFile);
  await uploadTask.onComplete;
  print('File uploaded');
  reference.getDownloadURL().then((fileURL) {
    print('inside download url');
    ownerScreenModel.imageUrl = fileURL;
    print('url after downloading is ${ownerScreenModel.imageUrl}');
    try {
      getUID().then((_) {
        insertingDtaFirebase(context, ownerScreenModel);
      });
    } catch (error) {
      catchFirebaseErrors(context, error);
    }
  });
      }
      
 
}
