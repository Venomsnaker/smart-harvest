import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:congnong/screen/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:congnong/screen/mainapp.dart';
import 'firebase_options.dart';



  
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Harvest',
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Text("Loading"),
            );
          }
          if (snapshot.hasData) {
            return SafeArea(child: MainApp());
          } else {
            return AuthScreen();
          }
        },
      ),
    );
  }
}
