import 'package:path/path.dart' as p;
import 'package:playground/modal_student.dart';
import 'package:sqflite/sqflite.dart';

final String databasename = "student_db";
final String table_name = "student_table";
final String column_id = "id";
final String column_name = "name";

class DatabaseStudent {
  static Database? _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  static DatabaseStudent? _databaseStudent;

  DatabaseStudent._createInstance();

  factory DatabaseStudent() {
    if (_databaseStudent == null) {
      _databaseStudent = DatabaseStudent._createInstance();
    }
    return _databaseStudent!;
  }

  Future<Database?> initializeDatabase() async {
    try {
      var databasePath = await getDatabasesPath();
      var path = p.join(databasePath, databasename);
      Database database = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) {
        db.execute('''
      create table $table_name (
      $column_id INTEGER PRIMARY KEY,
      $column_name text not null
      )
      ''');
      });
      return database;
    } catch (e) {
      print("DatabaseError ${e.toString()}");
      return null;
    }
  }

  Future<bool> AddStudent(ModalStudent modalStudent) async {
    try {
      Database db = await database;
      var result = await db.insert(table_name, modalStudent.toMap());
      return true;
    } catch (e) {
      print("DatabaseError add function ${e.toString()}");
      return false;
    }
  }

  Future<bool> UpdateStudent(ModalStudent modalStudent) async {
    try {
      Database db = await database;
      var result = await db.update(table_name, modalStudent.toMap(),
          where: "$column_id =?", whereArgs: [modalStudent.id]);
      return true;
    } catch (e) {
      print("DatabaseError update function ${e.toString()}");
      return false;
    }
  }

  Future<bool> DeleteStudentById(String id) async {
    try {
      Database db = await database;
      var result =
          await db.delete(table_name, where: "$column_id =?", whereArgs: [id]);
      return true;
    } catch (e) {
      print("DatabaseError delete by id function ${e.toString()}");
      return false;
    }
  }

  Future<bool> DeleteAllStudent() async {
    try {
      Database db = await database;
      var result = await db.delete(table_name);
      return true;
    } catch (e) {
      print("DatabaseError delete all function ${e.toString()}");
      return false;
    }
  }

  Future<List<ModalStudent>> GetAllStudent() async {
    List<ModalStudent> list_students = [];
    try {
      Database db = await database;
      List<Map<String, dynamic>> result =
          await db.query(table_name, orderBy: "$column_id DESC");
      if (result.isNotEmpty) {
        for (int i = 0; i < result.length; i++) {
          ModalStudent modalStudent =
              ModalStudent.ModalObjectFromMap(result[i]);
          list_students.add(modalStudent);
        }
      }
      List.generate(length, (index) => null)

      return list_students;
    } catch (e) {
      print("DatabaseError delete all function ${e.toString()}");
      return list_students;
    }
  }

  Future<int> GetCountStudent() async {
    try {
      Database db = await database;
      List<Map<String, dynamic>> result =
          await db.query(table_name, orderBy: "$column_id DESC");
      return result.length;
    } catch (e) {
      print("DatabaseError getcount  ${e.toString()}");
      return 0;
    }
  }
}
