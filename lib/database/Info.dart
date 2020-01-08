import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'Info.g.dart';

class SchoolInfos extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get address => text()();
  TextColumn get email => text()();
  TextColumn get phone => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@UseMoor(tables: [SchoolInfos], daos: [SchoolInfoDao])
class MyDB extends _$MyDB {
  MyDB()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'MyDB.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [SchoolInfos])
class SchoolInfoDao extends DatabaseAccessor<MyDB> with _$SchoolInfoDaoMixin {
  final MyDB db;
  SchoolInfoDao(this.db) : super(db);
  Future<int> insert(Insertable<SchoolInfo> schoolInfo) =>
      into(schoolInfos).insert(schoolInfo);
  Future<List<SchoolInfo>> showSchoolInfo() => select(schoolInfos).get();
  Future updateDB(Insertable<SchoolInfo> schoolInfo) =>
      update(schoolInfos).replace(schoolInfo);
}
