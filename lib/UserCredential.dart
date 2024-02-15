import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential> signInWithFirebase(String email, String password) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No se encuentra el usuario');
    } else if (e.code == 'wrong-password') {
      print('Contraseña Incorrecta');
    }
    rethrow;
  }
}

Future<UserCredential> registerWithFirebase(
    String email, String password) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      print('Ya hay una cuenta registrada');
    }
    rethrow;
  }
}
