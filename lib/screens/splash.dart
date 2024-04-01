import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircleAvatar(
          radius: 80,
          backgroundImage:
              AssetImage('assets/images/stephenwenceslao-placeholder2.png'),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
