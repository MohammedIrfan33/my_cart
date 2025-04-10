import 'package:dartz/dartz.dart';
import 'package:my_cart/data/models/auth/user_model.dart';

abstract  class AuthRepo {

  Future<Either> signup(User user);
}