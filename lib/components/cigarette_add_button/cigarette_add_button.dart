import 'package:flutter/material.dart';
import 'cigarette_add_button_style.dart';

class CigaretteAddButton extends StatelessWidget {
  final VoidCallback onTap;

  const CigaretteAddButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: CigaretteAddButtonStyle.size,
        height: CigaretteAddButtonStyle.size,
        decoration: CigaretteAddButtonStyle.decoration,
        child: const Icon(
          Icons.smoking_rooms,
          size: CigaretteAddButtonStyle.iconSize,
          color: CigaretteAddButtonStyle.iconColor,
        ),
      ),
    );
  }
}
