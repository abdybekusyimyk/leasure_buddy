import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0a0035),
      appBar: AppBar(
        backgroundColor: const Color(0xff0a0035),
        leading: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
          ),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'SF-Pro-Display',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 2),
            Image.asset(
              'assets/images/notifications.png',
              width: 105,
            ),
            const SizedBox(height: 10),
            const Text(
              'You don’t have new notifications',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'SF-Pro-Display',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const Spacer(flex: 6),
          ],
        ),
      ),
    );
  }
}
