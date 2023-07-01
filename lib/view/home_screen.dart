import 'package:flutter/material.dart';
import 'package:flutter_chess_game/gen/assets.gen.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.brown[600],
      body: Column(
        children: [
          SizedBox(height: size.height * 0.24),
          Image.asset(Assets.icons.logo.path),

          // start game btn
          Container(
            width: size.width,
            height: size.height * 0.06,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.brown[400],
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.brown.shade900,width: 4)
            ),
            child:  Center(child: Text("شروع بازی جدید",style: GoogleFonts.vazirmatn(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold))),
          )
        ],
      ),
    );
  }
}
