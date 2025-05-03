import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CompletionChart extends StatelessWidget {
  const CompletionChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 150, // Width of the chart
            height: 150, // Height of the chart
            child: PieChart(
              PieChartData(
                sectionsSpace: 0, // No space between sections for a clean curve
                centerSpaceRadius: 50, // Adjusts the space in the center
                centerSpaceColor: Colors.transparent, // Transparent space in the center
                borderData: FlBorderData(show: false), // Hides border for smoother look
                startDegreeOffset: 270, // Start from the top of the circle
                sections: [
                  PieChartSectionData(
                    value: 75, // 75% completed
                    color: Theme.of(context).colorScheme.primary, // Primary color for the filled portion
                    // title: '75%', // Percentage text inside the chart
                    titleStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text color to stand out on primary color
                    ),
                    radius: 70, // Radius of the filled section
                  ),
                  PieChartSectionData(
                    value: 25, // 25% remaining
                    color: Colors.grey.shade300, // Grey color for the remaining section
                    title: '', // No title for this section
                    radius: 70, // Same radius for the remaining section to match the filled portion
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '75%', // The progress value displayed in the center
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary, // Matches with theme's primary color
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Goal Completed', // Description below the chart
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[300], // Lighter text color for contrast
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
