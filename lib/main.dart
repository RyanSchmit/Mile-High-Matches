import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:milehighmatch/pages/auth.dart';
import 'package:milehighmatch/pages/discover.dart';
import 'package:milehighmatch/pages/info.dart';
import 'package:milehighmatch/pages/messages.dart';
import 'package:milehighmatch/pages/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Future checkUserStatus() async {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return null;
      } else {
        var userDoc =
            FirebaseFirestore.instance.collection("profiles").doc(user.uid);
        return await userDoc.get().then((snapshot) => snapshot.exists);
      }
    }

    return MaterialApp(
        theme: ThemeData(
            // Change to const Color.fromRGBO(255, 115, 115, 1)
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)),
        title: "Mile High Matches",
        home: DefaultTabController(
            length: 3,
            child: FutureBuilder(
              future: checkUserStatus(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const AuthPage();
                } else if (snapshot.data == true) {
                  return const Views();
                } else {
                  return const InfoPage();
                }
              },
            )));
  }
}

class Views extends StatelessWidget {
  const Views({super.key});

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      // Remove shadow
      shape: const LinearBorder(),
      bottom: const TabBar(tabs: [
        Padding(
          padding: EdgeInsets.only(bottom: 40.0),
          child: Tab(icon: Icon(Icons.airplanemode_on, size: 45.0)),
        ),
        Padding(
            padding: EdgeInsets.only(bottom: 40.0),
            child: Tab(icon: Icon(Icons.message_rounded, size: 45.0))),
        Padding(
            padding: EdgeInsets.only(bottom: 40.0),
            child: Tab(icon: Icon(Icons.person, size: 45.0))),
      ]),
    );

    return Scaffold(
      body: const TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          DiscoverPage(),
          MessagesPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: appBar.preferredSize.height,
        child: appBar,
      ),
    );
  }
}
