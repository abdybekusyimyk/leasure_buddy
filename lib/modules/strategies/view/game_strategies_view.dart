import 'package:flutter/material.dart';
import 'package:leasure_buddy/models/game_strategies_model.dart';
import 'package:leasure_buddy/modules/appbar/app_bar_method.dart';
import 'package:leasure_buddy/modules/strategies/view/game_strategies_detail_view.dart';

class GameStrategiesView extends StatelessWidget {
  const GameStrategiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0a0035),
      appBar: AppBarMethod.appBarMethod(
        context,
        'Game Tutorials and Strategies',
      ),
      body: ListView.builder(
        itemCount: gameStrategies.length,
        itemBuilder: (context, index) {
          final gameList = gameStrategies[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GameStrategiesDetailView(
                    gameStrategiesModel: gameList,
                  ),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                color: const Color(0xff02015D),
                border: Border.all(
                  color: const Color(0xff0907C0),
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              padding: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            gameList.title,
                            style: const TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            textAlign: TextAlign.start,
                            gameList.description,
                            style: const TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xff1ec931),
                            Color(0xff0ebef3),
                          ],
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.navigate_next_rounded,
                          size: 33,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
