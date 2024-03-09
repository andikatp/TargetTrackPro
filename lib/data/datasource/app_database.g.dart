// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ProductTargetDao? _productTargetDaoInstance;

  BusinessTargetDao? _businessTargetDaoInstance;

  MarketingTargetDao? _marketingTargetDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `target` (`id` TEXT NOT NULL, `name` TEXT NOT NULL, `category` INTEGER NOT NULL, `weight` INTEGER NOT NULL, `status` INTEGER NOT NULL, `type` INTEGER NOT NULL, `startDate` INTEGER NOT NULL, `endDate` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ProductTargetDao get productTargetDao {
    return _productTargetDaoInstance ??=
        _$ProductTargetDao(database, changeListener);
  }

  @override
  BusinessTargetDao get businessTargetDao {
    return _businessTargetDaoInstance ??=
        _$BusinessTargetDao(database, changeListener);
  }

  @override
  MarketingTargetDao get marketingTargetDao {
    return _marketingTargetDaoInstance ??=
        _$MarketingTargetDao(database, changeListener);
  }
}

class _$ProductTargetDao extends ProductTargetDao {
  _$ProductTargetDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _targetModelInsertionAdapter = InsertionAdapter(
            database,
            'target',
            (TargetModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'category': item.category.index,
                  'weight': item.weight,
                  'status': item.status.index,
                  'type': item.type.index,
                  'startDate': _dateTimeConverter.encode(item.startDate),
                  'endDate': _dateTimeConverter.encode(item.endDate)
                }),
        _targetModelUpdateAdapter = UpdateAdapter(
            database,
            'target',
            ['id'],
            (TargetModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'category': item.category.index,
                  'weight': item.weight,
                  'status': item.status.index,
                  'type': item.type.index,
                  'startDate': _dateTimeConverter.encode(item.startDate),
                  'endDate': _dateTimeConverter.encode(item.endDate)
                }),
        _targetModelDeletionAdapter = DeletionAdapter(
            database,
            'target',
            ['id'],
            (TargetModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'category': item.category.index,
                  'weight': item.weight,
                  'status': item.status.index,
                  'type': item.type.index,
                  'startDate': _dateTimeConverter.encode(item.startDate),
                  'endDate': _dateTimeConverter.encode(item.endDate)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TargetModel> _targetModelInsertionAdapter;

  final UpdateAdapter<TargetModel> _targetModelUpdateAdapter;

  final DeletionAdapter<TargetModel> _targetModelDeletionAdapter;

  @override
  Future<List<TargetModel>> getProductTargets() async {
    return _queryAdapter.queryList('SELECT * FROM target WHERE type = 0',
        mapper: (Map<String, Object?> row) => TargetModel(
            id: row['id'] as String,
            name: row['name'] as String,
            category: Category.values[row['category'] as int],
            weight: row['weight'] as int,
            status: Status.values[row['status'] as int],
            type: TargetType.values[row['type'] as int],
            startDate: _dateTimeConverter.decode(row['startDate'] as int),
            endDate: _dateTimeConverter.decode(row['endDate'] as int)));
  }

  @override
  Future<void> saveProductTarget(TargetModel target) async {
    await _targetModelInsertionAdapter.insert(target, OnConflictStrategy.abort);
  }

  @override
  Future<void> editProductTarget(TargetModel target) async {
    await _targetModelUpdateAdapter.update(target, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteProductTarget(TargetModel target) async {
    await _targetModelDeletionAdapter.delete(target);
  }
}

class _$BusinessTargetDao extends BusinessTargetDao {
  _$BusinessTargetDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _targetModelInsertionAdapter = InsertionAdapter(
            database,
            'target',
            (TargetModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'category': item.category.index,
                  'weight': item.weight,
                  'status': item.status.index,
                  'type': item.type.index,
                  'startDate': _dateTimeConverter.encode(item.startDate),
                  'endDate': _dateTimeConverter.encode(item.endDate)
                }),
        _targetModelUpdateAdapter = UpdateAdapter(
            database,
            'target',
            ['id'],
            (TargetModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'category': item.category.index,
                  'weight': item.weight,
                  'status': item.status.index,
                  'type': item.type.index,
                  'startDate': _dateTimeConverter.encode(item.startDate),
                  'endDate': _dateTimeConverter.encode(item.endDate)
                }),
        _targetModelDeletionAdapter = DeletionAdapter(
            database,
            'target',
            ['id'],
            (TargetModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'category': item.category.index,
                  'weight': item.weight,
                  'status': item.status.index,
                  'type': item.type.index,
                  'startDate': _dateTimeConverter.encode(item.startDate),
                  'endDate': _dateTimeConverter.encode(item.endDate)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TargetModel> _targetModelInsertionAdapter;

  final UpdateAdapter<TargetModel> _targetModelUpdateAdapter;

  final DeletionAdapter<TargetModel> _targetModelDeletionAdapter;

  @override
  Future<List<TargetModel>> getBusinessTargets() async {
    return _queryAdapter.queryList('SELECT * FROM target WHERE type = 1',
        mapper: (Map<String, Object?> row) => TargetModel(
            id: row['id'] as String,
            name: row['name'] as String,
            category: Category.values[row['category'] as int],
            weight: row['weight'] as int,
            status: Status.values[row['status'] as int],
            type: TargetType.values[row['type'] as int],
            startDate: _dateTimeConverter.decode(row['startDate'] as int),
            endDate: _dateTimeConverter.decode(row['endDate'] as int)));
  }

  @override
  Future<void> saveBusinessTarget(TargetModel target) async {
    await _targetModelInsertionAdapter.insert(target, OnConflictStrategy.abort);
  }

  @override
  Future<void> editBusinessTarget(TargetModel target) async {
    await _targetModelUpdateAdapter.update(target, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteBusinessTarget(TargetModel target) async {
    await _targetModelDeletionAdapter.delete(target);
  }
}

class _$MarketingTargetDao extends MarketingTargetDao {
  _$MarketingTargetDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _targetModelInsertionAdapter = InsertionAdapter(
            database,
            'target',
            (TargetModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'category': item.category.index,
                  'weight': item.weight,
                  'status': item.status.index,
                  'type': item.type.index,
                  'startDate': _dateTimeConverter.encode(item.startDate),
                  'endDate': _dateTimeConverter.encode(item.endDate)
                }),
        _targetModelUpdateAdapter = UpdateAdapter(
            database,
            'target',
            ['id'],
            (TargetModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'category': item.category.index,
                  'weight': item.weight,
                  'status': item.status.index,
                  'type': item.type.index,
                  'startDate': _dateTimeConverter.encode(item.startDate),
                  'endDate': _dateTimeConverter.encode(item.endDate)
                }),
        _targetModelDeletionAdapter = DeletionAdapter(
            database,
            'target',
            ['id'],
            (TargetModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'category': item.category.index,
                  'weight': item.weight,
                  'status': item.status.index,
                  'type': item.type.index,
                  'startDate': _dateTimeConverter.encode(item.startDate),
                  'endDate': _dateTimeConverter.encode(item.endDate)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TargetModel> _targetModelInsertionAdapter;

  final UpdateAdapter<TargetModel> _targetModelUpdateAdapter;

  final DeletionAdapter<TargetModel> _targetModelDeletionAdapter;

  @override
  Future<List<TargetModel>> getMarketingTargets() async {
    return _queryAdapter.queryList('SELECT * FROM target WHERE type = 2',

        mapper: (Map<String, Object?> row) => TargetModel(
            id: row['id'] as String,
            name: row['name'] as String,
            category: Category.values[row['category'] as int],
            weight: row['weight'] as int,
            status: Status.values[row['status'] as int],
            type: TargetType.values[row['type'] as int],
            startDate: _dateTimeConverter.decode(row['startDate'] as int),
            endDate: _dateTimeConverter.decode(row['endDate'] as int)));
  }

  @override
  Future<void> saveMarketingTarget(TargetModel target) async {
    await _targetModelInsertionAdapter.insert(target, OnConflictStrategy.abort);
  }

  @override
  Future<void> editMarketingTarget(TargetModel target) async {
    await _targetModelUpdateAdapter.update(target, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteMarketingTarget(TargetModel target) async {
    await _targetModelDeletionAdapter.delete(target);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
