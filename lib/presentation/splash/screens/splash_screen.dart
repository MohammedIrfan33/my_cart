import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_cart/core/configs/asset/app_colors.dart';
import 'package:my_cart/core/configs/theme/app_vectors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Image.asset('assets/logo.png'),
      ),
    );
  }

  Widget _buildSvgLogo() {
    try {
      return SvgPicture.asset(
        'assets/vectors/logo.svg',
        width: 100,
        height: 100,
        placeholderBuilder: (context) => const CircularProgressIndicator(color: Colors.white,),
      );
    } catch (e) {
      debugPrint('Failed to load SVG: $e');
      return const Icon(Icons.error, color: Colors.white);
    }
  }
}