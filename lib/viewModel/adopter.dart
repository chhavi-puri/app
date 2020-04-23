import 'package:dbdummy/model/buyer_form.dart';
enable(BuyerForm buyerForm)
{
  if(buyerForm.numberofPets=='yes')
                               {
                                 buyerForm.enableField=true;
                               }
                               else{
                                 buyerForm.enableField=false;
                               }
}