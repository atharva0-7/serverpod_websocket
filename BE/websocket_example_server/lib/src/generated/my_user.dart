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

abstract class MyUser implements _i1.TableRow, _i1.ProtocolSerialization {
  MyUser._({
    this.id,
    required this.uid,
    required this.email,
    required this.name,
    required this.createdAt,
  });

  factory MyUser({
    int? id,
    required String uid,
    required String email,
    required String name,
    required DateTime createdAt,
  }) = _MyUserImpl;

  factory MyUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return MyUser(
      id: jsonSerialization['id'] as int?,
      uid: jsonSerialization['uid'] as String,
      email: jsonSerialization['email'] as String,
      name: jsonSerialization['name'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = MyUserTable();

  static const db = MyUserRepository._();

  @override
  int? id;

  String uid;

  String email;

  String name;

  DateTime createdAt;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [MyUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MyUser copyWith({
    int? id,
    String? uid,
    String? email,
    String? name,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'uid': uid,
      'email': email,
      'name': name,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'uid': uid,
      'email': email,
      'name': name,
      'createdAt': createdAt.toJson(),
    };
  }

  static MyUserInclude include() {
    return MyUserInclude._();
  }

  static MyUserIncludeList includeList({
    _i1.WhereExpressionBuilder<MyUserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MyUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MyUserTable>? orderByList,
    MyUserInclude? include,
  }) {
    return MyUserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MyUser.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MyUser.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MyUserImpl extends MyUser {
  _MyUserImpl({
    int? id,
    required String uid,
    required String email,
    required String name,
    required DateTime createdAt,
  }) : super._(
          id: id,
          uid: uid,
          email: email,
          name: name,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [MyUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MyUser copyWith({
    Object? id = _Undefined,
    String? uid,
    String? email,
    String? name,
    DateTime? createdAt,
  }) {
    return MyUser(
      id: id is int? ? id : this.id,
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class MyUserTable extends _i1.Table {
  MyUserTable({super.tableRelation}) : super(tableName: 'my_user') {
    uid = _i1.ColumnString(
      'uid',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final _i1.ColumnString uid;

  late final _i1.ColumnString email;

  late final _i1.ColumnString name;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
        id,
        uid,
        email,
        name,
        createdAt,
      ];
}

class MyUserInclude extends _i1.IncludeObject {
  MyUserInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => MyUser.t;
}

class MyUserIncludeList extends _i1.IncludeList {
  MyUserIncludeList._({
    _i1.WhereExpressionBuilder<MyUserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MyUser.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => MyUser.t;
}

class MyUserRepository {
  const MyUserRepository._();

  /// Returns a list of [MyUser]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<MyUser>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MyUserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MyUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MyUserTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<MyUser>(
      where: where?.call(MyUser.t),
      orderBy: orderBy?.call(MyUser.t),
      orderByList: orderByList?.call(MyUser.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [MyUser] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<MyUser?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MyUserTable>? where,
    int? offset,
    _i1.OrderByBuilder<MyUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MyUserTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<MyUser>(
      where: where?.call(MyUser.t),
      orderBy: orderBy?.call(MyUser.t),
      orderByList: orderByList?.call(MyUser.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [MyUser] by its [id] or null if no such row exists.
  Future<MyUser?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<MyUser>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [MyUser]s in the list and returns the inserted rows.
  ///
  /// The returned [MyUser]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<MyUser>> insert(
    _i1.Session session,
    List<MyUser> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<MyUser>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [MyUser] and returns the inserted row.
  ///
  /// The returned [MyUser] will have its `id` field set.
  Future<MyUser> insertRow(
    _i1.Session session,
    MyUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MyUser>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [MyUser]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<MyUser>> update(
    _i1.Session session,
    List<MyUser> rows, {
    _i1.ColumnSelections<MyUserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<MyUser>(
      rows,
      columns: columns?.call(MyUser.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MyUser]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MyUser> updateRow(
    _i1.Session session,
    MyUser row, {
    _i1.ColumnSelections<MyUserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MyUser>(
      row,
      columns: columns?.call(MyUser.t),
      transaction: transaction,
    );
  }

  /// Deletes all [MyUser]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<MyUser>> delete(
    _i1.Session session,
    List<MyUser> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MyUser>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [MyUser].
  Future<MyUser> deleteRow(
    _i1.Session session,
    MyUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MyUser>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<MyUser>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MyUserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MyUser>(
      where: where(MyUser.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MyUserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MyUser>(
      where: where?.call(MyUser.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
