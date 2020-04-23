import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/components/appbar.dart';
import 'package:dbdummy/database/fetchPetDetails.dart';
import 'package:dbdummy/model/buyer_form.dart';
import 'package:dbdummy/model/general_model.dart';
import 'package:dbdummy/screens/chatScreen.dart';
import 'package:dbdummy/utils/color_services.dart';
import 'package:dbdummy/viewModel/adopterDisplay.dart';
import 'package:dbdummy/viewModel/firebaseerrors.dart';
import 'package:flutter/material.dart';
class AdoptersDisplay extends StatefulWidget {
  AdoptersDisplay(MediaQueryy mediaQuery);
  @override
  _AdoptersDisplayState createState() => _AdoptersDisplayState();
}
BuyerForm buyerForm= BuyerForm();
class _AdoptersDisplayState extends State<AdoptersDisplay> {
  
    
 QuerySnapshot querySnapshot;
 DocumentSnapshot query;
 String workStatus, temp, numberofpets, uids;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: func('Interested Adopters'),
  
      body: adopterDisplay(),
    );
  }
 Widget adopterDisplay()
  {
    try{
      getPetInformation('AcceptorDetails').then((result){
      setState(() {
         querySnapshot=result;
      });
    });

    }catch(error)
    {
      catchFirebaseErrors(context, error);
    }
    
    if(querySnapshot!=null)
    {
      return GridView.builder(
        padding: EdgeInsets.all(20),
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          crossAxisCount: 2),
         itemCount: querySnapshot.documents.length,
        itemBuilder: (BuildContext context,index)
        {
           workStatus= querySnapshot.documents[index].data['workType'];
           temp=checkWorkStatus(workStatus);
           
           numberofpets=querySnapshot.documents[index].data['numberOfPets'];
           numberofpets=checkNumberofPets(numberofpets);
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: Container(
                  margin:  EdgeInsets.only(left: 12.0,),
                  child: Text('Age: ${querySnapshot.documents[index].data['userAge']}', 
                  style: TextStyle(color: firstcolor,fontSize: 15),),
                ),
              ),
              Expanded(
                 child: Container(
                   margin:  EdgeInsets.only(left: 12.0,),
                  child: Text('${querySnapshot.documents[index].data['userOccupation']}', 
                  style: TextStyle(color: firstcolor,fontSize: 15),),
                ),
              ),
              Expanded(
                    child: Container(
                   margin:  EdgeInsets.only(left: 12.0,),
                  child: Text(temp, style: TextStyle(
                    fontSize: 15,
                    color: firstcolor),),
                ),
              ),
              Expanded(
                 child: Container(
                   margin:  EdgeInsets.only(left: 12.0,),
                  child: Text(numberofpets, 
                  style: TextStyle(color: firstcolor,fontSize: 15),),
                ),
              ),
               Expanded(
                   child: Container(
                   margin:  EdgeInsets.only(left: 12.0,),
                  child: Text('Family Members: ${querySnapshot.documents[index].data['userFamilyMembers']}', 
                  style: TextStyle(color: firstcolor,fontSize: 15),),
              ),
               ),
              Expanded(
                       child: GestureDetector(
                     child: Container(
                   margin:  EdgeInsets.only(left: 12.0, ),
                  child: Text('Chat with him', 
                  style: TextStyle(color: firstcolor,fontSize: 15),),
              ),
              onTap: (){
                uids=querySnapshot.documents[index].data['UID'];
                getDetailsAdopter(uids).then((result){
                  setState(() {
                    query=result;
                  });
                  if(query!=null)
                  {
                   Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(
                                chatWithUid: query.data['uid'], chatWithName:query.data['name']),
                          ));
                  }
                  else
                  {
                    print('query not null');
                  }
                });

              },
                                ),
               ),
            ],
            ),
           );
        }, 
      );
      }
    
    else
    {
      return Center(child: CircularProgressIndicator());
    }
  }
}