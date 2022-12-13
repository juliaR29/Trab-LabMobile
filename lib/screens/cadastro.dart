import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../firebase_options.dart';
import '../login_controllers/fire_auth.dart';
import '../login_controllers/validator.dart';
import 'home.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,);
  }

  final _registerFormKey = GlobalKey<FormState>();

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final passwordController = TextEditingController();

  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusName.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
          body: SingleChildScrollView(
              child:
              Form(
                key: _registerFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/A-Logo.jpg',
                      fit: BoxFit.fitWidth,
                      width: double.maxFinite,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: TextFormField(
                        controller: _nameTextController,
                        focusNode: _focusName,
                        validator: (value) => Validator.validateName(
                          name: value,
                        ),
                        decoration: InputDecoration(
                            hintText: 'Nome'),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: TextFormField(
                        controller: _emailTextController,
                        focusNode: _focusEmail,
                        validator: (value) => Validator.validateEmail(
                          email: value,
                        ),
                        decoration: InputDecoration(
                            hintText: 'Email'),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: TextFormField(
                        controller: passwordController,
                        focusNode: _focusPassword,
                        obscureText: true,
                        validator: (value) => Validator.validatePassword(
                          password: value,
                        ),
                        decoration: InputDecoration(
                            hintText: 'Senha'),
                      ),
                    ),
                    
                    Container(
                      padding: EdgeInsets.fromLTRB(100, 40, 100, 10),
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: double.infinity),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_registerFormKey.currentState.validate()) {
                              User user = await FireAuth.registerUsingEmailPassword(
                                name: _nameTextController.text,
                                email: _emailTextController.text,
                                password: passwordController.text,
                              );
                              if (user != null) {
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => Home(user: user),
                                  ),
                                  ModalRoute.withName('/'),
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 16, 95, 160), // foreground
                          ),
                          child: Text('CADASTRAR'),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        ),
                        child: Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.all(8),
                          child: Center(
                              child: Text(
                                'Já possui conta? Fazer login',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 16, 95, 160),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
