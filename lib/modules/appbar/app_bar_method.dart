import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leasure_buddy/modules/appbar/notifications_view.dart';
import 'package:leasure_buddy/modules/appbar/settings_view.dart';

class AppBarMethod {
  static appBarMethod(BuildContext context, String text) {
    return AppBar(
      backgroundColor: const Color(0xff0a0035),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationsView(),
                ),
              );
            },
            child: const Icon(
              Icons.notifications_outlined,
              color: Colors.white,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'SF-Pro-Display',
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          GestureDetector(
            onTap: () {
              showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsView(),
                        ),
                      );
                    },
                    child: AlertDialog(
                      backgroundColor: const Color(0xff17036B),
                      titlePadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      alignment: Alignment.topRight,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      title: Row(
                        children: [
                          const Text(
                            'Get Premium',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 5),
                          SvgPicture.asset('assets/svg/crown-svg.svg')
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
