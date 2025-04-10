import 'package:dartz/dartz.dart';
import 'package:my_cart/data/sorce/firebase_auth_service.dart';
import 'package:my_cart/service_locactor.dart';

import '../../../domain/repository/auth/auth_repo.dart';
import '../../models/auth/user_model.dart';

class AuthImplRepo extends  AuthRepo {
  @override
  Future<Either> signup(User? user) {
    return sl<FirebaseAuthService>().signUp(user);
  }
  
}