import 'package:flutter/material.dart';
import 'package:leasure_buddy/modules/appbar/app_bar_method.dart';
import 'package:leasure_buddy/modules/tracker/view/tracker_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LetsStartView extends StatefulWidget {
  const LetsStartView({super.key});

  @override
  State<LetsStartView> createState() => _LetsStartViewState();
}

class _LetsStartViewState extends State<LetsStartView> {
  @override
  void initState() {
    super.initState();
    checkIfFirstTime(context);
  }

  Future<void> checkIfFirstTime(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (!isFirstTime) {
      // ignore: use_build_context_synchronously
      navigateToTrackerView(context);
    }
  }

  Future<void> setFirstTimeFlag() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false);
  }

  void navigateToTrackerView(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const TrackerView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0a0035),
      appBar: AppBarMethod.appBarMethod(
        context,
        'Loyalty Program Wallet',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Spacer(),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 150,
                  height: 80,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white54,
                        spreadRadius: 5,
                        blurRadius: 70,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/lets.png',
                  width: 192,
                  height: 231,
                ),
              ],
            ),
            const Spacer(),
            const Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: 'The Budget Tracker ',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      color: Color(0xffFFB624),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text:
                        '''in the Casino Buddy is designed to help you manage spending during casino visits effectively. It's a crucial feature for promoting responsible gaming and financial planning.''',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 2),
            GestureDetector(
              onTap: () async {
                setFirstTimeFlag();
                navigateToTrackerView(context);
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff1ec932),
                      Color(0xff0db3e3),
                    ],
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Let’s Start',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
