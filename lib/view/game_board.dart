import 'package:flutter/material.dart';
import 'package:flutter_chess_game/widget/square.dart';

class GameBoardView extends StatefulWidget {
  const GameBoardView({Key? key}) : super(key: key);

  @override
  State<GameBoardView> createState() => _GameBoardViewState();
}

class _GameBoardViewState extends State<GameBoardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: 8 * 8,  // تعداد کل عناصر در GridView (64 عنصر)
        physics: const NeverScrollableScrollPhysics(),  // غیرفعال کردن امکان اسکرول کردن GridView
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),  // تعیین تنظیمات جدول (8 ستون)
        itemBuilder: (context, index) {

          int y = index % 8;  // محاسبه شماره ستون براساس شماره عنصر
          int x = index ~/ 8;  // محاسبه شماره ردیف براساس شماره عنصر
          // عملگر ~/ برای تقسیم دو عدد به صورتی استفاده می‌شود که فقط بخش صحیح نتیجه تقسیم باقی می‌ماند و اعشار حذف می‌شود.

          bool isWhite = (x + y) % 2 == 0;  // تشخیص رنگ مربع بر اساس موقعیت ستون و ردیف

          return Square(isWhite: isWhite);  // ایجاد عنصر مربعی با رنگ مشخص شده
        },
      ),

    );
  }
}
