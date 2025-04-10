import 'package:serverpod/serverpod.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../generated/protocol.dart';

class AuthEndpoint extends Endpoint {

  Future<bool> verifyGoogleSignIn(Session session, String googleId, String idToken) async {
    try {
      // Verify ID token with Google’s API
      final response = await http.get(
        Uri.parse("https://oauth2.googleapis.com/tokeninfo?id_token=$idToken"),
      );

      if (response.statusCode != 200) {
        throw Exception("Invalid Google ID Token");
      }

      final Map<String, dynamic> tokenData = jsonDecode(response.body);

      // Check if user exists in the database
      print(tokenData);
      var existingUser = await MyUser.db.findFirstRow(
        session,
        where: (u) => u.uid.equals(googleId),
      );

      if (existingUser == null) {
        // Store new user
        var newUser = MyUser(
          uid: googleId,
          email: tokenData['email'] ?? '',
          name: tokenData['name'] ?? '',
          createdAt: DateTime.now(),
        );

        await MyUser.db.insertRow(session, newUser);
      }

      return true;
    } catch (e) {
      print("Google Sign-In Verification Failed: $e");
      return false;
    }
  }
  Future<List<MyUser>> getAllUsers(Session session) async {
    return await MyUser.db.find(session);
  }

}
