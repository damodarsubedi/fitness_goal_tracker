import 'package:flutter/material.dart';

class CompletionChart extends StatelessWidget {
  const CompletionChart({super.key});
  final double complete = 75;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: CircularProgressIndicator(
              value: complete / 100,
              strokeWidth: 15,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.primary),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$complete%',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text('Goal Completed', style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
