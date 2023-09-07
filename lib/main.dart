import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mile High Matches",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mile High Matches"),
      ),
      body: Column(children: [MyTitle(), SubTitle()]),
    );
  }
}

class MyTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Mile High Matches");
  }
}

class SubTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Find love before you fly");
  }
}
