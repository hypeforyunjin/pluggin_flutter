import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';  // Pastikan mengimpor AutoSizeText

class RedTextWidget extends StatelessWidget {
  final String text; // Menambahkan properti untuk teks

  // Konstruktor untuk menerima parameter teks
  const RedTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,  // Menggunakan teks yang diberikan
      style: const TextStyle(color: Colors.red, fontSize: 14),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
