import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../view/game_board.dart';

Future<dynamic> inputPlayerNameDialog(BuildContext context, Size size) {
  final TextEditingController playerOneTxtController =
  TextEditingController();
  final TextEditingController playerTowTxtController =
  TextEditingController();

  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Names of the players",
          style: GoogleFonts.adamina(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.brown[100])),
      backgroundColor: Colors.brown[600],
      actions: [
        // player 1 text field
        SizedBox(
          width: size.width,
          height: size.height * 0.05,
          child: TextField(
            controller: playerOneTxtController,
            style: GoogleFonts.adamina(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.brown[100]),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(6),
              filled: true,
              fillColor: Colors.brown[400],
              hintStyle: GoogleFonts.adamina(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[100]),
              hintText: "player 1 name....",
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
            ),
          ),
        ),

        SizedBox(height: size.height * 0.02),
        // player 2 text field
        SizedBox(
          width: size.width,
          height: size.height * 0.05,
          child: TextField(
            controller: playerTowTxtController,
            style: GoogleFonts.adamina(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.brown[100]),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(6),
              filled: true,
              fillColor: Colors.brown[400],
              hintText: "player 2 name....",
              hintStyle: GoogleFonts.adamina(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[100]),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
            ),
          ),
        ),

        SizedBox(height: size.height * 0.02),

        Center(
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStatePropertyAll(Colors.brown[800])),
              onPressed: () {
                if (playerOneTxtController.text.isNotEmpty &&
                    playerTowTxtController.text.isNotEmpty) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GameBoardView()));
                }
              },
              child: Text("Start Game",
                  style: GoogleFonts.adamina(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[100]))),
        )
      ],
    ),
  );
}
