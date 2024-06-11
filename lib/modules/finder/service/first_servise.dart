import 'package:flutter/material.dart';
import 'package:leasure_buddy/modules/navigationbar/navigationbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstViewServise {
  Future<void> navigateToHome(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenSplash', true);
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => const Navigationbar()),
    );
  }
}
