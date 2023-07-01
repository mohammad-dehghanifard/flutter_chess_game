import 'package:flutter/material.dart';
import 'package:flutter_chess_game/gen/assets.gen.dart';

import '../component/game_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.brown[600],
      body: Column(
        children: [
          SizedBox(height: size.height * 0.24),
          Image.asset(Assets.icons.logo.path),

          // start game btn
          GameButton(
              title: "شروع بازی جدید",
              onTap: () {},
              size: size)
        ],
      ),
    );
  }
}

