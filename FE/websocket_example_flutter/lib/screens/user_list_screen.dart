import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:websocket_example_client/websocket_example_client.dart';
import '../main.dart';
import 'chat_screen.dart';

class UserListScreen extends StatefulWidget {
  final User currentUser;

  const UserListScreen({super.key, required this.currentUser});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<MyUser>? users;

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    try {
      users = await client.auth.getAllUsers();
      setState(() {});
    } catch (e) {
      print("Error fetching users: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select a User to Chat")),
      body: RefreshIndicator(
        onRefresh: _fetchUsers, // Pull to refresh feature
        child: users == null
            ? const Center(child: CircularProgressIndicator())
            : users!.isEmpty
            ? const Center(
          child: Text(
            'No users available',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        )
            : ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          itemCount: users!.length,
          itemBuilder: (context, index) {
            final user = users![index];

            if (user.uid == widget.currentUser.uid) {
              return const SizedBox.shrink(); // Hide current user
            }

            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text(user.name[0].toUpperCase(),
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                title: Text(
                  user.name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  user.email,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                trailing: const Icon(Icons.chat, color: Colors.blue),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(
                        user: widget.currentUser,
                        chatPartner: user,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}


