import 'dart:typed_data';
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:websocket_example_client/websocket_example_client.dart';

class ChatService {
  final Client client;

  ChatService(this.client);

  Future<List<MyMessage>> fetchChatHistory(String userId, String chatPartnerId) async {
    return await client.chat.getChatHistory(userId, chatPartnerId);
  }

  Future<Uint8List?> uploadImage(File image, String senderId, String receiverId) async {
    Uint8List compressedImageBytes = await _compressImage(image);
    int id = await client.chat.uploadImage(compressedImageBytes, senderId, receiverId);
    final storedMessage = await client.chat.getMessageById(id);

    return storedMessage?.imageUrl != null
        ? Uint8List.fromList(storedMessage!.imageUrl!)
        : null;
  }

  Future<Uint8List> _compressImage(File file, {int quality = 10}) async {
    Uint8List bytes = await file.readAsBytes();
    img.Image? image = img.decodeImage(bytes);

    if (image == null) {
      throw Exception("Failed to decode image");
    }

    Uint8List compressedBytes = Uint8List.fromList(img.encodeJpg(image, quality: quality));
    return compressedBytes;
  }
}
