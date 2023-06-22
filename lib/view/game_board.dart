import 'package:flutter/material.dart';
import 'package:flutter_chess_game/component/helper_function.dart';
import 'package:flutter_chess_game/constant/colors.dart';
import 'package:flutter_chess_game/model/chess_piece.dart';
import 'package:flutter_chess_game/widget/square.dart';

import '../gen/assets.gen.dart';

class GameBoardView extends StatefulWidget {
  const GameBoardView({Key? key}) : super(key: key);

  @override
  State<GameBoardView> createState() => _GameBoardViewState();
}

class _GameBoardViewState extends State<GameBoardView> {
  //================ variables =================================================
  late List<List<ChessPiece?>> board;

  //================ Functions =================================================
  void _initialBoard(){
    List<List<ChessPiece?>> newBoard = List.generate(8,(index) => List.generate(8,(index) => null));

    // قرار دادن مهره سرباز روی جدول
    for(int i = 0; i < 8; i++){
      newBoard[1][i] = ChessPiece(type: ChessPieceType.pawn, iconPath: Assets.icons.chessPawn.path, isWhite: false);
      newBoard[6][i] = ChessPiece(type: ChessPieceType.pawn, iconPath: Assets.icons.chessPawn.path, isWhite: true);
    }

    // قرار دادن قلعه های سیاه روی جدول
    newBoard[0][0] = ChessPiece(type: ChessPieceType.rook, iconPath: Assets.icons.chessRook.path, isWhite: false);
    newBoard[0][7] = ChessPiece(type: ChessPieceType.rook, iconPath: Assets.icons.chessRook.path, isWhite: false);

    // قرار دادن قلعه های سفید روی جدول
    newBoard[7][0] = ChessPiece(type: ChessPieceType.rook, iconPath: Assets.icons.chessRook.path, isWhite: true);
    newBoard[7][7] = ChessPiece(type: ChessPieceType.rook, iconPath: Assets.icons.chessRook.path, isWhite: true);

    // قرار دادن اسب های سیاه روی جدول
    newBoard[0][1] = ChessPiece(type: ChessPieceType.knight, iconPath: Assets.icons.chessKnight.path, isWhite: false);
    newBoard[0][6] = ChessPiece(type: ChessPieceType.knight, iconPath: Assets.icons.chessKnight.path, isWhite: false);

    // قرار دادن اسب های سیاه روی جدول
    newBoard[7][1] = ChessPiece(type: ChessPieceType.knight, iconPath: Assets.icons.chessKnight.path, isWhite: true);
    newBoard[7][6] = ChessPiece(type: ChessPieceType.knight, iconPath: Assets.icons.chessKnight.path, isWhite: true);

    // قرار دادن مهره فیل های سیاه روی جدول
    newBoard[0][2] = ChessPiece(type: ChessPieceType.bishop, iconPath: Assets.icons.chessBishop.path, isWhite: false);
    newBoard[0][5] = ChessPiece(type: ChessPieceType.bishop, iconPath: Assets.icons.chessBishop.path, isWhite: false);

    // قرار دادن مهره فیل های سفید روی جدول
    newBoard[7][2] = ChessPiece(type: ChessPieceType.bishop, iconPath: Assets.icons.chessBishop.path, isWhite: true);
    newBoard[7][5] = ChessPiece(type: ChessPieceType.bishop, iconPath: Assets.icons.chessBishop.path, isWhite: true);

    // قرار دادن مهره ملکه  سیاه روی جدول
    newBoard[0][3] = ChessPiece(type: ChessPieceType.queen, iconPath: Assets.icons.chessQueen.path, isWhite: false);

    // قرار دادن مهره ملکه  سفید روی جدول
    newBoard[7][3] = ChessPiece(type: ChessPieceType.queen, iconPath: Assets.icons.chessQueen.path, isWhite: true);

    // قرار دادن مهره شاه  سیاه روی جدول
    newBoard[0][4] = ChessPiece(type: ChessPieceType.king, iconPath: Assets.icons.chessKing.path, isWhite: false);

    // قرار دادن مهره شاه  سیاه روی جدول
    newBoard[7][4] = ChessPiece(type: ChessPieceType.king, iconPath: Assets.icons.chessKing.path, isWhite: true);

    board = newBoard;
  }



  @override
  void initState() {
    _initialBoard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 8 * 8,  // تعداد کل عناصر در GridView (64 عنصر)
          physics: const NeverScrollableScrollPhysics(),  // غیرفعال کردن امکان اسکرول کردن GridView
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),  // تعیین تنظیمات جدول (8 ستون)
          itemBuilder: (context, index) {
           int boardRow = index ~/ 8;
           int boardColumn = index % 8;
            return Square(isWhite: isWhite(index),piece: board[boardRow][boardColumn]);
          } // ایجاد عنصر مربعی با رنگ مشخص شده
        ),
      ),

    );
  }
}
