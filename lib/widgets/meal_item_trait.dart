import 'package:flutter/material.dart';

class Meal_item_trait extends StatelessWidget {
  const Meal_item_trait({super.key, required this.icon, required this.label});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: Colors.white,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
