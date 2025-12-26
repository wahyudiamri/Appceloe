class NotificationItem {
  final String title;
  final String message;
  final bool isUrgent;

  NotificationItem({
    required this.title,
    required this.message,
    this.isUrgent = false,
  });
}
