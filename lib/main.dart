import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/screens/HomeScreen.dart';
import 'package:testapp/screens/PaywallScreen.dart';
import 'package:testapp/screens/SplashScreen.dart';
import 'package:testapp/storage/storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final Storage storage = Storage(storage: prefs);

  runApp(
    MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => SplashScreen(storage: storage),
        "/home": (context) => HomeScreen(),
        "/paywall": (context) => PaywallScreen(storage: storage,),
      },
    ),
  );
}
