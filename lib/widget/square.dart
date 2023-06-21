import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  const Square({Key? key, required this.isWhite}) : super(key: key);
  final bool isWhite;
  @override
  Widget build(BuildContext context) {
    return Container(
    color: isWhite ? Colors.grey[200] : Colors.grey[500],
    );
  }
}
