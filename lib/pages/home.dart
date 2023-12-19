import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:
          Center(child: Column(children: [MyTitle(), SubTitle(), Airplane()])),
    );
  }
}

class MyTitle extends StatelessWidget {
  const MyTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Center(child:Text(
      "Mile High Matches",
      style: TextStyle(fontSize: 60),
    ));
  }
}

class SubTitle extends StatelessWidget {
  const SubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Find love before you fly",
      style: TextStyle(fontSize: 25),
    );
  }
}

class Airplane extends StatelessWidget {
  const Airplane({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.airplane_ticket,
      color: Colors.blue,
      size: 100,
    );
  }
}

