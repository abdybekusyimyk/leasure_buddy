import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

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
          'Get Premium',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'SF-Pro-Display',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 200,
            child: Image.asset('assets/images/get.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const Spacer(),
                Image.asset('assets/images/get_premium.png'),
                const SizedBox(height: 12),
                const Text(
                  'Get Full Access',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF-Pro-Display',
                    fontWeight: FontWeight.w700,
                    fontSize: 40,
                  ),
                ),
                const Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'You can get',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SF-Pro-Display',
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: ' Budget Summary ',
                        style: TextStyle(
                          color: Color(0xffFD9650),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'SF-Pro-Display',
                        ),
                      ),
                      TextSpan(
                        text: 'in\n Premium tariff',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SF-Pro-Display',
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  textAlign: TextAlign.center,
                  'Get summary of your expenditures compared to the original budget, identifying areas of overspending or underspending.',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF-Pro-Display',
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                const Spacer(flex: 3),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 47,
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
                        'Get Premium for \$0.99',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SF-Pro-Display',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 47,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xff1ec932),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Restore Purchases',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SF-Pro-Display',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Terms of Use',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SF-Pro-Display',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SF-Pro-Display',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
