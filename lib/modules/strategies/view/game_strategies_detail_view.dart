import 'package:flutter/material.dart';
import 'package:leasure_buddy/models/game_strategies_model.dart';

class GameStrategiesDetailView extends StatelessWidget {
  const GameStrategiesDetailView({
    super.key,
    required this.gameStrategiesModel,
  });

  final GameStrategiesModel gameStrategiesModel;

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
              )),
        ),
        title: Text(
          gameStrategiesModel.title,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              gameStrategiesModel.strategiesDetailModel.image,
              width: double.infinity,
              height: 250,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    gameStrategiesModel.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    gameStrategiesModel.strategiesDetailModel.text,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
