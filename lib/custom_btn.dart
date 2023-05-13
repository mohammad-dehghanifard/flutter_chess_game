import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({
    super.key, required this.onTap, required this.child,
  });
  final Function() onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.brown.shade400
        ),
        child: child,
      ),
    );
  }
}