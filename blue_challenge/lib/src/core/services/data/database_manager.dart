import 'package:blue_challenge/src/core/failures/failures.dart';
import 'package:blue_challenge/src/core/services/interator/i_database_manager.dart';
import 'package:blue_challenge/src/core/utils/enums/persistence_keys_enum.dart';
import 'package:blue_challenge/src/core/utils/enums/tables_enum.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager implements IDatabaseManager {
  late final Database _db;

  static final DatabaseManager _singleton = DatabaseManager._internal();

  factory DatabaseManager() {
    return _singleton;
  }

  DatabaseManager._internal();

  @override
  Future<void> start() async {
    try {
      final queries = <String>[
        '''
        CREATE TABLE ${TablesEnum.pokemons.table} (
          name VARCHAR(255),
          url VARCHAR(255)
        )
      '''
      ];

      loadDatabase(
        'local_database.db',
        15,
        queries,
      );
    } catch (e) {
      throw LocalFailure(message: e.toString());
    }
  }

  Future<void> _onCreate() async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setBool(PersistenceKeysEnum.databaseCreated.key, true);
  }

  @override
  Future<Database> createDatabase(
      String databaseName, int databaseVersion) async {
    return openDatabase(
      join(
        await getDatabasesPath(),
        databaseName,
      ),
      version: databaseVersion,
    );
  }

  @override
  Future<void> loadDatabase(String databaseName, int databaseVersion,
      List<String> tableQueryList) async {
    final preferences = await SharedPreferences.getInstance();

    final databaseCreated =
        preferences.getBool(PersistenceKeysEnum.databaseCreated.key) ?? false;

    _db = await createDatabase(databaseName, databaseVersion);

    if (!databaseCreated) {
      for (final query in tableQueryList) {
        await _db.execute(query);
      }

      await _onCreate();
    }
  }

  @override
  Future<int> insert(String table, List<Map<String, dynamic>> objects) async {
    try {
      int result = -1;

      for (final object in objects) {
        result = await _db.insert(
          table,
          object,
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      return result;
    } catch (e) {
      throw LocalFailure(message: e.toString());
    }
  }

  @override
  Future<List<Map<String, Object?>>> getAll(
    String table, {
    String? where,
    List? whereArgs,
    String? orderBy,
  }) async {
    return _db.query(
      table,
      where: where,
      whereArgs: whereArgs,
      orderBy: orderBy,
    );
  }

  @override
  Future<int> update(String table, Map<String, Object?> object, id,
      {required String column}) async {
    final database = await _db.update(
      table,
      object,
      where: '$column  = ?',
      whereArgs: [id],
    );

    return database;
  }

  @override
  Future<int> deleteRaw(
    String query,
  ) async {
    return _db.rawDelete(query);
  }

  @override
  Future<int> delete({
    String? id,
    required String table,
    String? column = 'id',
    String? where,
    List? whereArgs,
  }) async {
    return _db.delete(
      table,
      where: where ?? '$column = ?',
      whereArgs: whereArgs ?? [id],
    );
  }
}
