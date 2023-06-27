import 'package:flutter/material.dart';
import 'package:flutter_chess_game/constant/colors.dart';

class DeadPiece extends StatelessWidget {
  const DeadPiece({Key? key, required this.iconPath, required this.isWhite}) : super(key: key);
  final String iconPath;
  final bool isWhite;
  @override
  Widget build(BuildContext context) {
    return Image.asset(iconPath,color: isWhite ? AppColors.chessBoardWhite : AppColors.chessBoardBlack);
  }
}
