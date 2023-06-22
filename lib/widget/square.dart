
import 'package:flutter/material.dart';
import 'package:flutter_chess_game/model/chess_piece.dart';

class Square extends StatelessWidget {
  const Square({Key? key, required this.isWhite, this.piece}) : super(key: key);
  final bool isWhite;
  final ChessPiece? piece;
  @override
  Widget build(BuildContext context) {
    return Container(
    color: isWhite ? Colors.grey[400] : Colors.grey[600],
     padding: const EdgeInsets.all(8),
     child: piece != null ? Image.asset(piece!.iconPath,color: piece!.isWhite? Colors.white : Colors.black) : null,
    );
  }
}
