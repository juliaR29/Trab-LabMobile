import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proj/screens/home.dart';
import 'package:proj/screens/cadastro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../firebase_options.dart';
import '../login_controllers/fire_auth.dart';
import '../login_controllers/validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final passwordController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

    User user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Home(
            user: user,
          ),
        ),
      );
    }

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
          body: FutureBuilder(
              future: _initializeFirebase(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return SingleChildScrollView(
                    child:
                    Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/A-Logo.jpg',
                          fit: BoxFit.fitWidth,
                          width: double.maxFinite,
                          height: 250,
                        ),                       
                        Container(
                          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                          color: Colors.white,
                          child: TextFormField(
                            decoration: const InputDecoration(
                                label: Text('Email'), hintText: 'email@email.com'),
                            controller: _emailTextController,
                            focusNode: _focusEmail,
                            validator: (value) =>
                                Validator.validateEmail(email: value),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                          color: Colors.white,
                          child: TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Senha'),
                            controller: passwordController,
                            focusNode: _focusPassword,
                            obscureText: true,
                            validator: (value) =>
                                Validator.validatePassword(password: value),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              
                              padding: const EdgeInsets.all(8),
                                child: Text(
                                  'Esqueci minha senha',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 7, 19, 173),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(100, 40, 100, 10),
                          child: ConstrainedBox(
                            constraints:
                                BoxConstraints.tightFor(width: double.infinity),
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  User user =
                                      await FireAuth.signInUsingEmailPassword(
                                    email: _emailTextController.text,
                                    password: passwordController.text,
                                  );
                                  if (user != null) {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => Home()),
                                    );
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 16, 95, 160), 
                              ),
                              child: Text('LOGIN'),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: GestureDetector(
                            onTap: () async {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignupScreen()),
                                  (route) => false);
                            },
                            child: Container(
                              width: double.maxFinite,
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                  child: Text(
                                'Não possui conta? Cadastre-se',
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
                  ));
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              })),
    );
  }
}
