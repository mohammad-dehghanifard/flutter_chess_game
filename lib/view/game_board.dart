import 'package:flutter/material.dart';
import 'package:flutter_chess_game/widget/square.dart';

class GameBoardView extends StatefulWidget {
  const GameBoardView({Key? key}) : super(key: key);

  @override
  State<GameBoardView> createState() => _GameBoardViewState();
}

class _GameBoardViewState extends State<GameBoardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount: 8 * 8,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
          itemBuilder: (context, index) {

          int y = index % 8;
          int x = index ~/ 8;
          bool isWhite = (x + y) % 2 == 0;

          return Square(isWhite: isWhite);

          },
      ),
    );
  }
}
