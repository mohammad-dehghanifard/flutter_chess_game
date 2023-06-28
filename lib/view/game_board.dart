import 'package:flutter/material.dart';
import 'package:flutter_chess_game/component/helper_function.dart';
import 'package:flutter_chess_game/constant/colors.dart';
import 'package:flutter_chess_game/model/chess_piece.dart';
import 'package:flutter_chess_game/model/dead_piece.dart';
import 'package:flutter_chess_game/widget/square.dart';
import '../gen/assets.gen.dart';

class GameBoardView extends StatefulWidget {
  const GameBoardView({Key? key}) : super(key: key);

  @override
  State<GameBoardView> createState() => _GameBoardViewState();
}

class _GameBoardViewState extends State<GameBoardView> {
  //================ variables =================================================
  late List<List<ChessPiece?>> board; // ایجاد برد خالی
  List<List<int>> validatePieceMove = []; // مسیر های حرکت مجاز مهره های روی گیم برد
  ChessPiece? selectedChessPiece; // مهره ای که در حال حاضر کاربر انتخاب کرده
  // از اونجا که در ابتدا نباید هیچکدوم از خونه ها انتخاب شده باشن از -1 برای مقدار دهی اولیه استفاده میشه
  int selectedRow = -1;
  int selectedColumn = -1;
  bool isWhiteTurn = true; // برای مشخص کردن نوبت بازیکن

  // لیست مهره های حذف شده سیاه و سفید
  List<ChessPiece> withePieceTaken = [];
  List<ChessPiece> blackPieceTaken = [];

  //================ Functions =================================================
  // مقدار دهی اولیه گیم برد
  void _initialBoard(){
    // یک لیست جدید برای بردر با 8 ردیف و 8 ستون ایجاد میکنه
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
  // در صورتی که داخل خونه ای که روش کلیک شده مهره ای باشه اون خونه رو انتخاب میکنه
  void _selectPiece(int row,int col){
    setState(() {
      if(selectedChessPiece == null && board[row][col]!= null){
        if(board[row][col]!.isWhite == isWhiteTurn){
          selectedChessPiece = board[row][col];
          selectedRow = row;
          selectedColumn = col;
        }
      }

      else if(board[row][col]!= null && board[row][col]!.isWhite == selectedChessPiece!.isWhite){
        selectedChessPiece = board[row][col];
        selectedRow = row;
        selectedColumn = col;
      }

      // در صورتی که کاربر یک مهره رو انتخاب کرده باشه و مهره مجاز به حرکت باشه، مهره به خونه جدید منتقل میشه
      else if(
      selectedChessPiece != null && validatePieceMove.any((element) => element[0] == row && element[1] == col)){
        pieceMovement(newRow: row, newCol: col);
      }

      // در صورتی که مهره انتخاب شده باشه مسیر های حرکت مجاز نمایش داده میشن
      validatePieceMove = _calculateRawValidMove(row: selectedRow, col: selectedColumn, piece: selectedChessPiece!);
    });
  }
  // محسابه مسیر های حرکت مجاز مهره ها
  List<List<int>> _calculateRawValidMove({required int row,required int col,required ChessPiece? piece}){
    List<List<int>> candidateMove = []; // مسیر های قابل حرکت
    int direction = piece!.isWhite ? -1 : 1; // به دست اوردن موقعیت اولیه مهره ها
    // محسابه مسیر حرکت بر اساس نوع مهره بازی
    switch(piece.type) {
      case ChessPieceType.bishop:
      // مشخص کردن مسیر پیشنهادی حرکت فیل
        var bishopValidateDirection = [
          [-1,-1], // up left
          [-1,1], // up right
          [1,-1], // down left
          [1,1] //down right
        ];
        for(var direction in bishopValidateDirection){
          var i = 1;
          while(true){
            var newRow = row + i * direction[0];
            var newCol = col + i * direction[1];
            if(!isInBoard(newRow,newCol)){
              break;
            }
            if(board[newRow][newCol] != null){
              if(board[newRow][newCol]!.isWhite != piece.isWhite){
                candidateMove.add([newRow,newCol]); // زدن مهره رقیب
              }
              break;
            }
            candidateMove.add([newRow,newCol]);
            i++;
          }
        }
        break;
      case ChessPieceType.king:
        // مشخص کردن مسیر حرکت پادشاه
        var kingValidateDirection = [
          [-1,0], // up
          [1,0], // down
          [0,-1], // left
          [0,1], // right
          [-1,-1], // up left
          [-1,1], // up right
          [1,-1], // down left
          [1,1] // down right
        ];
        for(var direction in kingValidateDirection){
          var newRow = row +  direction[0];
          var newCol = col +  direction[1];

          if(!isInBoard(newRow,newCol)){
            continue;
          }
          if(board[newRow][newCol] != null){
            if(board[newRow][newCol]!.isWhite != piece.isWhite){
              candidateMove.add([newRow,newCol]); // زدن مهره های بازیکن مقابل
            }
            continue;
          }
          candidateMove.add([newRow,newCol]);
        }
        break;
      case ChessPieceType.knight:
        // مشخص کردن مسیر پیشنهادی حرکت اسب
        var knightValidDirection = [
          [-2,-1], // up 2 left 1
          [-2,1], // up 2 right 1
          [-1,-2], // up 1 left 2
          [-1,2], // up 1 right 2
          [1,-2], // down 1 left 2
          [1,2], //down 1 right 2
          [2,-1], //down 2 left 1
          [2,1] // down 2 right 1
        ];
        for(var direction in knightValidDirection){
            var newRow = row +  direction[0];
            var newCol = col +  direction[1];

            if(!isInBoard(newRow,newCol)){
              continue;
            }
            if(board[newRow][newCol] != null){
              if(board[newRow][newCol]!.isWhite != piece.isWhite){
                candidateMove.add([newRow,newCol]); // زدن مهره های بازیکن مقابل
              }
              continue;
            }
            candidateMove.add([newRow,newCol]);

        }
        break;
      case ChessPieceType.pawn:
        //در صورتی که خونه های جلویی سرباز ها پر نباشه میتونن به جلو حرکت کنن
        if(isInBoard(row + direction,col) && board[row + direction][col] == null){
          candidateMove.add([row + direction,col]);
        }
        //در صورتی که سرباز ها داخل موقعیت اولیه خودشون باشن میتونن 2 خونه به جلو حرکت کنن
        if(row == 1 && !piece.isWhite || (row == 6 && piece.isWhite)){
          if(
          isInBoard(row + 2 * direction,col) &&
          board[row + 2 * direction][col] == null &&
          board[row + direction][col] == null
          ){
            candidateMove.add([row + 2 * direction,col]);
          }
        }
        // در صورتی که سرباز بتونه یکی از مهره های رقیب رو بزنه
        if(isInBoard(row + direction,col - 1) && board[row + direction][col - 1] != null && board[row + direction][col - 1]!.isWhite){
          candidateMove.add([row + direction,col - 1]);
        }
        if(isInBoard(row + direction,col + 1) && board[row + direction][col + 1] != null && board[row + direction][col + 1]!.isWhite){
          candidateMove.add([row + direction,col + 1]);
        }
        break;
      case ChessPieceType.queen:
        // مشخص کردن مسیر های حرکت پیشنهادی ملکه
        var queenValidateDirection = [
          [-1,0], // up
          [1,0], // down
          [0,-1], // left
          [0,1], // right
          [-1,-1], //up left
          [-1,1], //up right
          [1,-1], // down left
          [1,1] // down right
        ];
        for(var direction in queenValidateDirection){
          var i = 1;
          while(true){
            var newRow = row + i * direction[0];
            var newCol = col + i * direction[1];

            if(!isInBoard(newRow,newCol)){
              break;
            }
            if(board[newRow][newCol] != null){
              if(board[newRow][newCol]!.isWhite != piece.isWhite){
                candidateMove.add([newRow,newCol]); // زدن مهره های بازیکن مقابل
              }
              break;
            }
            candidateMove.add([newRow,newCol]);
            i++;
          }
        }
        break;
      case ChessPieceType.rook:
        // مشخص کردن مسیر حرکت پیشنهادی مهره قلعه
        var rookDirections = [
          [-1,0], // up
          [1,0], // down
          [0,-1], // left
          [0,1] // right
        ];
        for(var direction in rookDirections){
          var i = 1;
          while(true){
            var newRow = row + i * direction[0];
            var newCol = col + i * direction[1];

            if(!isInBoard(newRow,newCol)){
              break;
            }
            if(board[newRow][newCol] != null){
              if(board[newRow][newCol]!.isWhite != piece.isWhite){
                candidateMove.add([newRow,newCol]); // زدن مهره های بازیکن مقابل
              }
              break;
            }
            candidateMove.add([newRow,newCol]);
            i++;
          }
        }
        break;
    }

    return candidateMove;
  }
  // حرکت مهره ها
  void pieceMovement({required int newRow,required int newCol}){
    if(board[newRow][newCol] != null){
      // اضافه کرده مهره حذف شده به لیست
      var pieceKilled = board[newRow][newCol];
      if(pieceKilled!.isWhite){
        withePieceTaken.add(pieceKilled);
      }else{
        blackPieceTaken.add(pieceKilled);
      }
    }
    // حرکت مهمره به خونه جدید و خالی کردن خونه قبلی
  board[newRow][newCol] = selectedChessPiece;
  board[selectedRow][selectedColumn] = null;
  // برگشت به حالت اولیه
  setState(() {
    selectedChessPiece = null;
    selectedRow = -1;
    selectedColumn = -1;
    validatePieceMove = [];
  });
  // تغییر نوبت بازیکن
  isWhiteTurn = !isWhiteTurn;
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
        child: Column(
          children: [

            // لیست مهره های حذف شده سیاه
            Expanded(
              child: GridView.builder(
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
                  itemCount: blackPieceTaken.length,
                  itemBuilder: (context, index)  => DeadPiece(iconPath:blackPieceTaken[index].iconPath,isWhite: false)),
            ),
            // صفحه اصلی بازی
            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: 8 * 8,  // تعداد کل عناصر در GridView (64 عنصر)
                physics: const NeverScrollableScrollPhysics(),  // غیرفعال کردن امکان اسکرول کردن GridView
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),  // تعیین تنظیمات جدول (8 ستون)
                itemBuilder: (context, index) {

                 int boardRow = index ~/ 8;
                 int boardColumn = index % 8;
                 bool isSelected = selectedRow == boardRow && selectedColumn == boardColumn;

                 //مشخص کردن این که آیا مهره انتخاب شده مسیر حرکت پیشنهادی داره یا خیر
                 bool validateMove = false;
                 for(var position in validatePieceMove){
                   if(position[0] == boardRow && position[1] == boardColumn){
                     validateMove = true;
                   }
                 }
                  return Square(
                      onTap: () => _selectPiece(boardRow,boardColumn),
                      isSelected: isSelected,
                      isValidateMove: validateMove,
                      isWhite: isWhite(index),
                      piece: board[boardRow][boardColumn]
                  );
                } // ایجاد عنصر مربعی با رنگ مشخص شده
              ),
            ),

            // لیست مهره های حذف شده سفید
            Expanded(
              child: GridView.builder(
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
                  itemCount: withePieceTaken.length,
                  itemBuilder: (context, index)  => DeadPiece(iconPath:withePieceTaken[index].iconPath,isWhite: true)),
            ),
          ],
        ),
      ),

    );
  }
}
