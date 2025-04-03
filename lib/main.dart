import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_cart/core/configs/theme/app_theme.dart';
import 'package:my_cart/presentation/splash/bloc/splash_cubit.dart';
import 'package:my_cart/presentation/splash/screens/splash_screen.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),

      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.appTheme,
          
          home:SplashScreen(),
        ),
      
      
    );
  }
}

