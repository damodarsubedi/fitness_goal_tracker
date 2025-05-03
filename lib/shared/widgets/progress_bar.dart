import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double percentage;
  final Color color;

  const ProgressBar({super.key, required this.percentage, required this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 8,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.grey[800], borderRadius: BorderRadius.circular(12)),
        ),
        Container(
          height: 8,
          width: percentage * MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
        ),
      ],
    );
  }
}
