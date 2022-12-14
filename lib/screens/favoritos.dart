import 'package:flutter/material.dart';
import 'package:proj/components/menuDrawer.dart';
import 'package:proj/components/favoriteCard.dart';
import 'package:proj/models/dataModel.dart';
import 'package:proj/repository/data.dart';
import 'package:proj/screens/petsDetails.dart';

class Favoritos extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Favoritos',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 16, 95, 160)
                    ),
                  ),
                  IconButton(
                    color: Colors.transparent,
                    icon: Icon(Icons.menu, color: Colors.black),
                    onPressed: () => _scaffoldKey.currentState.openDrawer(),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: FutureBuilder(
                  future: _generateProducerList(context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: snapshot.data,
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              )
              ],
            ),
          ),
      ),
    );
  }

  Future _generateProducerList(BuildContext context) async {
    List<Widget> children = [];
    final data = await Data.getJson2();
    final producers = data["producers"];

    for(final producer in producers.keys) {

      final prod = DataModel.fromJson(producers[producer]);

      children.add(FavoriteCard(
        action: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PetsDetailsScreen(producer: prod)),
        ),
        img: prod.logo,
        title: prod.name,
      ));

      children.add(SizedBox(height: 10));
    }

    return children;
  }
}