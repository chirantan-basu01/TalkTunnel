import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/services/auth/auth_gate.dart';
import 'package:chat_app/services/chat/chat_service.dart';

import 'package:chat_app/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyBwmbxzJXaHSmxcn_8abVI8TJn2Y-kBQj0',
          appId: '1:475277708591:android:685560544569057ddf25da',
          messagingSenderId: '475277708591',
          projectId: 'chatapp-7db80'));
  await ChatService().initNotifications();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      navigatorKey: navigatorKey,
      routes: {
        '/home_page': (context) => HomePage(),
      },
    );
  }
}
