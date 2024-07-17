import 'package:sqflite/sqlite_api.dart';

abstract class IDatabaseManager {
  Future<void> start();

  Future<Database> createDatabase(
    String databaseName,
    int databaseVersion,
  );

  Future<void> loadDatabase(
    String databaseName,
    int databaseVersion,
    List<String> tableQueryList,
  );

  Future<int> insert(String table, List<Map<String, dynamic>> objects);

  Future<List<Map<String, Object?>>> getAll(
    String table, {
    String? where,
    List<dynamic>? whereArgs,
    String? orderBy,
  });

  Future<int> update(String table, Map<String, Object?> object, dynamic id,
      {required String column});

  Future<int> delete({
    String? id,
    required String table,
    String? column = 'id',
    String? where,
    List? whereArgs,
  });

  Future<int> deleteRaw(String query);
}
