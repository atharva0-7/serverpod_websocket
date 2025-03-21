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

abstract class MyMessage implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String? text;

  String senderId;

  String receiverId;

  List<int>? imageUrl;

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
