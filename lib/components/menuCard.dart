import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function() action;

  MenuCard({
    @required this.icon,
    @required this.text,
    @required this.action,
  }): assert(icon != null),
      assert(text != null);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 16, 95, 160),
                borderRadius: BorderRadius.circular(5),
              ),
              width: 40,
              height: 40,
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ),
            SizedBox(width: 25),
            Text(
             text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400
              ),
            )
          ],
        ),
      ),
    );
  }
}
