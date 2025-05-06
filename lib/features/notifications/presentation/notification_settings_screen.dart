import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_goal_tracker/features/notifications/widgets/notification_tiles.dart';

final pushNotificationEnabledProvider = StateProvider<bool>((ref) => true);
final dailyReminderEnabledProvider = StateProvider<bool>((ref) => false);
final goalCompletionAlertsProvider = StateProvider<bool>((ref) => true);

class NotificationSettingsPage extends ConsumerWidget {
  const NotificationSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pushEnabled = ref.watch(pushNotificationEnabledProvider);
    final dailyReminder = ref.watch(dailyReminderEnabledProvider);
    final goalAlerts = ref.watch(goalCompletionAlertsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Notification Settings"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildSectionTitle("General"),
          buildToggleTile(
            context,
            icon: Icons.notifications_active_outlined,
            title: "Push Notifications",
            subtitle: "Allow all push alerts from the app",
            value: pushEnabled,
            onChanged: (val) => ref.read(pushNotificationEnabledProvider.notifier).state = val,
          ),
          const SizedBox(height: 16),

          buildSectionTitle("Reminders"),
          buildToggleTile(
            context,
            icon: Icons.alarm_outlined,
            title: "Daily Reminders",
            subtitle: "Remind me to review my fitness goals",
            value: dailyReminder,
            onChanged: (val) => ref.read(dailyReminderEnabledProvider.notifier).state = val,
          ),
          buildToggleTile(
            context,
            icon: Icons.emoji_events_outlined,
            title: "Goal Completion Alerts",
            subtitle: "Notify me when a goal is completed",
            value: goalAlerts,
            onChanged: (val) => ref.read(goalCompletionAlertsProvider.notifier).state = val,
          ),

          const SizedBox(height: 32),
          ElevatedButton.icon(
            icon: const Icon(Icons.save),
            label: const Text("Save Settings"),
            onPressed: () {
              // Save logic to Firestore or local storage
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Settings saved")));
            },
          ),
        ],
      ),
    );
  }
}
