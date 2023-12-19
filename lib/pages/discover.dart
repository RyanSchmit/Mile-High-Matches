import 'package:flutter/material.dart';
import 'dart:math';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 0, 134, 243),
        Color.fromARGB(255, 243, 0, 0),
      ], transform: GradientRotation(pi / 2))),
      child: const Center(child: MatchCard()),
    );
  }
}

class MatchCard extends StatelessWidget {
  const MatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Image.asset('assets/images/discover.png')),
      Container(
          decoration:
              const BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1)),
              height: 70.0,
              width: 340.0,
              child: const MatchInfo())
    ]);
  }
}

class MatchInfo extends StatelessWidget {
  const MatchInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(children: [
      Column(children: [
        Padding(padding: EdgeInsets.only(left: 10.0, right: 200.0), child: Text("Roma")),
        Padding(padding: EdgeInsets.only(left: 10.0, right: 200.0), child: Text("Gate 5"))
      ]),
      Column(children: [
        Text("Till Boarding"),
        Text("02:12:45")])
    ]);
  }
}
