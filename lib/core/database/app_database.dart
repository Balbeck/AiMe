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

class Cigarettes extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get timestamp => dateTime()();
}

@DataClassName('CbdEntry')
class CbdEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get timestamp => dateTime()();
}

@DriftDatabase(tables: [Goals, DayVotes, Cigarettes, CbdEntries])
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
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from < 2) await m.createTable(cigarettes);
          if (from < 3) await m.createTable(cbdEntries);
        },
      );

  // Goals
  Future<List<Goal>> getAllGoals() => (select(goals)
        ..orderBy([(g) => OrderingTerm.desc(g.createdAt)]))
      .get();

  Future<void> upsertGoal(GoalsCompanion goal) =>
      into(goals).insertOnConflictUpdate(goal);

  // Day votes
  Future<DayVoteEntry?> getVoteForDate(String date) =>
      (select(dayVotes)..where((v) => v.date.equals(date))).getSingleOrNull();

  Future<List<DayVoteEntry>> getVotesForDates(List<String> dates) =>
      (select(dayVotes)..where((v) => v.date.isIn(dates))).get();

  Future<void> upsertDayVote(DayVotesCompanion vote) =>
      into(dayVotes).insertOnConflictUpdate(vote);

  Future<Goal?> getNextDeadline() {
    final now = DateTime.now();
    return (select(goals)
          ..where((g) => g.dueDate.isBiggerOrEqualValue(now))
          ..orderBy([(g) => OrderingTerm.asc(g.dueDate)])
          ..limit(1))
        .getSingleOrNull();
  }

  // Cigarettes
  Future<void> addCigarette() => into(cigarettes).insert(
        CigarettesCompanion.insert(timestamp: DateTime.now()),
      );

  Future<List<Cigarette>> getCigarettesForDate(DateTime date) {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return (select(cigarettes)
          ..where((c) => c.timestamp.isBetweenValues(start, end))
          ..orderBy([(c) => OrderingTerm.asc(c.timestamp)]))
        .get();
  }

  // CBD
  Future<void> addCbd() => into(cbdEntries).insert(
        CbdEntriesCompanion.insert(timestamp: DateTime.now()),
      );

  Future<List<CbdEntry>> getCbdForDate(DateTime date) {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return (select(cbdEntries)
          ..where((c) => c.timestamp.isBetweenValues(start, end))
          ..orderBy([(c) => OrderingTerm.asc(c.timestamp)]))
        .get();
  }
}
