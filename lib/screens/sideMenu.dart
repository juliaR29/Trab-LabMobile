import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proj/components/orgs_menu_card.dart';
import 'package:proj/screens/favoritos.dart';
import 'package:proj/screens/listagemPets.dart';
import 'package:proj/screens/home.dart';
import 'animals_cad_screen.dart';
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
                'Menu',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 30),
              OrgsMenuCard(
                text: 'Início',
                icon: Icons.home,
                action: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                ),
              ),              
              Divider(),
              OrgsMenuCard(
                text: 'Cadastro de pets',
                icon: Icons.pets,
                action: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnimalsCadScreen()),
                ),
              ),
              Divider(),
              OrgsMenuCard(
                text: 'Listagem de pets',
                icon: Icons.pets,
                action: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListagemPets()),
                ),
              ),
              Divider(),
              OrgsMenuCard(
                text: 'Favoritos',
                icon: Icons.favorite,
                action: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Favoritos()),
                ),
              ),
              Divider(),
              OrgsMenuCard(
                text: 'Sair',
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