
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:websocket_example_client/websocket_example_client.dart';
import 'package:websocket_example_flutter/screens/sign_in_screen.dart';
import 'package:websocket_example_flutter/theme.dart';
import 'firebase_options.dart';

var client = Client('https://4d34-103-176-134-214.ngrok-free.app/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ChatAppTheme.lightTheme,
      darkTheme: ChatAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: SignInScreen(),
    );
  }
}



