import 'package:flutter/material.dart';
import 'package:testapp/storage/storage.dart';

class SplashScreen extends StatefulWidget {
  final Storage storage;

  const SplashScreen({super.key, required this.storage});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.storage.hasSub()) {
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        Navigator.of(context).pushReplacementNamed('/paywall');
      }
    });
  }

  @override
  Widget build(Object context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator(color: Colors.white)),
    );
  }
}
