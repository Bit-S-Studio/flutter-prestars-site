// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:universal_io/io.dart';

// import '../../../../prestars_exports.dart';

// class DatabaseService {
// // torna esta classe singleton
//   DatabaseService._privateConstructor();
//   static final DatabaseService instance = DatabaseService._privateConstructor();
//   // tem somente uma referência ao banco de dados
//   static Database? _database;

//   Future<Database> get database async {
//     if (_database != null) {
//       return _database!;
//     }
//     // instancia o db na primeira vez que for acessado
//     return await _initDatabase();
//   }

//   // abre o banco de dados e o cria se ele não existir
//   static Future<Database> _initDatabase() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(
//         documentsDirectory.path, DatabaseHelperEnum.getValue(DATABASE.name));
//     return await openDatabase(path,
//         version: DatabaseHelperEnum.getValue(DATABASE.version),
//         onCreate: _onCreate,
//         onConfigure: _onConfigure);
//   }

//   static Future _onConfigure(Database db) async {
//     await db.execute('PRAGMA foreign_keys = ON');
//     debugPrint('Foreign keys turned on');
//   }

//   // Código SQL para criar o banco de dados e a tabela
//   static Future _onCreate(Database db, int version) async {
//     var sql = [
//       '''CREATE TABLE user(
//           id TEXT PRIMARY KEY,
//           email TEXT,
//           user_alias TEXT,
//           name TEXT,
//           phone TEXT,
//           status TEXT,
//           country_calling_code TEXT,  
//           meta_id TEXT,
//           google_id TEXT,
//           profile_picture TEXT,
//           email_privacy TEXT,
//           added_privacy TEXT,
//           phone_privacy TEXT,
//           search_privacy TEXT,
//           locked INTEGER,
//           privacy INTEGER 
//         )'''
//     ];

//     for (var i = 0; i < sql.length; i++) {
//       debugPrint("execute sql : ${sql[i]}");
//       await db.execute(sql[i]).catchError((onError) => debugPrint(onError));
//     }
//   }
// }
