import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_cart/core/configs/asset/app_colors.dart';
import 'package:my_cart/core/configs/theme/app_vectors.dart';
import 'package:my_cart/presentation/auth/screens/sigin_screen.dart';
import 'package:my_cart/presentation/splash/bloc/splash_cubit.dart';
import 'package:my_cart/presentation/splash/bloc/splash_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit,SplashState>(
      child: Scaffold(
          backgroundColor: AppColors.primary,
          body: Center(
            child: Image.asset('assets/logo.png'),
          ),
        ),
      listener: (context,state) {
        if(state is  Unauthenticated){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SiginScreen(),));
          
        }
         
      }
    );
  }


}