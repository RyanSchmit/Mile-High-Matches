import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  late Future? querySnapshot;

  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('profiles');

  final List<Image> _images = [
    Image.asset("assets/images/discover0.jpg"),
    Image.asset("assets/images/discover1.png"),
    Image.asset("assets/images/discover2.png"),
    Image.asset("assets/images/discover3.png"),
    Image.asset("assets/images/discover4.jpg"),
  ];

  Future getPossibleMatches() async {
    QuerySnapshot querySnapshot = await collectionRef.get();
    final data = querySnapshot.docs.map((doc) => doc.data()).toList();
    return data;
  }

  @override
  void initState() {
    /// Here you set your querySnapshot to what you get from your database call
    querySnapshot = getPossibleMatches();
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPossibleMatches(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            for (int i = 0; i < 5; i++) {
              _swipeItems.add(SwipeItem(
                  content: MatchCard(
                      name: snapshot.data[i]['name'],
                      bio: snapshot.data[i]['bio'],
                      image: _images[0]),
                  likeAction: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Liked ${snapshot.data[i]['name']}"),
                      duration: const Duration(milliseconds: 500),
                    ));
                  },
                  nopeAction: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Nope ${snapshot.data[i]['name']}"),
                      duration: const Duration(milliseconds: 500),
                    ));
                  },
                  superlikeAction: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Superliked ${snapshot.data[i]['name']}"),
                      duration: const Duration(milliseconds: 500),
                    ));
                  },
                  onSlideUpdate: (SlideRegion? region) async {
                    print("Region $region");
                  }));
            }
            return Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Scaffold(
                  key: _scaffoldKey,
                  body: Padding(
                    padding: const EdgeInsets.only(bottom: 65.0),
                    child: Stack(children: [
                      Center(
                        child: SizedBox(
                          height: 550,
                          width: 300,
                          child: SwipeCards(
                            matchEngine: _matchEngine!,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                alignment: Alignment.center,
                                color: Colors.blue,
                                child: Column(children: [
                                  _images[0],
                                  Text(snapshot.data[index]['name'],
                                      style: const TextStyle(
                                          fontSize: 35, color: Colors.white)),
                                  Text(snapshot.data[index]['bio'],
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ]),
                              );
                            },
                            onStackFinished: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content:
                                    Text("No more possible matches found."),
                                duration: Duration(milliseconds: 500),
                              ));
                            },
                            itemChanged: (SwipeItem item, int index) {
                              print(
                                  "item: ${item.content.name}, index: $index");
                            },
                            leftSwipeAllowed: true,
                            rightSwipeAllowed: true,
                            upSwipeAllowed: true,
                            fillSpace: true,
                            likeTag: Container(
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green)),
                              child: const Text('Like'),
                            ),
                            nopeTag: Container(
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red)),
                              child: const Text('Nope'),
                            ),
                            superLikeTag: Container(
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.orange)),
                              child: const Text('Super Like'),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  _matchEngine!.currentItem?.nope();
                                },
                                child: const Text("Nope")),
                            ElevatedButton(
                                onPressed: () {
                                  _matchEngine!.currentItem?.superLike();
                                },
                                child: const Text("Superlike")),
                            ElevatedButton(
                                onPressed: () {
                                  _matchEngine!.currentItem?.like();
                                },
                                child: const Text("Like"))
                          ],
                        ),
                      )
                    ]),
                  )),
            );
          } else {
            // Future hasn't finished yet, return a placeholder
            return const Padding(
              padding: EdgeInsets.only(top: 500.0),
              child: Text('Loading'),
            );
          }
        });
  }
}

class MatchCard {
  final String? name;
  final String? bio;
  final Image? image;

  MatchCard({this.name, this.bio, this.image});
}
