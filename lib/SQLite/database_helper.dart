
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../JSON/welcome.dart';


class DatabaseHelper{
  final databaseName = "auth.db";

  //Tables

  //Don't put a comma at the end of a column in sqlite

  String user = '''
   CREATE TABLE users (
   userI INTEGER PRIMARY KEY AUTOINCREMENT,
   fullName TEXT,
   email TEXT,
   userNAme TEXT UNIQUE,
   password TEXT
   )
   ''';

  //Our connection is ready
  Future<Database> initDB ()async{
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path,version: 1 , onCreate: (db,version)async{
      await db.execute(user);
    });
  }

  //Function methods

  //Authentication
  Future<bool> authenticate(Welcome usr)async{
    final Database db = await initDB();
    var result = await db.rawQuery("select * from users where userNAme = '${usr.userNAme}' AND password = '${usr.password}' ");
    if(result.isNotEmpty){
      return true;
    }else{
      return false;
    }
  }

  //Sign up
  Future<int> createUser(Welcome usr)async{
    final Database db = await initDB();
    return db.insert("users", usr.toJson());
  }


  //Get current User details
  Future<Welcome?> getUser(String userNAme)async{
    final Database db = await initDB();
    var res = await db.query("users",where: "userNAme = ?", whereArgs: [userNAme]);
    return res.isNotEmpty? Welcome.fromJson(res.first):null;
  }




}