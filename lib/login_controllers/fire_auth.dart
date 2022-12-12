import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FireAuth {
  static Future<User> registerUsingEmailPassword({
    String name,
    String email,
    String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user.updateDisplayName(user.displayName);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('Senha fraca');
      } else if (e.code == 'email-already-in-use') {
        print('Já existe uma conta com este email.');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  static Future<User> signInUsingEmailPassword({
    String email,
    String password,
    BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Usuário inexistente ou email incorreto.');
      } else if (e.code == 'wrong-password') {
        print('Senha incorreta');
      }
    }
    return user;
  }

  static Future<User> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User refreshedUser = auth.currentUser;

    return refreshedUser;
  }
}