import 'package:flutter/material.dart';
import 'package:appceloe/models/notification_item.dart';
import 'package:appceloe/widgets/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  final List<NotificationItem> notifications;

  const NotificationScreen({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return NotificationCard(notification: notifications[index]);
      },
    );
  }
}
