import 'package:dbdummy/routes/routes.dart';
import 'package:flutter/material.dart';

 checkFormFilled(documentSnapshot, context)
{
  if(documentSnapshot.exists)
                        {
                          print('exist');
                          Navigator.pushNamed(context, Routes().petDisplay);      
                        }
                        else if(!documentSnapshot.exists)
                        {
                          print('not exist');
                          Navigator.pushNamed(context, Routes().acceptorScreen);  
                        }
                        else
                        {
                           CircularProgressIndicator();
                        }
}