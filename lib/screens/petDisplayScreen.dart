import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/components/appbar.dart';
import 'package:dbdummy/database/fetchPetDetails.dart';
import 'package:dbdummy/model/buyer_model.dart';
import 'package:dbdummy/model/general_model.dart';
import 'package:dbdummy/model/petDisplayModel.dart';
import 'package:dbdummy/model/sqflite_model.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:dbdummy/screens/homescreen.dart';
import 'package:dbdummy/utils/color_services.dart';
import 'package:dbdummy/viewModel/firebaseerrors.dart';
import 'package:flutter/material.dart';
class PetDisplay extends StatefulWidget {
  PetDisplay (MediaQueryy mediaQuery);
  @override
  PetDisplayState createState() => PetDisplayState();
}
BuyerModel buyerModel=BuyerModel();
class PetDisplayState extends State<PetDisplay> {
  DocumentReference ref;
  int i;
PetDisplayModel petDisplayModel= PetDisplayModel();
  List<Pet> petList;
  Pet pet;
  int length;
  QuerySnapshot querySnapshot;
  
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Colors.white,
      appBar: func('Pets Available'),
      body:
      firebaseData(),
    );
  }
   
  Widget firebaseData(){
    try
    {
        getPetInformation('PetDetails').then((results){
       setState(() {
          querySnapshot=results;
       });
      });
    }catch(e)
    {
      catchFirebaseErrors(context, e);
    }
     


      if(querySnapshot!=null)
    {
      return GridView.builder(
        padding: EdgeInsets.all(20),
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 20,
          crossAxisCount: 1),
       itemCount: querySnapshot.documents.length,
       itemBuilder: ((BuildContext context,index){
         
          return Card(
            elevation: 15.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: mediaQuery.width*.8,
              decoration: BoxDecoration(
                border:Border.all(
                  width: 8,
                  color: splashcolor,
                  ),
                  borderRadius: BorderRadius.circular(12),
                 ),
           child: Stack(
           children: <Widget>[
              Image.network(querySnapshot.documents[index].data['ImageUrl'], width: mediaQuery.width, fit: BoxFit.fill),
              Positioned(
                left:0.0,
                bottom:0.0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('  ${querySnapshot.documents[index].data['petName']}',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  color: Colors.white)),
                ),
              ),
              Positioned(
                 right:0.0,
                 bottom:0.0,
                 child: Row(
                   children: <Widget>[
                     GestureDetector(
                       child: Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Text('View Profile',style: TextStyle(
                         fontWeight: FontWeight.bold,
                        color: Colors.white)),
                       ),
                       onTap:(){
              imagEURL=querySnapshot.documents[index].data['ImageUrl'];
              buyerModel.imageURL=querySnapshot.documents[index].data['ImageUrl'];
              buyerModel.petAge=querySnapshot.documents[index].data['petAge'];
              buyerModel.petName =querySnapshot.documents[index].data['petName'];
              buyerModel.petGender=querySnapshot.documents[index].data['petGender'];
              buyerModel.petBreed=querySnapshot.documents[index].data['petBreed'];
              buyerModel.petDescription=querySnapshot.documents[index].data['petDescription'];
              buyerModel.petUID=querySnapshot.documents[index].data['uid'];
               Navigator.pushNamed(context, Routes().confirmationScreen); 
            },
                ),
                     Icon(Icons.arrow_right, color: Colors.white),
                   ],
                 ),
               ),
           ]
            ),
          ),
          );
      
       }
       ),
       );
     }
    else{
       return Center(child: CircularProgressIndicator());
    }
  }
  Widget sqfliteData(){
    return null;
  }
}
