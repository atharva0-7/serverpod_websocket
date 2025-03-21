import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:websocket_example_client/websocket_example_client.dart';
import 'package:websocket_example_flutter/core/strings.dart';
import 'package:websocket_example_flutter/main.dart';
import 'package:websocket_example_flutter/screens/widgets/chat_bubble.dart';

// import '../core/encryption.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  final MyUser chatPartner;

  const ChatScreen({super.key, required this.user, required this.chatPartner});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<MyMessage> _messages = [];
  late StreamSubscription<MyMessage> _subscription;
  late StreamController<MyMessage> _streamController;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController<MyMessage>();
    _listenToMessages();
    _sendMessageStream();
  }

  void _listenToMessages() async {
    final history = await client.example.getChatHistory(widget.user.uid, widget.chatPartner.uid);
    setState(() {
      _messages.addAll(history.reversed.map((msg) {
        return msg.copyWith(text: msg.text);
      }));
    });

    _subscription = client.example.subscribe(widget.user.uid, widget.chatPartner.uid).listen(
          (message) {
        if (message.senderId != widget.user.uid) {
          setState(() {
            _messages.insert(0, message.copyWith(
              text: message.text
            ));
          });
        }
      },
      onError: (error) {
        print('Error receiving message: $error');
      },
    );
  }


  Future<Uint8List?> _uploadImage(File image) async {
    try {
      // Compress the image
      Uint8List compressedImageBytes = await _compressImage(image);

      // Upload compressed image
      int messageId = await client.example.uploadImage(
        compressedImageBytes,
        widget.user.uid,
        widget.chatPartner.uid,
      );

      // Fetch stored image
      final storedMessage = await client.example.getMessageById(messageId);

      return storedMessage?.imageUrl != null
          ? Uint8List.fromList(storedMessage!.imageUrl!)
          : null;
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }

// Function to compress the image
  Future<Uint8List> _compressImage(File file, {int quality = 10}) async {
    Uint8List bytes = await file.readAsBytes();
    img.Image? image = img.decodeImage(bytes);

    if (image == null) {
      throw Exception("Failed to decode image");
    }

    Uint8List compressedBytes = Uint8List.fromList(img.encodeJpg(image, quality: quality));
    return compressedBytes;
  }


  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      Uint8List? imageData = await _uploadImage(File(pickedFile.path)); // Get Uint8List

      _sendMessage(imageUrl: imageData); // Pass Uint8List? directly
    }
  }


  void _sendMessage({Uint8List? imageUrl}) {
    if (_controller.text.isNotEmpty || imageUrl != null) {
      final message = MyMessage(
        text: _controller.text.isNotEmpty ? _controller.text : null,
        imageUrl: imageUrl?.toList(),
        senderId: widget.user.uid,
        receiverId: widget.chatPartner.uid,
      );
      print(message.text);
      print(imageUrl);

      _streamController.add(message);
      _controller.clear();
    }
  }
  void _sendMessageStream() async {
    var outStream = client.example.echoStream(_streamController.stream);
    outStream.listen((message) {
      setState(() {
        _messages.insert(0, message);
      });
    });
  }


  @override
  void dispose() {
    _streamController.close();
    _subscription.cancel();
    super.dispose();
  }



@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // Show latest messages at the bottom
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isMine = message.senderId == widget.user.uid;
                return ChatBubble(message: message, isMine: isMine);
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.indigo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      title: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: Colors.white,
            child:
            Text(widget.chatPartner.name[0].toUpperCase(),
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
            ,
          ),
          const SizedBox(width: 10),
          Text(widget.chatPartner.name, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.image, color: Colors.blueAccent),
            onPressed: _pickImage,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[800]
                    : Colors.white,
                borderRadius: BorderRadius.circular(30),
                // boxShadow: [BoxShadow(color: Colors.grey)],
              ),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Type a message...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () => _sendMessage(),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blueAccent,
              child: const Icon(Icons.send, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
