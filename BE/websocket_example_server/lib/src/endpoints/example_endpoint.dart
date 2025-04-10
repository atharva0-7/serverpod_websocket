// import 'dart:async';
// import 'dart:typed_data';
// import 'package:serverpod/serverpod.dart';
// import '../../utils/encryption_helper.dart';
// import '../generated/my_message.dart';
//
// class ExampleEndpoint extends Endpoint {
//   static final Map<String, StreamController<MyMessage>> _controllers = {};
//
//   Stream<MyMessage> echoStream(Session session, Stream<MyMessage> stream) async* {
//     try {
//       await for (var message in stream) {
//         print('HELLO FROM SERVER (${message.senderId} → ${message.receiverId}): ${message.text}');
//
//         // Encrypt the text only if it's not null
//         String? encryptedText;
//         if (message.text != null && message.text!.isNotEmpty) {
//           encryptedText = EncryptionHelper.encryptMessage(message.text!);
//         }
//
//         // Create a new message object with or without text
//         final newMessage = MyMessage(
//           senderId: message.senderId,
//           receiverId: message.receiverId,
//           text: encryptedText,  // Encrypted text (or null)
//           imageUrl: message.imageUrl, // Keep image as is
//         );
//
//         // Save to the database
//         await MyMessage.db.insertRow(session, newMessage);
//
//         // Send message to receiver
//         String chatKey = _getChatKey(message.senderId, message.receiverId);
//         _controllers.putIfAbsent(chatKey, () => StreamController<MyMessage>.broadcast());
//         _controllers[chatKey]!.add(newMessage);
//
//         yield newMessage;
//       }
//     } catch (error) {
//       print('Server received error: $error');
//     }
//   }
//
//
//   Stream<MyMessage> subscribe(Session session, String userId, String chatPartnerId) {
//     String chatKey = _getChatKey(userId, chatPartnerId);
//     _controllers.putIfAbsent(chatKey, () => StreamController<MyMessage>.broadcast());
//     return _controllers[chatKey]!.stream;
//   }
//
//   String _getChatKey(String user1, String user2) {
//     return user1.compareTo(user2) < 0 ? '${user1}_$user2' : '${user2}_$user1';
//   }
//
//   Future<int> uploadImage(Session session, List<int> imageBytes, String senderId, String receiverId) async {
//     final message = MyMessage(
//       senderId: senderId,
//       receiverId: receiverId,
//       imageUrl: imageBytes,
//     );
//
//     final insertedMessage = await MyMessage.db.insertRow(session, message);
//     return insertedMessage.id ?? 0;
//   }
//
//   Future<Uint8List?> fetchImage(Session session, int messageId) async {
//     final message = await MyMessage.db.findById(session, messageId);
//     return message?.imageUrl != null ? Uint8List.fromList(message!.imageUrl!) : null;
//   }
//
//   Future<MyMessage?> getMessageById(Session session, int messageId) async {
//     final message = await MyMessage.db.findById(session, messageId);
//
//     if (message != null && (message.text?.isNotEmpty?? false )) {
//       // Decrypt the message before returning it
//       message.text = EncryptionHelper.decryptMessage(message.text ?? '');
//     }
//
//     return message;
//   }
//
//   Future<List<MyMessage>> getChatHistory(Session session, String userId, String chatPartnerId) async {
//     final messages = await MyMessage.db.find(
//       session,
//       where: (t) => (t.senderId.equals(userId) & t.receiverId.equals(chatPartnerId)) |
//       (t.senderId.equals(chatPartnerId) & t.receiverId.equals(userId)),
//       orderBy: (t) => t.id,
//       orderDescending: true,
//     );
//
//     // Decrypt all messages before returning them
//     for (var message in messages) {
//       if (message.text?.isNotEmpty ?? false) {
//         message.text = EncryptionHelper.decryptMessage(message.text ?? '');
//       }
//     }
//
//     return messages;
//   }
// }
