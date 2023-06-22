import 'package:flutter/material.dart';
import 'package:flutter_chess_game/component/helper_function.dart';
import 'package:flutter_chess_game/model/chess_piece.dart';
import 'package:flutter_chess_game/widget/square.dart';

import '../gen/assets.gen.dart';

class GameBoardView extends StatefulWidget {
  const GameBoardView({Key? key}) : super(key: key);

  @override
  State<GameBoardView> createState() => _GameBoardViewState();
}

class _GameBoardViewState extends State<GameBoardView> {
  @override
  Widget build(BuildContext context) {
    ChessPiece myPiece = ChessPiece(type: ChessPieceType.pawn, iconPath: Assets.icons.chessPawn.path, isWhite: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 8 * 8,  // تعداد کل عناصر در GridView (64 عنصر)
          physics: const NeverScrollableScrollPhysics(),  // غیرفعال کردن امکان اسکرول کردن GridView
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),  // تعیین تنظیمات جدول (8 ستون)
          itemBuilder: (context, index) => Square(isWhite: isWhite(index),piece: myPiece) // ایجاد عنصر مربعی با رنگ مشخص شده
        ),
      ),

    );
  }
}
