import 'package:flutter/material.dart';
import 'cbd_add_button_style.dart';

class CbdAddButton extends StatelessWidget {
  final VoidCallback onTap;

  const CbdAddButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: CbdAddButtonStyle.size,
        height: CbdAddButtonStyle.size,
        decoration: CbdAddButtonStyle.decoration,
        child: const Icon(
          Icons.smoking_rooms,
          size: CbdAddButtonStyle.iconSize,
          color: CbdAddButtonStyle.iconColor,
        ),
      ),
    );
  }
}
