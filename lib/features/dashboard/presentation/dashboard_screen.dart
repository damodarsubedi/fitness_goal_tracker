import 'package:flutter/material.dart';
import 'package:gym_goal_tracker/features/dashboard/widgets/completion_chart.dart';
import 'package:gym_goal_tracker/features/dashboard/widgets/goal_summary_card.dart';
import 'package:gym_goal_tracker/features/dashboard/widgets/dashboard_header.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DashboardHeader(),
              const SizedBox(height: 24),
              const CompletionChart(),
              const SizedBox(height: 24),
              const GoalSummaryCard(
                title: "Steps",
                progress: 0.7,
                icon: Icons.directions_walk,
                unit: "7000 / 10000 steps",
              ),
              const SizedBox(height: 16),
              const GoalSummaryCard(title: "Water Intake", progress: 0.5, icon: Icons.water_drop, unit: "1.5L / 3L"),
              const SizedBox(height: 16),
              const GoalSummaryCard(
                title: "Calories Burned",
                progress: 0.8,
                icon: Icons.local_fire_department,
                unit: "400 / 500 cal",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
