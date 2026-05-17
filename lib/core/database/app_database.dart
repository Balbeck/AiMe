import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

class Goals extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  DateTimeColumn get dueDate => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get modifiedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('DayVoteEntry')
class DayVotes extends Table {
  TextColumn get date => text()(); // YYYY-MM-DD
  TextColumn get vote => text()(); // DayVote.name

  @override
  Set<Column> get primaryKey => {date};
}

@DriftDatabase(tables: [Goals, DayVotes])
class AppDatabase extends _$AppDatabase {
  AppDatabase._()
      : super(driftDatabase(
          name: 'aime_db',
          web: DriftWebOptions(
            sqlite3Wasm: Uri.parse('sqlite3.wasm'),
            driftWorker: Uri.parse('drift_worker.js'),
          ),
        ));

  static final AppDatabase instance = AppDatabase._();

  @override
  int get schemaVersion => 1;

  Future<List<Goal>> getAllGoals() => (select(goals)
        ..orderBy([(g) => OrderingTerm.desc(g.createdAt)]))
      .get();

  Future<void> upsertGoal(GoalsCompanion goal) =>
      into(goals).insertOnConflictUpdate(goal);

  Future<DayVoteEntry?> getVoteForDate(String date) =>
      (select(dayVotes)..where((v) => v.date.equals(date))).getSingleOrNull();

  Future<void> upsertDayVote(DayVotesCompanion vote) =>
      into(dayVotes).insertOnConflictUpdate(vote);
}
