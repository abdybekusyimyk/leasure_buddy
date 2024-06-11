import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leasure_buddy/modules/strategies/view/game_strategies_view.dart';
import 'package:leasure_buddy/modules/tracker/view/lets_start_view.dart';
import 'package:leasure_buddy/modules/wallet/view/loyalty_program_wallet.dart';

class Navigationbar extends StatefulWidget {
  const Navigationbar({super.key});

  @override

  // ignore: library_private_types_in_public_api
  _NavigationbarState createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Navigationbar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    const MyWidget1(),
    const LoyaltyProgramWallet(),
    const GameStrategiesView(),
    const LetsStartView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildIcon(String assetName, int index) {
    return SvgPicture.asset(
      assetName,
      // ignore: deprecated_member_use
      color: _selectedIndex == index ? Colors.white : const Color(0xff5A5265),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeIn,
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.red,
        useLegacyColorScheme: false,
        backgroundColor: const Color(0xff0E011F),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildIcon(
              'assets/svg/map-pin.svg',
              0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(
              'assets/svg/bet-card.svg',
              1,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(
              'assets/svg/bet-casino.svg',
              2,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(
              'assets/svg/wallet-svgrepo.svg',
              3,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}

class MyWidget1 extends StatelessWidget {
  const MyWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
