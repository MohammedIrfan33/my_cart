

import 'package:get_it/get_it.dart';
import 'package:my_cart/core/usecase/use_case.dart';
import 'package:my_cart/data/repository/auth/auth_impl_repo.dart';
import 'package:my_cart/domain/repository/auth/auth_repo.dart';
import 'package:my_cart/domain/usecase/auth_use_case.dart';

import 'data/sorce/firebase_auth_service.dart';

final  sl = GetIt.instance;


Future<void> initializeDependencies() async{
  //services
  sl.registerSingleton<FirebaseAuthService>(FirebaseAuthServiceImpl());
  //repository
  
  sl.registerSingleton<AuthRepo>(AuthImplRepo());

  //use case
  sl.registerSingleton<UseCase>(SignUpUseCase());

   

}