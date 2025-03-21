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

abstract class MyMessage implements _i1.TableRow, _i1.ProtocolSerialization {
  MyMessage._({
    this.id,
    this.text,
    required this.senderId,
    required this.receiverId,
    this.imageUrl,
  });

  factory MyMessage({
    int? id,
    String? text,
    required String senderId,
    required String receiverId,
    List<int>? imageUrl,
  }) = _MyMessageImpl;

  factory MyMessage.fromJson(Map<String, dynamic> jsonSerialization) {
    return MyMessage(
      id: jsonSerialization['id'] as int?,
      text: jsonSerialization['text'] as String?,
      senderId: jsonSerialization['senderId'] as String,
      receiverId: jsonSerialization['receiverId'] as String,
      imageUrl: (jsonSerialization['imageUrl'] as List?)
          ?.map((e) => e as int)
          .toList(),
    );
  }

  static final t = MyMessageTable();

  static const db = MyMessageRepository._();

  @override
  int? id;

  String? text;

  String senderId;

  String receiverId;

  List<int>? imageUrl;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [MyMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MyMessage copyWith({
    int? id,
    String? text,
    String? senderId,
    String? receiverId,
    List<int>? imageUrl,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (text != null) 'text': text,
      'senderId': senderId,
      'receiverId': receiverId,
      if (imageUrl != null) 'imageUrl': imageUrl?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (text != null) 'text': text,
      'senderId': senderId,
      'receiverId': receiverId,
      if (imageUrl != null) 'imageUrl': imageUrl?.toJson(),
    };
  }

  static MyMessageInclude include() {
    return MyMessageInclude._();
  }

  static MyMessageIncludeList includeList({
    _i1.WhereExpressionBuilder<MyMessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MyMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MyMessageTable>? orderByList,
    MyMessageInclude? include,
  }) {
    return MyMessageIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MyMessage.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MyMessage.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MyMessageImpl extends MyMessage {
  _MyMessageImpl({
    int? id,
    String? text,
    required String senderId,
    required String receiverId,
    List<int>? imageUrl,
  }) : super._(
          id: id,
          text: text,
          senderId: senderId,
          receiverId: receiverId,
          imageUrl: imageUrl,
        );

  /// Returns a shallow copy of this [MyMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MyMessage copyWith({
    Object? id = _Undefined,
    Object? text = _Undefined,
    String? senderId,
    String? receiverId,
    Object? imageUrl = _Undefined,
  }) {
    return MyMessage(
      id: id is int? ? id : this.id,
      text: text is String? ? text : this.text,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      imageUrl: imageUrl is List<int>?
          ? imageUrl
          : this.imageUrl?.map((e0) => e0).toList(),
    );
  }
}

class MyMessageTable extends _i1.Table {
  MyMessageTable({super.tableRelation}) : super(tableName: 'my_message') {
    text = _i1.ColumnString(
      'text',
      this,
    );
    senderId = _i1.ColumnString(
      'senderId',
      this,
    );
    receiverId = _i1.ColumnString(
      'receiverId',
      this,
    );
    imageUrl = _i1.ColumnSerializable(
      'imageUrl',
      this,
    );
  }

  late final _i1.ColumnString text;

  late final _i1.ColumnString senderId;

  late final _i1.ColumnString receiverId;

  late final _i1.ColumnSerializable imageUrl;

  @override
  List<_i1.Column> get columns => [
        id,
        text,
        senderId,
        receiverId,
        imageUrl,
      ];
}

class MyMessageInclude extends _i1.IncludeObject {
  MyMessageInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => MyMessage.t;
}

class MyMessageIncludeList extends _i1.IncludeList {
  MyMessageIncludeList._({
    _i1.WhereExpressionBuilder<MyMessageTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MyMessage.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => MyMessage.t;
}

class MyMessageRepository {
  const MyMessageRepository._();

  /// Returns a list of [MyMessage]s matching the given query parameters.
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
  Future<List<MyMessage>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MyMessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MyMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MyMessageTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<MyMessage>(
      where: where?.call(MyMessage.t),
      orderBy: orderBy?.call(MyMessage.t),
      orderByList: orderByList?.call(MyMessage.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [MyMessage] matching the given query parameters.
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
  Future<MyMessage?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MyMessageTable>? where,
    int? offset,
    _i1.OrderByBuilder<MyMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MyMessageTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<MyMessage>(
      where: where?.call(MyMessage.t),
      orderBy: orderBy?.call(MyMessage.t),
      orderByList: orderByList?.call(MyMessage.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [MyMessage] by its [id] or null if no such row exists.
  Future<MyMessage?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<MyMessage>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [MyMessage]s in the list and returns the inserted rows.
  ///
  /// The returned [MyMessage]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<MyMessage>> insert(
    _i1.Session session,
    List<MyMessage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<MyMessage>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [MyMessage] and returns the inserted row.
  ///
  /// The returned [MyMessage] will have its `id` field set.
  Future<MyMessage> insertRow(
    _i1.Session session,
    MyMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MyMessage>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [MyMessage]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<MyMessage>> update(
    _i1.Session session,
    List<MyMessage> rows, {
    _i1.ColumnSelections<MyMessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<MyMessage>(
      rows,
      columns: columns?.call(MyMessage.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MyMessage]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MyMessage> updateRow(
    _i1.Session session,
    MyMessage row, {
    _i1.ColumnSelections<MyMessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MyMessage>(
      row,
      columns: columns?.call(MyMessage.t),
      transaction: transaction,
    );
  }

  /// Deletes all [MyMessage]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<MyMessage>> delete(
    _i1.Session session,
    List<MyMessage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MyMessage>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [MyMessage].
  Future<MyMessage> deleteRow(
    _i1.Session session,
    MyMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MyMessage>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<MyMessage>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MyMessageTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MyMessage>(
      where: where(MyMessage.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MyMessageTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MyMessage>(
      where: where?.call(MyMessage.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
