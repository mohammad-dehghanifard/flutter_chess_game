import 'package:flutter/material.dart';
import 'package:flutter_chess_game/gen/assets.gen.dart';
import 'package:flutter_chess_game/view/game_board.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const GameBoardView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.brown,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.icons.logo.path),
             SizedBox(height: size.height * 0.04),
             const SpinKitWaveSpinner(
              trackColor: Colors.white,
              waveColor: Colors.orange,
              color: Colors.black,
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
