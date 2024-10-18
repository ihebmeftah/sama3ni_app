/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Tasks implements _i1.TableRow, _i1.ProtocolSerialization {
  Tasks._({
    this.id,
    required this.name,
    required this.photo,
    DateTime? createdAt,
    this.updatedAt,
    this.deletedAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Tasks({
    int? id,
    required String name,
    required String photo,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) = _TasksImpl;

  factory Tasks.fromJson(Map<String, dynamic> jsonSerialization) {
    return Tasks(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      photo: jsonSerialization['photo'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      deletedAt: jsonSerialization['deletedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deletedAt']),
    );
  }

  static final t = TasksTable();

  static const db = TasksRepository._();

  @override
  int? id;

  String name;

  String photo;

  DateTime createdAt;

  DateTime? updatedAt;

  DateTime? deletedAt;

  @override
  _i1.Table get table => t;

  Tasks copyWith({
    int? id,
    String? name,
    String? photo,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'photo': photo,
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'photo': photo,
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
    };
  }

  static TasksInclude include() {
    return TasksInclude._();
  }

  static TasksIncludeList includeList({
    _i1.WhereExpressionBuilder<TasksTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TasksTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TasksTable>? orderByList,
    TasksInclude? include,
  }) {
    return TasksIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Tasks.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Tasks.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TasksImpl extends Tasks {
  _TasksImpl({
    int? id,
    required String name,
    required String photo,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) : super._(
          id: id,
          name: name,
          photo: photo,
          createdAt: createdAt,
          updatedAt: updatedAt,
          deletedAt: deletedAt,
        );

  @override
  Tasks copyWith({
    Object? id = _Undefined,
    String? name,
    String? photo,
    DateTime? createdAt,
    Object? updatedAt = _Undefined,
    Object? deletedAt = _Undefined,
  }) {
    return Tasks(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      deletedAt: deletedAt is DateTime? ? deletedAt : this.deletedAt,
    );
  }
}

class TasksTable extends _i1.Table {
  TasksTable({super.tableRelation}) : super(tableName: 'task') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    photo = _i1.ColumnString(
      'photo',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
    deletedAt = _i1.ColumnDateTime(
      'deletedAt',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnString photo;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnDateTime deletedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        photo,
        createdAt,
        updatedAt,
        deletedAt,
      ];
}

class TasksInclude extends _i1.IncludeObject {
  TasksInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Tasks.t;
}

class TasksIncludeList extends _i1.IncludeList {
  TasksIncludeList._({
    _i1.WhereExpressionBuilder<TasksTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Tasks.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Tasks.t;
}

class TasksRepository {
  const TasksRepository._();

  Future<List<Tasks>> find(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<TasksTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TasksTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TasksTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.find<Tasks>(
      where: where?.call(Tasks.t),
      orderBy: orderBy?.call(Tasks.t),
      orderByList: orderByList?.call(Tasks.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Tasks?> findFirstRow(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<TasksTable>? where,
    int? offset,
    _i1.OrderByBuilder<TasksTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TasksTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.findFirstRow<Tasks>(
      where: where?.call(Tasks.t),
      orderBy: orderBy?.call(Tasks.t),
      orderByList: orderByList?.call(Tasks.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Tasks?> findById(
    _i1.DatabaseAccessor databaseAccessor,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.findById<Tasks>(
      id,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Tasks>> insert(
    _i1.DatabaseAccessor databaseAccessor,
    List<Tasks> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insert<Tasks>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Tasks> insertRow(
    _i1.DatabaseAccessor databaseAccessor,
    Tasks row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insertRow<Tasks>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Tasks>> update(
    _i1.DatabaseAccessor databaseAccessor,
    List<Tasks> rows, {
    _i1.ColumnSelections<TasksTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.update<Tasks>(
      rows,
      columns: columns?.call(Tasks.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Tasks> updateRow(
    _i1.DatabaseAccessor databaseAccessor,
    Tasks row, {
    _i1.ColumnSelections<TasksTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.updateRow<Tasks>(
      row,
      columns: columns?.call(Tasks.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Tasks>> delete(
    _i1.DatabaseAccessor databaseAccessor,
    List<Tasks> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.delete<Tasks>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Tasks> deleteRow(
    _i1.DatabaseAccessor databaseAccessor,
    Tasks row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteRow<Tasks>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Tasks>> deleteWhere(
    _i1.DatabaseAccessor databaseAccessor, {
    required _i1.WhereExpressionBuilder<TasksTable> where,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteWhere<Tasks>(
      where: where(Tasks.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<int> count(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<TasksTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.count<Tasks>(
      where: where?.call(Tasks.t),
      limit: limit,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}
