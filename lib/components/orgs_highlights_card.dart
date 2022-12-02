import 'package:flutter/material.dart';
import 'package:proj/core/app_images.dart';

class OrgsHighlightsCard extends StatelessWidget {
  final String img;
  final String title;
  final Color color;
  final String description;
  final void Function() btnAction;

  OrgsHighlightsCard({
    @required this.img,
    @required this.title,
    @required this.description,
    @required this.color,
    @required this.btnAction
  }): assert(img != null),
      assert(title != null),
      assert(description != null),
      assert(color != null),
      assert(btnAction != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Container(
        width: 450,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
        ),

        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child:   Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AppImages.logo,
                    width: 30,
                  ),
                  SizedBox(height: 5),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey
                    ),
                  ),
                  Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: btnAction,
                    child: Text(
                      'Ver agora',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(child: Image.asset(img)),
            ],
          ),
        ),
      ),
    );
  }
}