// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Repo extends DataClass implements Insertable<Repo> {
  final int id;
  final String name;
  final String htmlUrl;
  Repo({@required this.id, @required this.name, @required this.htmlUrl});
  factory Repo.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Repo(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      htmlUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}html_url']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || htmlUrl != null) {
      map['html_url'] = Variable<String>(htmlUrl);
    }
    return map;
  }

  ReposCompanion toCompanion(bool nullToAbsent) {
    return ReposCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      htmlUrl: htmlUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(htmlUrl),
    );
  }

  factory Repo.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Repo(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      htmlUrl: serializer.fromJson<String>(json['htmlUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'htmlUrl': serializer.toJson<String>(htmlUrl),
    };
  }

  Repo copyWith({int id, String name, String htmlUrl}) => Repo(
        id: id ?? this.id,
        name: name ?? this.name,
        htmlUrl: htmlUrl ?? this.htmlUrl,
      );
  @override
  String toString() {
    return (StringBuffer('Repo(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('htmlUrl: $htmlUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(name.hashCode, htmlUrl.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Repo &&
          other.id == this.id &&
          other.name == this.name &&
          other.htmlUrl == this.htmlUrl);
}

class ReposCompanion extends UpdateCompanion<Repo> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> htmlUrl;
  const ReposCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.htmlUrl = const Value.absent(),
  });
  ReposCompanion.insert({
    @required int id,
    @required String name,
    @required String htmlUrl,
  })  : id = Value(id),
        name = Value(name),
        htmlUrl = Value(htmlUrl);
  static Insertable<Repo> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> htmlUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (htmlUrl != null) 'html_url': htmlUrl,
    });
  }

  ReposCompanion copyWith(
      {Value<int> id, Value<String> name, Value<String> htmlUrl}) {
    return ReposCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      htmlUrl: htmlUrl ?? this.htmlUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (htmlUrl.present) {
      map['html_url'] = Variable<String>(htmlUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReposCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('htmlUrl: $htmlUrl')
          ..write(')'))
        .toString();
  }
}

class $ReposTable extends Repos with TableInfo<$ReposTable, Repo> {
  final GeneratedDatabase _db;
  final String _alias;
  $ReposTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _htmlUrlMeta = const VerificationMeta('htmlUrl');
  GeneratedTextColumn _htmlUrl;
  @override
  GeneratedTextColumn get htmlUrl => _htmlUrl ??= _constructHtmlUrl();
  GeneratedTextColumn _constructHtmlUrl() {
    return GeneratedTextColumn(
      'html_url',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, htmlUrl];
  @override
  $ReposTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'repos';
  @override
  final String actualTableName = 'repos';
  @override
  VerificationContext validateIntegrity(Insertable<Repo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('html_url')) {
      context.handle(_htmlUrlMeta,
          htmlUrl.isAcceptableOrUnknown(data['html_url'], _htmlUrlMeta));
    } else if (isInserting) {
      context.missing(_htmlUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Repo map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Repo.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ReposTable createAlias(String alias) {
    return $ReposTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ReposTable _repos;
  $ReposTable get repos => _repos ??= $ReposTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [repos];
}
