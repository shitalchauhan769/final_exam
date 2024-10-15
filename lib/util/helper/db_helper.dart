import 'package:final_exam/screen/home/model/db_model.dart';
import 'package:final_exam/screen/home/model/home_model.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper
{
  static DbHelper dbHelper=DbHelper._();
  DbHelper._();
  Database? database;

  Future<Database?> checkDb()
  async {
     database ??= await initDb();
     return database;
  }

  Future<Database> initDb() async {
      String folder = await getDatabasesPath();
      String path ="$folder/demo.db";
      return openDatabase(
        path,
        version: 1,
        onCreate: (db, version) {
          String q1 =
              "CREATE TABLE Recipe (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,recipe TEXT)";
          db.execute(q1);
        },
      );
  }

  Future<void> insertDb(DBModel model) async {
    database =await initDb();
    database!.insert("Recipe", {"name":model.name,"recipe":model.recipe,});
  }

  Future<List<DBModel>> redDb() async {
    database =await initDb();
    String q1="SELECT *  FRom  Recipe";
    List<Map> l1=await database!.rawQuery(q1);
    List<DBModel> d1=l1.map((e) => DBModel.mapToModel(e),).toList();
    return d1;
  }

  void deleteDb({int? id})
  {
    database!.delete("Recipe",where: "id=?",whereArgs: [id]);
  }


}

