
import 'package:flutter/material.dart';
import 'package:flutter_chess_game/constant/colors.dart';
import 'package:flutter_chess_game/model/chess_piece.dart';

class Square extends StatelessWidget {
  const Square(
      {Key? key, required this.isWhite, this.piece, required this.isSelected, required this.onTap, required this.isValidateMove})
      : super(key: key);
  final bool isWhite;
  final ChessPiece? piece;
  final bool isSelected;
  final bool isValidateMove;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final Color squareColor;
    if (isSelected) {
      squareColor = AppColors.selectedSquareColor;
    } else if(isValidateMove){
      squareColor = AppColors.validateMoveSquareColor;
    }
    else {
      squareColor = isWhite? AppColors.chessBoardWhite : AppColors.chessBoardBlack;
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: squareColor,
        padding: const EdgeInsets.all(8),
        margin: EdgeInsets.all(isValidateMove ? 2 : 0),
        child: piece != null
            ? Image.asset(piece!.iconPath,
                color: piece!.isWhite ? Colors.white : Colors.black)
            : null,
      ),
    );
  }
}
