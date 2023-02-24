
import 'package:flutter/material.dart';

extension BuildContextMapping on BuildContext {

  showMaterialSnackBar(
      String content, {
        Color? backgroundColor,
        Color? color,
      }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        content: Text(
          content,
          style: TextStyle(
            color: color ?? Theme.of(this).colorScheme.onSurface,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor ?? Theme.of(this).colorScheme.surface,
        elevation: 20,
      ),
    );
  }



}