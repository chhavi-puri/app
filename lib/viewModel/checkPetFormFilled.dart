import 'package:dbdummy/model/general_model.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:flutter/material.dart';

 checkPetFormFilled(documentSnapshot, context, MediaQueryy mediaQuery)
{
  if(documentSnapshot.exists)
                        {
                          
                        
                          Navigator.pushNamed(context, Routes().adopterDisplay);  
                        }
                        else if(!documentSnapshot.exists)
                        {
                         
                          Navigator.pushNamed(context, Routes().ownerScreen);  
                        }
                        else
                        {
                           Center(child: CircularProgressIndicator());
                        }
}