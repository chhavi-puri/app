import 'package:dbdummy/components/appbar.dart';
import 'package:dbdummy/database/firebasestore.dart';
import 'package:dbdummy/model/sqflite_model.dart';
import 'package:flutter/material.dart';
Pet pet;
class BuyerSqflite extends StatefulWidget {
  @override
  BuyerSqfliteState createState() => BuyerSqfliteState();
}
class BuyerSqfliteState extends State<BuyerSqflite> {
  List<Pet> petList;
  void initState() {
    firebasedatatosqflite();
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: func('Available Pets'),
      body: FutureBuilder(
          future: dbPet.getPetList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              petList = snapshot.data;
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: petList.length,
                  itemBuilder: (BuildContext context, int index) {
                    Pet pet = petList[index];
                    return Card(
                      child: ListTile(
                        title: Text('Name: ${pet.getName}'),
                        subtitle:
                            Text('Age: ${pet.getAge}\nBreed: ${pet.getBreed} '),
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
