import 'package:flutter/material.dart';
import 'package:flutter_chess_game/gen/assets.gen.dart';


import '../component/game_button.dart';
import '../component/input_player_name_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.brown[600],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.24),
            Image.asset(Assets.icons.logo.path),
            // start game btn
            GameButton(
                title: "Start New Game",
                onTap: () => inputPlayerNameDialog(context, size),
                size: size),
            // shop btn
            GameButton(
                title: "Item Shop",
                onTap: () {},
                size: size),
            // help btn
            GameButton(
                title: "Help",
                onTap: () {},
                size: size),
          ],
        ),
      ),
    );
  }

}
