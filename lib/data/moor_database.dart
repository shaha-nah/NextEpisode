import 'package:moor/moor.dart';
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'moor_database.g.dart';

class Shows extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  IntColumn get season => integer().nullable()();
  IntColumn get episode => integer().nullable()();
  TextColumn get type => text().withLength(min: 1, max: 30).nullable()();
  TextColumn get genre => text().withLength(min: 1, max: 50).nullable()();
  DateTimeColumn get releaseDate => dateTime().nullable()();
  IntColumn get day => integer().nullable()();
  BoolColumn get completed => boolean().withDefault(Constant(false))();
  BoolColumn get binge => boolean().withDefault(Constant(false)).nullable()();
  TextColumn get onBreak => text().withLength(min: 1, max: 50).nullable()();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Shows])
// _$AppDatabase is the name of the generated class
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  Future<List<Show>> getAllShows() => select(shows).get();
  Stream<List<Show>> watchAllShows() => select(shows).watch();

  Future insertShow(Show show) => into(shows).insert(show);

  Future updateShow(Show show) => update(shows).replace(show);

  Future deleteShow(Show show) => delete(shows).delete(show);
}
