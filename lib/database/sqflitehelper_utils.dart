import 'package:dbdummy/model/sqflite_model.dart';
// import 'package:dbdummy/services/firebasestore.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DbPet {
  Pet pet;
  Future openDb() async {
    if (database == null) {
      print('hello');
      database = await openDatabase(join(await getDatabasesPath(), "MyApp.db"),
          version: 1, onCreate: (Database db, int version) async {
        await db.execute(
            " CREATE TABLE pet( petName TEXT,uid TEXT PRIMARY KEY, petAge TEXT, petBreed TEXT, petDescription TEXT)");
        print('created table');
      });
    }
    // else {
    //   await database.query("DROP TABLE [ IF EXISTS ] pet");
    //   print('table is deleted');
    // }
  }

//insertion in sqflite
  Future<void> insertPet(Map<String, dynamic> data) async {
    await openDb();
    return await database.insert(
      'pet',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

//retrieve from sqflite

  Future<List<Pet>> getPetList() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await database.query('pet');
    return List.generate(maps.length, (i) {
      return Pet(
        petName: maps[i]['petName'],
        uid: maps[i]['uid'],
        petAge: maps[i]['petAge'],
        petBreed: maps[i]['petBreed'],
        petDescription: maps[i]['petDescription'],
      );
    });
  }

//close database
  Future close() async => database.close();
}
