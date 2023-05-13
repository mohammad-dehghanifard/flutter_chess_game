// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'custom_btn.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.brown)
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chess Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}


class HomeScreen extends StatefulWidget{
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ChessBoardController controller = ChessBoardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        elevation: 0,
        title: Text('Chess Game',style: TextStyle(color: Colors.brown.shade50,fontSize: 24,fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                  child: Center(
                    child: ChessBoard(
                      controller: controller,
                      boardColor: BoardColor.darkBrown,
                      boardOrientation: PlayerColor.white,
                    ),
                  ),

              ),

              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  [
                  // restart game
                  CustomBottom(
                    onTap: () {},
                    child:  Icon(CupertinoIcons.repeat,color: Colors.brown.shade100),
                  ),
                  // undo
                  CustomBottom(
                    onTap: () {},
                    child:  Icon(Icons.cancel_rounded,color: Colors.brown.shade100),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}


