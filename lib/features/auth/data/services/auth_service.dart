import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_data_class.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login(UserDataClass user) async {
    await _auth.signInWithEmailAndPassword(
      email: user.email.trim(),
      password: user.password.trim(),
    );
  }

  Future<void> register(UserDataClass user) async {
    await _auth.createUserWithEmailAndPassword(
      email: user.email.trim(),
      password: user.password.trim(),
    );
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
