import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'admission_db.g.dart';

@DataClassName("Student")
class Students extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey =>{id};
}

@UseMoor(tables:[Students])
class MyDatabase extends _$MyDatabase {
  MyDatabase():super(FlutterQueryExecutor.inDatabaseFolder(path: 'suchi.db'));
  @override
  int get schemaVersion => 1;

  Future<List<Student>> get allData => select(students).get();
  Future<int> addStudent(Student student) => into(students).insert(student);
  
}