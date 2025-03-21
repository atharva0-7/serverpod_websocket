/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class MyUser implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String uid;

  String email;

  String name;

  DateTime createdAt;

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
