import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proj/components/orgs_highlights_card.dart';
import 'package:proj/components/orgs_cards_list.dart';
import 'package:proj/components/SearchBarMenu.dart';
import 'package:proj/components/orgs_spotlight_card.dart';
import 'package:proj/components/cardPets.dart';
import 'package:proj/components/orgs_drawer.dart';
import 'package:proj/models/producer_model.dart';
import 'package:proj/repository/data.dart';
import 'package:proj/screens/producer_details_screen.dart';

class Home extends StatefulWidget {
  final User user;

  const Home({this.user});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User _currentUser;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[100],
      drawer: OrgsDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                     'assets/images/A-Logo.jpg',
                    height: kToolbarHeight, // mudar isso e arrumar o tamanho da img
                  ),
                  IconButton(
                    color: Colors.transparent,
                    icon: Icon(Icons.menu, color: Colors.black),
                    onPressed: () => _scaffoldKey.currentState.openDrawer(),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              
              SearchBarMenu(),
              SizedBox(height: 10),
              Text(
                'Alguns favoritos:',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              FutureBuilder(
                future: _generateHighlightsCards(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              SizedBox(height: 10),
              Text(
                'Animais em destaque',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey),
              ),
              SizedBox(height: 10),
              FutureBuilder(
                future: _generateSpotlightCards(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Future _generateProducerList(BuildContext context) async {
    List<Widget> children = [];
    final data = await Data.getJson();
    final producers = data["producers"];

    for (final producer in producers.keys) {
      final prod = Producer.fromJson(producers[producer]);

      children.add(CardPets(
        action: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProducerDetailsScreen(producer: prod)),
        ),
        img: prod.logo,
        title: prod.name,
      ));

      children.add(SizedBox(height: 10));
    }

    return children;
  }

  Future<OrgsCardsList> _generateHighlightsCards() async {
    List<Widget> children = [];
    final data = await Data.getJson();
    final highlights = data["highlights"];

    for (final highlight in highlights) {
      children.add(OrgsHighlightsCard(
        img: highlight["image"],
        title: highlight["name"],
        description: highlight["description"],
        color: Colors.pink,
        btnAction: () {},
      ));
    }

    return OrgsCardsList(heightList: 160, cards: children);
  }

  Future<OrgsCardsList> _generateSpotlightCards() async {
    List<Widget> children = [];
    final data = await Data.getJson();
    final spotlights = data["spotlights"];

    for (final spotlight in spotlights) {
      children.add(OrgsSpotlightCard(
          img: spotlight["image"],
          description: spotlight["description"],
          color: Colors.blueAccent));
    }

    return OrgsCardsList(heightList: 140, cards: children);
  }
}
