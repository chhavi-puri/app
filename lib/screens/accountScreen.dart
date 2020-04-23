import 'package:dbdummy/components/appbar_decoration.dart';
import 'package:dbdummy/database/getAccountDetails.dart';
import 'package:dbdummy/model/accountscreenmodel.dart';
import 'package:dbdummy/utils/color_services.dart';
import 'package:dbdummy/viewModel/accountScreen.dart';
import 'package:dbdummy/viewModel/accountdetails.dart';
import 'package:flutter/material.dart';

final kaccountKey = GlobalKey<FormState>();

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  var dataFirebase = new List();
  AccountScreenModel accountScreenModel = AccountScreenModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          leading: GestureDetector(
            child: Icon(Icons.close, color: splashcolor),
            onTap: () => Navigator.pop(context),
          ),
          title: Text(
            'Edit Profile',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          flexibleSpace: Container(
            decoration: boxDecoration,
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: firstcolor,
            child:
                accountScreenModel.icon ? Icon(Icons.save) : Icon(Icons.edit),
            onPressed: () {
              setState(() {
                accountScreenModel.icon = !accountScreenModel.icon;
                accountScreenModel.enabletextfield =
                    !accountScreenModel.enabletextfield;
                if (accountScreenModel.enabletextfield == true) {
                  onPressedAccountScreen(accountScreenModel, context);
                }
              });
            }),
        body: FutureBuilder(
            future: getInformation(dataFirebase, context),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              List<dynamic> data = dataFirebase;
              if (snapshot.hasData) {
                accountScreenModel.name = data[0];
                accountScreenModel.phone = data[1];
                assignVales(accountScreenModel);
                return Form(
                    key: kaccountKey,
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
                        ),
                        CircleAvatar(
                          backgroundColor: firstcolor,
                          child: Icon(
                            Icons.person,
                            size: 80,
                          ),
                          radius: 100,
                        ),
                        TextField(
                          controller: accountScreenModel.editName,
                          enabled: accountScreenModel.enabletextfield,
                          onEditingComplete: () {
                            setState(() {
                              accountScreenModel.validateName = true;
                            });
                          },
                          onChanged: ((value) {
                            setState(() {
                              accountScreenModel.editName.text = value;
                            });
                          }),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              size: 20.0,
                              color: firstcolor,
                            ),
                            labelText: 'Name',
                          ),
                          // controller: email,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
                        ),
                        TextField(
                          controller: accountScreenModel.editPhone,
                          enabled: accountScreenModel.enabletextfield,
                          onEditingComplete: () {
                            setState(() {
                              accountScreenModel.validatePhone = true;
                              accountScreenModel.enabletextfield =
                                  !accountScreenModel.enabletextfield;
                            });
                          },
                          onChanged: ((value) {
                            setState(() {
                              accountScreenModel.editPhone.text = value;
                            });
                          }),
                          decoration: InputDecoration(
                            //  enabledBorder: outlineTextFiled,
                            prefixIcon: Icon(
                              Icons.phone,
                              size: 20.0,
                              color: firstcolor,
                            ),
                            labelText: 'Phone Number',
                          ),
                          // controller: email,
                        ),
                      ],
                    ));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
