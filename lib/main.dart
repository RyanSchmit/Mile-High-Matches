import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:milehighmatch/pages/auth.dart';
import 'package:milehighmatch/pages/discover.dart';
import 'package:milehighmatch/pages/messages.dart';
import 'package:milehighmatch/pages/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)),
      title: "Mile High Matches",
      home: DefaultTabController(
        length: 3,
        child: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return const Views();
                  } else {
                    return const AuthPage();
                  }
                }))
    );
  }
}

class Views extends StatelessWidget {
  const Views({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const TabBar(tabs: [
          Tab(icon: Icon(Icons.airplanemode_on)),
          Tab(icon: Icon(Icons.message_rounded)),
          Tab(icon: Icon(Icons.person))
        ]),
      ),
      body: const TabBarView(
        children: [
          DiscoverPage(),
          MessagesPage(),
          ProfilePage(),
        ],
      ),
    );
  }
}