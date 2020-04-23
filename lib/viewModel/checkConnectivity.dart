import 'package:connectivity/connectivity.dart';
import 'package:dbdummy/model/connectivity.dart';
import 'package:dbdummy/model/general_model.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:flutter/material.dart';
 showPetInformation(BuildContext context, MediaQueryy mediaQuery)  
{ 
  checkConnectivity().then((connectivityResult){

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult== ConnectivityResult.wifi) {
      print("Connected");
       Navigator.pushNamed(context, Routes().petDisplay);     
    } 
     else {
      print("Not connected");
      Navigator.pushNamed(context, Routes().buyerSq);     
    
    }

  });
    
  }