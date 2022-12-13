import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proj/components/menuCard.dart';
import 'package:proj/screens/favoritos.dart';
import 'package:proj/screens/home.dart';
import 'petsForm.dart';
import 'login.dart';

class Menu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'MENU',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 16, 95, 160)
                ),
              ),
              SizedBox(height: 30),
              MenuCard(
                text: 'INÍCIO',
                icon: Icons.home,
                action: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                ),
              ),              
              Divider(),
              MenuCard(
                text: 'CADASTRO DE PETS',
                icon: Icons.pets,
                action: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PetsForm()),
                ),
              ),
              Divider(),
              MenuCard(
                text: 'FAVORITOS',
                icon: Icons.favorite,
                action: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Favoritos()),
                ),
              ),
              Divider(),
              MenuCard(
                text: 'SAIR',
                icon: Icons.logout,
                action: () => { _signOut(), Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(builder: (context) => new LoginScreen()),
                  (route) => false,
                ), },
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}