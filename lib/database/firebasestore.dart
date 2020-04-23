import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/database/sqflitehelper_utils.dart';
import 'package:dbdummy/model/ownerscreen_model.dart';
import 'package:dbdummy/model/sigin_model.dart';
import 'package:dbdummy/model/sqflite_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

OwnerScreenModel ownerScreenModel = OwnerScreenModel();
SignInModel signInModel1;
String petData;
final userCollection = Firestore.instance.collection('users');
final petCollection = Firestore.instance.collection('PetDetails');
final acceptorCollection = Firestore.instance.collection('AcceptorDetails');
final databaseReference = Firestore.instance;
final donorFav = Firestore.instance.collection('donorFav');
FirebaseAuth auth = FirebaseAuth.instance;
DbPet dbPet = DbPet();

firebasedatatosqflite() async {
  int i;
  List<DocumentSnapshot> data =
      (await databaseReference.collection('PetDetails').getDocuments())
          .documents;
  final newData = data
      .map((DocumentSnapshot s) {
        return s.data;
      })
      .toList()
      .cast<Map<String, dynamic>>();
  for (i = 0; i < newData.length; i++) {
    dbPet.insertPet(newData.elementAt(i)).then((_) {
      print('inserted successfully');
    });
  }
  for (i = 0; i < newData.length; i++) {
    Pet(
        petName: newData[i]['petName'],
        uid: newData[i]['uid'],
        petAge: newData[i]['petAge'],
        petBreed: newData[i]['petBreed'],
        petDescription: newData[i]['petDescription']);
  }
}

// insertFirebaseToSqflite(){
//   Map<String, String> firebasetosqflitepetInformation = <String, String>{
//     "Pet_name": petName.text,
//     "Pet_age": petAge.text,
//     "Pet_breed": petBreed.text,
//     "UID": uid,
//   };
// }

// Future uploadMultipleImages() async {
//   imageList.add(imagefiles);
//   for (int i = 0; i <= imageList.length; i++) {
//     StorageReference reference =
//         FirebaseStorage.instance.ref().child("user_input/$i");
//     StorageUploadTask uploadTask = reference.putFile(imagefiles);
//     await uploadTask.onComplete;
//     reference.getDownloadURL().then((fileURL) {
//       imageUrls.add(fileURL);
//       print(fileURL);
//     });
//   }
// }
