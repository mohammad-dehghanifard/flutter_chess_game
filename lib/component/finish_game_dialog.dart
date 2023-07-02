import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<dynamic> finishGameDialog({required BuildContext context,required Function() onTap}) {
  return showDialog(context: context, builder: (context) => AlertDialog(
    title:  Text('Restart Game?',style: GoogleFonts.adamina(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown[100]),),
    backgroundColor: Colors.brown[400],
    actions: [
      TextButton(
          onPressed: onTap,
          style: ButtonStyle(
            overlayColor: MaterialStatePropertyAll(Colors.brown[100])
          ),
          child: Text('Yes',style: GoogleFonts.adamina(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown[100]),)),
      TextButton(
          style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(Colors.brown[100])
          ),
          onPressed: () {Navigator.pop(context);},
          child: Text('No',style: GoogleFonts.adamina(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown[100]),)),
    ],
  ),);
}