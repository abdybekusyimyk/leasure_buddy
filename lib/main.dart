import 'package:flutter/material.dart';
import 'package:leasure_buddy/modules/finder/view/first_view.dart';
import 'package:leasure_buddy/modules/navigationbar/navigationbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seenSplash = prefs.getBool('seenSplash') ?? false;

  runApp(MyApp(seenSplash: seenSplash));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.seenSplash});

  final bool seenSplash;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: seenSplash ? const Navigationbar() : const FirstView(),
    );
  }
}
