// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $GoalsTable extends Goals with TableInfo<$GoalsTable, Goal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
    'due_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modifiedAtMeta = const VerificationMeta(
    'modifiedAt',
  );
  @override
  late final GeneratedColumn<DateTime> modifiedAt = GeneratedColumn<DateTime>(
    'modified_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    dueDate,
    createdAt,
    modifiedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goals';
  @override
  VerificationContext validateIntegrity(
    Insertable<Goal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('modified_at')) {
      context.handle(
        _modifiedAtMeta,
        modifiedAt.isAcceptableOrUnknown(data['modified_at']!, _modifiedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Goal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Goal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      modifiedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}modified_at'],
      ),
    );
  }

  @override
  $GoalsTable createAlias(String alias) {
    return $GoalsTable(attachedDatabase, alias);
  }
}

class Goal extends DataClass implements Insertable<Goal> {
  final String id;
  final String title;
  final String description;
  final DateTime? dueDate;
  final DateTime createdAt;
  final DateTime? modifiedAt;
  const Goal({
    required this.id,
    required this.title,
    required this.description,
    this.dueDate,
    required this.createdAt,
    this.modifiedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || modifiedAt != null) {
      map['modified_at'] = Variable<DateTime>(modifiedAt);
    }
    return map;
  }

  GoalsCompanion toCompanion(bool nullToAbsent) {
    return GoalsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      createdAt: Value(createdAt),
      modifiedAt: modifiedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedAt),
    );
  }

  factory Goal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Goal(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      modifiedAt: serializer.fromJson<DateTime?>(json['modifiedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'modifiedAt': serializer.toJson<DateTime?>(modifiedAt),
    };
  }

  Goal copyWith({
    String? id,
    String? title,
    String? description,
    Value<DateTime?> dueDate = const Value.absent(),
    DateTime? createdAt,
    Value<DateTime?> modifiedAt = const Value.absent(),
  }) => Goal(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    dueDate: dueDate.present ? dueDate.value : this.dueDate,
    createdAt: createdAt ?? this.createdAt,
    modifiedAt: modifiedAt.present ? modifiedAt.value : this.modifiedAt,
  );
  Goal copyWithCompanion(GoalsCompanion data) {
    return Goal(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      modifiedAt: data.modifiedAt.present
          ? data.modifiedAt.value
          : this.modifiedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Goal(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('dueDate: $dueDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('modifiedAt: $modifiedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, description, dueDate, createdAt, modifiedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Goal &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.dueDate == this.dueDate &&
          other.createdAt == this.createdAt &&
          other.modifiedAt == this.modifiedAt);
}

class GoalsCompanion extends UpdateCompanion<Goal> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> description;
  final Value<DateTime?> dueDate;
  final Value<DateTime> createdAt;
  final Value<DateTime?> modifiedAt;
  final Value<int> rowid;
  const GoalsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.modifiedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GoalsCompanion.insert({
    required String id,
    required String title,
    required String description,
    this.dueDate = const Value.absent(),
    required DateTime createdAt,
    this.modifiedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       description = Value(description),
       createdAt = Value(createdAt);
  static Insertable<Goal> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? dueDate,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? modifiedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (dueDate != null) 'due_date': dueDate,
      if (createdAt != null) 'created_at': createdAt,
      if (modifiedAt != null) 'modified_at': modifiedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GoalsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? description,
    Value<DateTime?>? dueDate,
    Value<DateTime>? createdAt,
    Value<DateTime?>? modifiedAt,
    Value<int>? rowid,
  }) {
    return GoalsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (modifiedAt.present) {
      map['modified_at'] = Variable<DateTime>(modifiedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('dueDate: $dueDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('modifiedAt: $modifiedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DayVotesTable extends DayVotes
    with TableInfo<$DayVotesTable, DayVoteEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DayVotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _voteMeta = const VerificationMeta('vote');
  @override
  late final GeneratedColumn<String> vote = GeneratedColumn<String>(
    'vote',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [date, vote];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'day_votes';
  @override
  VerificationContext validateIntegrity(
    Insertable<DayVoteEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('vote')) {
      context.handle(
        _voteMeta,
        vote.isAcceptableOrUnknown(data['vote']!, _voteMeta),
      );
    } else if (isInserting) {
      context.missing(_voteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {date};
  @override
  DayVoteEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DayVoteEntry(
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      vote: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vote'],
      )!,
    );
  }

  @override
  $DayVotesTable createAlias(String alias) {
    return $DayVotesTable(attachedDatabase, alias);
  }
}

class DayVoteEntry extends DataClass implements Insertable<DayVoteEntry> {
  final String date;
  final String vote;
  const DayVoteEntry({required this.date, required this.vote});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date'] = Variable<String>(date);
    map['vote'] = Variable<String>(vote);
    return map;
  }

  DayVotesCompanion toCompanion(bool nullToAbsent) {
    return DayVotesCompanion(date: Value(date), vote: Value(vote));
  }

  factory DayVoteEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DayVoteEntry(
      date: serializer.fromJson<String>(json['date']),
      vote: serializer.fromJson<String>(json['vote']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'date': serializer.toJson<String>(date),
      'vote': serializer.toJson<String>(vote),
    };
  }

  DayVoteEntry copyWith({String? date, String? vote}) =>
      DayVoteEntry(date: date ?? this.date, vote: vote ?? this.vote);
  DayVoteEntry copyWithCompanion(DayVotesCompanion data) {
    return DayVoteEntry(
      date: data.date.present ? data.date.value : this.date,
      vote: data.vote.present ? data.vote.value : this.vote,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DayVoteEntry(')
          ..write('date: $date, ')
          ..write('vote: $vote')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(date, vote);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DayVoteEntry &&
          other.date == this.date &&
          other.vote == this.vote);
}

class DayVotesCompanion extends UpdateCompanion<DayVoteEntry> {
  final Value<String> date;
  final Value<String> vote;
  final Value<int> rowid;
  const DayVotesCompanion({
    this.date = const Value.absent(),
    this.vote = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DayVotesCompanion.insert({
    required String date,
    required String vote,
    this.rowid = const Value.absent(),
  }) : date = Value(date),
       vote = Value(vote);
  static Insertable<DayVoteEntry> custom({
    Expression<String>? date,
    Expression<String>? vote,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (date != null) 'date': date,
      if (vote != null) 'vote': vote,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DayVotesCompanion copyWith({
    Value<String>? date,
    Value<String>? vote,
    Value<int>? rowid,
  }) {
    return DayVotesCompanion(
      date: date ?? this.date,
      vote: vote ?? this.vote,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (vote.present) {
      map['vote'] = Variable<String>(vote.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DayVotesCompanion(')
          ..write('date: $date, ')
          ..write('vote: $vote, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CigarettesTable extends Cigarettes
    with TableInfo<$CigarettesTable, Cigarette> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CigarettesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, timestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cigarettes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Cigarette> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Cigarette map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Cigarette(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
    );
  }

  @override
  $CigarettesTable createAlias(String alias) {
    return $CigarettesTable(attachedDatabase, alias);
  }
}

class Cigarette extends DataClass implements Insertable<Cigarette> {
  final int id;
  final DateTime timestamp;
  const Cigarette({required this.id, required this.timestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  CigarettesCompanion toCompanion(bool nullToAbsent) {
    return CigarettesCompanion(id: Value(id), timestamp: Value(timestamp));
  }

  factory Cigarette.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Cigarette(
      id: serializer.fromJson<int>(json['id']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  Cigarette copyWith({int? id, DateTime? timestamp}) =>
      Cigarette(id: id ?? this.id, timestamp: timestamp ?? this.timestamp);
  Cigarette copyWithCompanion(CigarettesCompanion data) {
    return Cigarette(
      id: data.id.present ? data.id.value : this.id,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Cigarette(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Cigarette &&
          other.id == this.id &&
          other.timestamp == this.timestamp);
}

class CigarettesCompanion extends UpdateCompanion<Cigarette> {
  final Value<int> id;
  final Value<DateTime> timestamp;
  const CigarettesCompanion({
    this.id = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  CigarettesCompanion.insert({
    this.id = const Value.absent(),
    required DateTime timestamp,
  }) : timestamp = Value(timestamp);
  static Insertable<Cigarette> custom({
    Expression<int>? id,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  CigarettesCompanion copyWith({Value<int>? id, Value<DateTime>? timestamp}) {
    return CigarettesCompanion(
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CigarettesCompanion(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $CbdEntriesTable extends CbdEntries
    with TableInfo<$CbdEntriesTable, CbdEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CbdEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, timestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cbd_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<CbdEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CbdEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CbdEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
    );
  }

  @override
  $CbdEntriesTable createAlias(String alias) {
    return $CbdEntriesTable(attachedDatabase, alias);
  }
}

class CbdEntry extends DataClass implements Insertable<CbdEntry> {
  final int id;
  final DateTime timestamp;
  const CbdEntry({required this.id, required this.timestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  CbdEntriesCompanion toCompanion(bool nullToAbsent) {
    return CbdEntriesCompanion(id: Value(id), timestamp: Value(timestamp));
  }

  factory CbdEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CbdEntry(
      id: serializer.fromJson<int>(json['id']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  CbdEntry copyWith({int? id, DateTime? timestamp}) =>
      CbdEntry(id: id ?? this.id, timestamp: timestamp ?? this.timestamp);
  CbdEntry copyWithCompanion(CbdEntriesCompanion data) {
    return CbdEntry(
      id: data.id.present ? data.id.value : this.id,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CbdEntry(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CbdEntry &&
          other.id == this.id &&
          other.timestamp == this.timestamp);
}

class CbdEntriesCompanion extends UpdateCompanion<CbdEntry> {
  final Value<int> id;
  final Value<DateTime> timestamp;
  const CbdEntriesCompanion({
    this.id = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  CbdEntriesCompanion.insert({
    this.id = const Value.absent(),
    required DateTime timestamp,
  }) : timestamp = Value(timestamp);
  static Insertable<CbdEntry> custom({
    Expression<int>? id,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  CbdEntriesCompanion copyWith({Value<int>? id, Value<DateTime>? timestamp}) {
    return CbdEntriesCompanion(
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CbdEntriesCompanion(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $GoalsTable goals = $GoalsTable(this);
  late final $DayVotesTable dayVotes = $DayVotesTable(this);
  late final $CigarettesTable cigarettes = $CigarettesTable(this);
  late final $CbdEntriesTable cbdEntries = $CbdEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    goals,
    dayVotes,
    cigarettes,
    cbdEntries,
  ];
}

typedef $$GoalsTableCreateCompanionBuilder =
    GoalsCompanion Function({
      required String id,
      required String title,
      required String description,
      Value<DateTime?> dueDate,
      required DateTime createdAt,
      Value<DateTime?> modifiedAt,
      Value<int> rowid,
    });
typedef $$GoalsTableUpdateCompanionBuilder =
    GoalsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> description,
      Value<DateTime?> dueDate,
      Value<DateTime> createdAt,
      Value<DateTime?> modifiedAt,
      Value<int> rowid,
    });

class $$GoalsTableFilterComposer extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get modifiedAt => $composableBuilder(
    column: $table.modifiedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get modifiedAt => $composableBuilder(
    column: $table.modifiedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get modifiedAt => $composableBuilder(
    column: $table.modifiedAt,
    builder: (column) => column,
  );
}

class $$GoalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GoalsTable,
          Goal,
          $$GoalsTableFilterComposer,
          $$GoalsTableOrderingComposer,
          $$GoalsTableAnnotationComposer,
          $$GoalsTableCreateCompanionBuilder,
          $$GoalsTableUpdateCompanionBuilder,
          (Goal, BaseReferences<_$AppDatabase, $GoalsTable, Goal>),
          Goal,
          PrefetchHooks Function()
        > {
  $$GoalsTableTableManager(_$AppDatabase db, $GoalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> modifiedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GoalsCompanion(
                id: id,
                title: title,
                description: description,
                dueDate: dueDate,
                createdAt: createdAt,
                modifiedAt: modifiedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required String description,
                Value<DateTime?> dueDate = const Value.absent(),
                required DateTime createdAt,
                Value<DateTime?> modifiedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GoalsCompanion.insert(
                id: id,
                title: title,
                description: description,
                dueDate: dueDate,
                createdAt: createdAt,
                modifiedAt: modifiedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GoalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GoalsTable,
      Goal,
      $$GoalsTableFilterComposer,
      $$GoalsTableOrderingComposer,
      $$GoalsTableAnnotationComposer,
      $$GoalsTableCreateCompanionBuilder,
      $$GoalsTableUpdateCompanionBuilder,
      (Goal, BaseReferences<_$AppDatabase, $GoalsTable, Goal>),
      Goal,
      PrefetchHooks Function()
    >;
typedef $$DayVotesTableCreateCompanionBuilder =
    DayVotesCompanion Function({
      required String date,
      required String vote,
      Value<int> rowid,
    });
typedef $$DayVotesTableUpdateCompanionBuilder =
    DayVotesCompanion Function({
      Value<String> date,
      Value<String> vote,
      Value<int> rowid,
    });

class $$DayVotesTableFilterComposer
    extends Composer<_$AppDatabase, $DayVotesTable> {
  $$DayVotesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vote => $composableBuilder(
    column: $table.vote,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DayVotesTableOrderingComposer
    extends Composer<_$AppDatabase, $DayVotesTable> {
  $$DayVotesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vote => $composableBuilder(
    column: $table.vote,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DayVotesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DayVotesTable> {
  $$DayVotesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get vote =>
      $composableBuilder(column: $table.vote, builder: (column) => column);
}

class $$DayVotesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DayVotesTable,
          DayVoteEntry,
          $$DayVotesTableFilterComposer,
          $$DayVotesTableOrderingComposer,
          $$DayVotesTableAnnotationComposer,
          $$DayVotesTableCreateCompanionBuilder,
          $$DayVotesTableUpdateCompanionBuilder,
          (
            DayVoteEntry,
            BaseReferences<_$AppDatabase, $DayVotesTable, DayVoteEntry>,
          ),
          DayVoteEntry,
          PrefetchHooks Function()
        > {
  $$DayVotesTableTableManager(_$AppDatabase db, $DayVotesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DayVotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DayVotesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DayVotesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> date = const Value.absent(),
                Value<String> vote = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DayVotesCompanion(date: date, vote: vote, rowid: rowid),
          createCompanionCallback:
              ({
                required String date,
                required String vote,
                Value<int> rowid = const Value.absent(),
              }) => DayVotesCompanion.insert(
                date: date,
                vote: vote,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DayVotesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DayVotesTable,
      DayVoteEntry,
      $$DayVotesTableFilterComposer,
      $$DayVotesTableOrderingComposer,
      $$DayVotesTableAnnotationComposer,
      $$DayVotesTableCreateCompanionBuilder,
      $$DayVotesTableUpdateCompanionBuilder,
      (
        DayVoteEntry,
        BaseReferences<_$AppDatabase, $DayVotesTable, DayVoteEntry>,
      ),
      DayVoteEntry,
      PrefetchHooks Function()
    >;
typedef $$CigarettesTableCreateCompanionBuilder =
    CigarettesCompanion Function({Value<int> id, required DateTime timestamp});
typedef $$CigarettesTableUpdateCompanionBuilder =
    CigarettesCompanion Function({Value<int> id, Value<DateTime> timestamp});

class $$CigarettesTableFilterComposer
    extends Composer<_$AppDatabase, $CigarettesTable> {
  $$CigarettesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CigarettesTableOrderingComposer
    extends Composer<_$AppDatabase, $CigarettesTable> {
  $$CigarettesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CigarettesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CigarettesTable> {
  $$CigarettesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);
}

class $$CigarettesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CigarettesTable,
          Cigarette,
          $$CigarettesTableFilterComposer,
          $$CigarettesTableOrderingComposer,
          $$CigarettesTableAnnotationComposer,
          $$CigarettesTableCreateCompanionBuilder,
          $$CigarettesTableUpdateCompanionBuilder,
          (
            Cigarette,
            BaseReferences<_$AppDatabase, $CigarettesTable, Cigarette>,
          ),
          Cigarette,
          PrefetchHooks Function()
        > {
  $$CigarettesTableTableManager(_$AppDatabase db, $CigarettesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CigarettesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CigarettesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CigarettesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
              }) => CigarettesCompanion(id: id, timestamp: timestamp),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime timestamp,
              }) => CigarettesCompanion.insert(id: id, timestamp: timestamp),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CigarettesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CigarettesTable,
      Cigarette,
      $$CigarettesTableFilterComposer,
      $$CigarettesTableOrderingComposer,
      $$CigarettesTableAnnotationComposer,
      $$CigarettesTableCreateCompanionBuilder,
      $$CigarettesTableUpdateCompanionBuilder,
      (Cigarette, BaseReferences<_$AppDatabase, $CigarettesTable, Cigarette>),
      Cigarette,
      PrefetchHooks Function()
    >;
typedef $$CbdEntriesTableCreateCompanionBuilder =
    CbdEntriesCompanion Function({Value<int> id, required DateTime timestamp});
typedef $$CbdEntriesTableUpdateCompanionBuilder =
    CbdEntriesCompanion Function({Value<int> id, Value<DateTime> timestamp});

class $$CbdEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $CbdEntriesTable> {
  $$CbdEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CbdEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CbdEntriesTable> {
  $$CbdEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CbdEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CbdEntriesTable> {
  $$CbdEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);
}

class $$CbdEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CbdEntriesTable,
          CbdEntry,
          $$CbdEntriesTableFilterComposer,
          $$CbdEntriesTableOrderingComposer,
          $$CbdEntriesTableAnnotationComposer,
          $$CbdEntriesTableCreateCompanionBuilder,
          $$CbdEntriesTableUpdateCompanionBuilder,
          (CbdEntry, BaseReferences<_$AppDatabase, $CbdEntriesTable, CbdEntry>),
          CbdEntry,
          PrefetchHooks Function()
        > {
  $$CbdEntriesTableTableManager(_$AppDatabase db, $CbdEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CbdEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CbdEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CbdEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
              }) => CbdEntriesCompanion(id: id, timestamp: timestamp),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime timestamp,
              }) => CbdEntriesCompanion.insert(id: id, timestamp: timestamp),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CbdEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CbdEntriesTable,
      CbdEntry,
      $$CbdEntriesTableFilterComposer,
      $$CbdEntriesTableOrderingComposer,
      $$CbdEntriesTableAnnotationComposer,
      $$CbdEntriesTableCreateCompanionBuilder,
      $$CbdEntriesTableUpdateCompanionBuilder,
      (CbdEntry, BaseReferences<_$AppDatabase, $CbdEntriesTable, CbdEntry>),
      CbdEntry,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$GoalsTableTableManager get goals =>
      $$GoalsTableTableManager(_db, _db.goals);
  $$DayVotesTableTableManager get dayVotes =>
      $$DayVotesTableTableManager(_db, _db.dayVotes);
  $$CigarettesTableTableManager get cigarettes =>
      $$CigarettesTableTableManager(_db, _db.cigarettes);
  $$CbdEntriesTableTableManager get cbdEntries =>
      $$CbdEntriesTableTableManager(_db, _db.cbdEntries);
}
