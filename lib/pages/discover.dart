import 'package:flutter/material.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {

  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final List<String> _names = ["Jen", "Jill", "Dona", "Rachael", "Palmer"];

  final List<String> _bios = [
    "I like to fly.",
    "I want to travel.",
    "When I are we going on a trip",
    "Where is your favorite trip?",
    "I love to travel."
  ];

  final List<Image> _images = [
    Image.asset("assets/images/discover0.png"),
    Image.asset("assets/images/discover0.png"),
    Image.asset("assets/images/discover0.png"),
    Image.asset("assets/images/discover0.png"),
    Image.asset("assets/images/discover0.png"),
  ];

  @override
  void initState() {
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(SwipeItem(
          content: MatchCard(name: _names[i], bio: _bios[i], image: _images[i]),
          likeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Liked ${_names[i]}"),
              duration: const Duration(milliseconds: 500),
            ));
          },
          nopeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Nope ${_names[i]}"),
              duration: const Duration(milliseconds: 500),
            ));
          },
          superlikeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Superliked ${_names[i]}"),
              duration: const Duration(milliseconds: 500),
            ));
          },
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        _swipeItems[index].content.image,
                        Text(_swipeItems[index].content.name,
                            style: const TextStyle(
                                fontSize: 35, color: Colors.white)),
                        Text(_swipeItems[index].content.bio,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white)),
                      ]),
                    );
                  },
                  onStackFinished: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("No more possible matches found."),
                      duration: Duration(milliseconds: 500),
                    ));
                  },
                  itemChanged: (SwipeItem item, int index) {
                    print("item: ${item.content.name}, index: $index");
                  },
                  leftSwipeAllowed: true,
                  rightSwipeAllowed: true,
                  upSwipeAllowed: true,
                  fillSpace: true,
                  likeTag: Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.green)),
                    child: const Text('Like'),
                  ),
                  nopeTag: Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.red)),
                    child: const Text('Nope'),
                  ),
                  superLikeTag: Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.orange)),
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
        ));
  }
}

class MatchCard {
  final String? name;
  final String? bio;
  final Image? image;

  MatchCard({this.name, this.bio, this.image});
}
