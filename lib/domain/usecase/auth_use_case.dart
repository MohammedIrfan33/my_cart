

import 'package:dartz/dartz.dart';
import 'package:my_cart/data/models/auth/user_model.dart';
import 'package:my_cart/data/repository/auth/auth_impl_repo.dart';

import '../../core/usecase/use_case.dart';
import '../../service_locactor.dart';

class SignUpUseCase extends UseCase<Either,User>{
  @override
  Future<Either> call({User ? params})async {
    return await sl<AuthImplRepo>().signup(params);
  }

  
}
