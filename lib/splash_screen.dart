import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller!, curve: Curves.easeIn);

    _controller!.forward();

    _navigateToNextScreen();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 4));
    Navigator.pushReplacementNamed(context, '/signupViaAadhar'); // Corrected route name
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation!,
          child: Image.asset('assets/icons/tandhanlogo.png'),
        ),
      ),
    );
  }
}
