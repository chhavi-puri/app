import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/components/appbar.dart';
import 'package:dbdummy/database/currentUID.dart';
import 'package:dbdummy/database/sharedpreference.dart';
import 'package:dbdummy/model/general_model.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:dbdummy/services/siginwithgoogle.dart';
import 'package:dbdummy/utils/color_services.dart';
import 'package:dbdummy/utils/string_services.dart';
import 'package:dbdummy/viewModel/checkFormFilled.dart';
import 'package:dbdummy/viewModel/checkPetFormFilled.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
MediaQueryy mediaQuery= MediaQueryy();
DocumentSnapshot documentSnapshotAdopter;
DocumentSnapshot documentSnapshotOwner;
class _HomeScreenState extends State<HomeScreen> {
  String ksharedemail = '';
  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    getPreference().then(updateName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQuery.width= MediaQuery.of(context).size.width;
   mediaQuery.height= MediaQuery.of(context).size.height; 
    return Scaffold(
        appBar: func('PawSome!'),
        drawer: Drawer(
            child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: null,
              accountEmail: Text(ksharedemail),
              decoration: BoxDecoration(
                color: secondcolor,
              ),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person),
                backgroundColor: firstcolor,
              ),
              margin: EdgeInsets.only(bottom: 10),
            ),
            Card(
                child: ListTile(
                    leading: Icon(Icons.account_circle, color: firstcolor),
                    title: Text('My Account'),
                    onTap: () {
                      Navigator.pushNamed(context, Routes().accountScreen);
                    })),
            Card(
                child: ListTile(
                    leading:
                        Icon(Icons.perm_contact_calendar, color: firstcolor),
                    title: Text('About us'),
                    onTap: () {
                      Navigator.pushNamed(context, Routes().aboutUsScreen);
                    })),
            Card(
                child: ListTile(
                    leading: Icon(Icons.power_settings_new, color: firstcolor),
                    title: Text('Log Out'),
                    onTap: () {
                      signOutGoogle();
                      Navigator.pushNamed(context, Routes().splashScreen);
                    }))
          ],
        )),
         body: Container(
          child: Column(children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                  height: mediaQuery.height*.4,
                  width: mediaQuery.width,
                  child: Material(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(7),
                      bottomRight: Radius.circular(7),
                    )),
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Carousel(
                              images: [
                                AssetImage("assets/images/carosel1.jpg"),
                                AssetImage("assets/images/carosel2.jpg"),
                                AssetImage("assets/images/carosel3.jpg"),
                                AssetImage("assets/images/carousel4.jpeg"),
                                AssetImage("assets/images/carosel5.jpg"),
                              ],
                              autoplayDuration: Duration(
                                seconds: 3,
                              ),
                              animationDuration: Duration(
                                milliseconds: 800,
                              ),
                              dotSize: 4.0,
                              ))),
                  )),
            ),
            
            Container(
            height: mediaQuery.height*.075,
            width: mediaQuery.width,
            child: Center(
                child: Text(
              ' Choose your service.',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 20,
                fontFamily: 'Florsn',
              ),
            )),
          ),
           GestureDetector(
            onTap: () {
              getUID();
                getDetails('AcceptorDetails').then((result){
               documentSnapshotAdopter=result;
                });
              checkFormFilled(documentSnapshotAdopter,context);
               },
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                    child: Container(
                    margin: EdgeInsets.only(left: mediaQuery.width*.03),
                    height: mediaQuery.height*.1,
                    width: mediaQuery.width*.7,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          card1,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: mediaQuery.width*.03),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                          text: 'For Adoption',
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Florsn',
                          )),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  height: mediaQuery.height*.1,
                  width: mediaQuery.width*.7,
                  color: Colors.green.withOpacity(0.6),
                ),
              ],
            ),
          ),
          

 GestureDetector(
            onTap: () {
             getUID();
                getDetails('PetDetails').then((result){
               documentSnapshotOwner=result;
                });
                checkPetFormFilled(documentSnapshotOwner, context, mediaQuery);
            },
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                   child: Container(
                     margin: EdgeInsets.only(top:mediaQuery.height*.04, right: mediaQuery.width*.03),
                   height: mediaQuery.height*.1,
                  width: mediaQuery.width*.7,
                   decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          card2,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                   child: Container(
                      margin: EdgeInsets.only(top:mediaQuery.height*.04, right: mediaQuery.width*.03),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: RichText(
                        text: TextSpan(
                            text: 'For Shelter',
                            style: TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Florsn',
                            )),
                        // textAlign: TextAlign.right,
                      ),
                    ),
                      height: mediaQuery.height*.1,
                    width: mediaQuery.width*.7,
                    color: Colors.pink.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          
          
            Expanded(
                flex: 2,
                child: Container(
                  width: mediaQuery.width*.8,
                  height: mediaQuery.height*.1,
                  
                    margin: EdgeInsets.only(top: 60),
                    child: Text('Don\'t shop, Adopt!',
                        style: TextStyle(
                          fontSize: 40,
                          color: secondcolor,
                          fontStyle: FontStyle.italic,
                         
                        )))),
            
          ]),
        ),
    );
  }

//update name for shared preferences
  void updateName(String email) {
    setState(() {
      this.ksharedemail = email;
    });
  }
}
