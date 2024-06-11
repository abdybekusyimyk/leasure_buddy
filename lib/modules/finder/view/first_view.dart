import 'package:flutter/material.dart';
import 'package:leasure_buddy/modules/finder/service/first_servise.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0a0035),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Image.asset('assets/images/carts.png'),
              ),
              Expanded(child: Image.asset('assets/images/first_mon.png'))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const Spacer(flex: 8),
                Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(48),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white38,
                        spreadRadius: 1,
                        blurRadius: 100,
                        offset: Offset(2, 0),
                      ),
                    ],
                    border: Border.all(
                      color: const Color(0xff6F5718),
                      width: 4,
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xff3845DB),
                        Color(0xff010A6D),
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      ' WELCOME TO\nLeasure Buddy',
                      style: TextStyle(
                        color: Color(0xffC99F3B),
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(6, 6.2),
                            blurRadius: 13.0,
                            color: Colors.black38,
                          ),
                          Shadow(
                            offset: Offset(5.0, 5.0),
                            blurRadius: 13.0,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                GestureDetector(
                  onTap: () {
                    FirstViewServise().navigateToHome(context);
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
                        'Start',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Terms of Use',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
