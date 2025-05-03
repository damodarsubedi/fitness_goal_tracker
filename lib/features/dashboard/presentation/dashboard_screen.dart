import 'package:flutter/material.dart';
import 'package:gym_goal_tracker/core/constants/colors.dart';
import 'package:gym_goal_tracker/features/dashboard/widgets/completion_chart.dart';
import 'package:gym_goal_tracker/features/dashboard/widgets/goal_summary_card.dart';
import 'package:gym_goal_tracker/features/dashboard/widgets/dashboard_header.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.bluishWhite,

        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Padding wrapper for the header
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(child: const DashboardHeader()),
            ),
            // Completion Chart
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              sliver: SliverToBoxAdapter(child: const CompletionChart()),
            ),
            // Goal Summary Cards
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              sliver: SliverList(
                delegate: SliverChildListDelegate.fixed([
                  const GoalSummaryCard(
                    title: "Steps",
                    progress: 0.7,
                    icon: Icons.directions_walk,
                    unit: "7000 / 10000 steps",
                  ),
                  const SizedBox(height: 16),
                  const GoalSummaryCard(
                    title: "Water Intake",
                    progress: 0.5,
                    icon: Icons.water_drop,
                    unit: "1.5L / 3L",
                  ),
                  const SizedBox(height: 16),
                  const GoalSummaryCard(
                    title: "Push-ups",
                    progress: 0.75,
                    icon: Icons.self_improvement_outlined,
                    unit: "75 / 100 reps",
                  ),
                  const SizedBox(height: 16),
                  const GoalSummaryCard(
                    title: "Meditation",
                    progress: 1,
                    icon: Icons.self_improvement_outlined,
                    unit: "30 / 30 min",
                  ),
                  const SizedBox(height: 16),
                  const GoalSummaryCard(
                    title: "Calories Burned",
                    progress: 0.8,
                    icon: Icons.local_fire_department,
                    unit: "400 / 500 cal",
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
