import 'package:flutter/material.dart';

Future<dynamic> finishGameDialog({required BuildContext context,required Function() onTap}) {
  return showDialog(context: context, builder: (context) => AlertDialog(
    title: const Text('بازی تموم شد رفیق...'),
    backgroundColor: Colors.grey[300],
    actions: [
      TextButton(
          onPressed: onTap,
          child: const Text("شروع مجدد بازی")),
      TextButton(
          onPressed: () {},
          child: const Text("برگشت به صفحه اصلی")),
    ],
  ),);
}