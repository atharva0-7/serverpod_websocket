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
import '../endpoints/auth_endpoint.dart' as _i2;
import '../endpoints/chat_endpoint.dart' as _i3;
import 'package:websocket_example_server/src/generated/my_message.dart' as _i4;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'auth': _i2.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'chat': _i3.ChatEndpoint()
        ..initialize(
          server,
          'chat',
          null,
        ),
    };
    connectors['auth'] = _i1.EndpointConnector(
      name: 'auth',
      endpoint: endpoints['auth']!,
      methodConnectors: {
        'verifyGoogleSignIn': _i1.MethodConnector(
          name: 'verifyGoogleSignIn',
          params: {
            'googleId': _i1.ParameterDescription(
              name: 'googleId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'idToken': _i1.ParameterDescription(
              name: 'idToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).verifyGoogleSignIn(
            session,
            params['googleId'],
            params['idToken'],
          ),
        ),
        'getAllUsers': _i1.MethodConnector(
          name: 'getAllUsers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).getAllUsers(session),
        ),
      },
    );
    connectors['chat'] = _i1.EndpointConnector(
      name: 'chat',
      endpoint: endpoints['chat']!,
      methodConnectors: {
        'uploadImage': _i1.MethodConnector(
          name: 'uploadImage',
          params: {
            'imageBytes': _i1.ParameterDescription(
              name: 'imageBytes',
              type: _i1.getType<List<int>>(),
              nullable: false,
            ),
            'senderId': _i1.ParameterDescription(
              name: 'senderId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'receiverId': _i1.ParameterDescription(
              name: 'receiverId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chat'] as _i3.ChatEndpoint).uploadImage(
            session,
            params['imageBytes'],
            params['senderId'],
            params['receiverId'],
          ),
        ),
        'fetchImage': _i1.MethodConnector(
          name: 'fetchImage',
          params: {
            'messageId': _i1.ParameterDescription(
              name: 'messageId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chat'] as _i3.ChatEndpoint).fetchImage(
            session,
            params['messageId'],
          ),
        ),
        'getMessageById': _i1.MethodConnector(
          name: 'getMessageById',
          params: {
            'messageId': _i1.ParameterDescription(
              name: 'messageId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chat'] as _i3.ChatEndpoint).getMessageById(
            session,
            params['messageId'],
          ),
        ),
        'getChatHistory': _i1.MethodConnector(
          name: 'getChatHistory',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'chatPartnerId': _i1.ParameterDescription(
              name: 'chatPartnerId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chat'] as _i3.ChatEndpoint).getChatHistory(
            session,
            params['userId'],
            params['chatPartnerId'],
          ),
        ),
        'echoStream': _i1.MethodStreamConnector(
          name: 'echoStream',
          params: {},
          streamParams: {
            'stream': _i1.StreamParameterDescription<_i4.MyMessage>(
              name: 'stream',
              nullable: false,
            )
          },
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['chat'] as _i3.ChatEndpoint).echoStream(
            session,
            streamParams['stream']!.cast<_i4.MyMessage>(),
          ),
        ),
        'subscribe': _i1.MethodStreamConnector(
          name: 'subscribe',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'chatPartnerId': _i1.ParameterDescription(
              name: 'chatPartnerId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['chat'] as _i3.ChatEndpoint).subscribe(
            session,
            params['userId'],
            params['chatPartnerId'],
          ),
        ),
      },
    );
  }
}
