import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_cart/presentation/splash/bloc/splash_state.dart';

class SplashCubit  extends Cubit<SplashState>{
  SplashCubit():super(DisplaySpash());

  void appStarted() async{

    await Future.delayed(Duration(seconds: 4));

    emit(Unauthenticated());
  }
    
}