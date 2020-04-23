import 'package:dbdummy/database/adopterRegistrationForm.dart';
import 'package:dbdummy/database/currentUID.dart';
import 'package:dbdummy/model/buyer_form.dart';
import 'package:dbdummy/screens/adopter.dart';
import 'package:flutter/material.dart';
String errorMessage;
onPressedSave(BuildContext context, BuyerForm buyerForm)
{
  final formState=kFormKey.currentState;
  if(formState.validate())
  {
    formState.save();
     insertDataFirebase(context, buyerForm);
  }
}
// onPressedA
onPressAdopter(BuildContext context, BuyerForm buyerForm)
{
  if(buyerForm.checkBox2==true)
            {
              getUID().then((_){
                      onPressedSave(context, buyerForm);
            });}
            else{
              print('you need to abide by the tnc');            }
          
}