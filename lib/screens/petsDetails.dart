import 'package:flutter/material.dart';
import 'package:proj/models/dataModel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PetsDetailsScreen extends StatelessWidget {
  final DataModel producer;
  PetsDetailsScreen({@required this.producer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 26, 24, 24),
        title: Text(
          'Informações do pet',
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 80, 0, 15),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      child: Image.asset(producer.logo),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Text(
                producer.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              )),
          SizedBox(
            width: 30,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(producer.description,
                style: TextStyle(color: Colors.black, fontSize: 18)),
          ),
          SizedBox(height: 25),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 228, 33, 179),
                  foregroundColor: Colors.white),
              child: Text('Quero adotar!'),
              onPressed: () {
                 showToastMessage("Adotado!");
                _inserir();
              },
            ),
          ),
        ],
      ),
    );
  }
  
  void showToastMessage(String message){
     Fluttertoast.showToast(
        msg: message, //message to show toast
        toastLength: Toast.LENGTH_LONG, //duration for message to show
        gravity: ToastGravity.CENTER, //where you want to show, top, bottom
        timeInSecForIosWeb: 1, //for iOS only
        //backgroundColor: Colors.red, //background Color for message
        textColor: Colors.black, //message text color
        fontSize: 16.0 //message font size
    );
  }

}

void _inserir() async {
  print('adotado!');
}
