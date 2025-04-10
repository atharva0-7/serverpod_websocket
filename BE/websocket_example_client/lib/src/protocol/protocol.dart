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
import 'example.dart' as _i2;
import 'my_message.dart' as _i3;
import 'my_user.dart' as _i4;
import 'package:websocket_example_client/src/protocol/my_user.dart' as _i5;
import 'package:websocket_example_client/src/protocol/my_message.dart' as _i6;
export 'example.dart';
export 'my_message.dart';
export 'my_user.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Example) {
      return _i2.Example.fromJson(data) as T;
    }
    if (t == _i3.MyMessage) {
      return _i3.MyMessage.fromJson(data) as T;
    }
    if (t == _i4.MyUser) {
      return _i4.MyUser.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Example?>()) {
      return (data != null ? _i2.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.MyMessage?>()) {
      return (data != null ? _i3.MyMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.MyUser?>()) {
      return (data != null ? _i4.MyUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == List<_i5.MyUser>) {
      return (data as List).map((e) => deserialize<_i5.MyUser>(e)).toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i6.MyMessage>) {
      return (data as List).map((e) => deserialize<_i6.MyMessage>(e)).toList()
          as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Example) {
      return 'Example';
    }
    if (data is _i3.MyMessage) {
      return 'MyMessage';
    }
    if (data is _i4.MyUser) {
      return 'MyUser';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Example') {
      return deserialize<_i2.Example>(data['data']);
    }
    if (dataClassName == 'MyMessage') {
      return deserialize<_i3.MyMessage>(data['data']);
    }
    if (dataClassName == 'MyUser') {
      return deserialize<_i4.MyUser>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
