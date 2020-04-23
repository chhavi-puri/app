import 'package:cloud_firestore/cloud_firestore.dart';

getPetInformation(colllection) async{
    return await Firestore.instance.collection(colllection).getDocuments(); 
  }
  getDetailsOwner( buyerModel) async {
      print('current uid  is ${buyerModel.petUID}');
      return await Firestore.instance.collection('users').document(buyerModel.petUID).get();
    }
    getDetailsAdopter( temp) async {
     
      return await Firestore.instance.collection('users').document(temp).get();
    }