import 'package:flutter/material.dart';
import 'package:flutter_chess_game/constant/colors.dart';

class DeadPiece extends StatelessWidget {
  const DeadPiece({Key? key, required this.iconPath, required this.isWhite}) : super(key: key);
  final String iconPath;
  final bool isWhite;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(iconPath,color: isWhite ? AppColors.whiteColor : AppColors.blackColor),
    );
  }
}
