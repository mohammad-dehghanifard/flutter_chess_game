class ChessPiece {
  final ChessPieceType type;
  final bool isWhite;
  final String iconPath;

  ChessPiece({required this.type, required this.iconPath, required this.isWhite});
}

enum ChessPieceType { bishop,king,knight,pawn,queen,rook }
