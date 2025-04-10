import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/auth/user_model.dart';

abstract class FirebaseAuthService {
  Future<Either> signUp(User ?user);
}

class FirebaseAuthServiceImpl extends FirebaseAuthService {
  final fb_auth.FirebaseAuth _firebaseAuth = fb_auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Either> signUp(User? user) async {
    try {
      // 1. Sign up with Firebase Auth
      if(user != null){
        final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      // 2. Get the user UID
      final String uid = credential.user!.uid;

      // 3. Store additional user data in Firestore
      await _firestore.collection('users').doc(uid).set({
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return Right('Registration success');
      }else{
        return Left('Fill full field');
      }
    } on fb_auth.FirebaseAuthException catch (e) {
      return Left(e.message) ;
    } catch (e) {
       return Left(e);

    }
  }
}
