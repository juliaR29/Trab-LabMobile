import 'package:flutter/material.dart';

class CardHome extends StatelessWidget {
  final List<Widget> cards;
  final double heightList;

  CardHome({
    @required this.cards,
    @required this.heightList
  }): assert(cards != null),
      assert(heightList != null);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: heightList,
        child: new ListView(
            scrollDirection: Axis.horizontal,
            children: cards
        )
    );
  }
}

