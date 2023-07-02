import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameButton extends StatelessWidget {
  const GameButton({
    super.key,
    required this.size, required this.title, required this.onTap,
  });

  final Size size;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width,
        height: size.height * 0.06,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.brown[400],
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: Colors.brown.shade900,blurRadius: 0,offset: const Offset(0,5))
            ]
        ),
        child:  Center(child: Text(title,style: GoogleFonts.adamina(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold))),
      ),
    );
  }
}