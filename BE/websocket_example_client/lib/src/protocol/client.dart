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
import 'dart:async' as _i2;
import 'package:websocket_example_client/src/protocol/my_user.dart' as _i3;
import 'package:websocket_example_client/src/protocol/my_message.dart' as _i4;
import 'dart:typed_data' as _i5;
import 'protocol.dart' as _i6;

/// {@category Endpoint}
class EndpointAuth extends _i1.EndpointRef {
  EndpointAuth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'auth';

  _i2.Future<bool> verifyGoogleSignIn(
    String googleId,
    String idToken,
  ) =>
      caller.callServerEndpoint<bool>(
        'auth',
        'verifyGoogleSignIn',
        {
          'googleId': googleId,
          'idToken': idToken,
        },
      );

  _i2.Future<List<_i3.MyUser>> getAllUsers() =>
      caller.callServerEndpoint<List<_i3.MyUser>>(
        'auth',
        'getAllUsers',
        {},
      );
}

/// {@category Endpoint}
class EndpointChat extends _i1.EndpointRef {
  EndpointChat(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'chat';

  _i2.Stream<_i4.MyMessage> echoStream(_i2.Stream<_i4.MyMessage> stream) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i4.MyMessage>,
          _i4.MyMessage>(
        'chat',
        'echoStream',
        {},
        {'stream': stream},
      );

  _i2.Stream<_i4.MyMessage> subscribe(
    String userId,
    String chatPartnerId,
  ) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i4.MyMessage>,
          _i4.MyMessage>(
        'chat',
        'subscribe',
        {
          'userId': userId,
          'chatPartnerId': chatPartnerId,
        },
        {},
      );

  _i2.Future<int> uploadImage(
    List<int> imageBytes,
    String senderId,
    String receiverId,
  ) =>
      caller.callServerEndpoint<int>(
        'chat',
        'uploadImage',
        {
          'imageBytes': imageBytes,
          'senderId': senderId,
          'receiverId': receiverId,
        },
      );

  _i2.Future<_i5.Uint8List?> fetchImage(int messageId) =>
      caller.callServerEndpoint<_i5.Uint8List?>(
        'chat',
        'fetchImage',
        {'messageId': messageId},
      );

  _i2.Future<_i4.MyMessage?> getMessageById(int messageId) =>
      caller.callServerEndpoint<_i4.MyMessage?>(
        'chat',
        'getMessageById',
        {'messageId': messageId},
      );

  _i2.Future<List<_i4.MyMessage>> getChatHistory(
    String userId,
    String chatPartnerId,
  ) =>
      caller.callServerEndpoint<List<_i4.MyMessage>>(
        'chat',
        'getChatHistory',
        {
          'userId': userId,
          'chatPartnerId': chatPartnerId,
        },
      );
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i6.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    auth = EndpointAuth(this);
    chat = EndpointChat(this);
  }

  late final EndpointAuth auth;

  late final EndpointChat chat;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'auth': auth,
        'chat': chat,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
