import 'package:flutter/material.dart';

class GoalSummaryCard extends StatelessWidget {
  final String title;
  final double progress;
  final IconData icon;
  final String unit;

  const GoalSummaryCard({
    super.key,
    required this.title,
    required this.progress,
    required this.icon,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Increased elevation for better shadow contrast
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Theme.of(context).colorScheme.surface, // Light background color for the card
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: .1),
              child: Icon(icon, color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface, // Adjusted color for text
                    ),
                  ),
                  const SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: progress,
                    color: Theme.of(context).colorScheme.primary,
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: .1), // Light background for progress bar
                  ),
                  const SizedBox(height: 4),
                  Text(
                    unit,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface, // Ensure text is visible
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
